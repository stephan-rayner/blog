+++
date = '2025-01-30T11:35:42-05:00'
draft = false
title = "DuckDB Has Replaced JQ For Me"
tags = ["database", "tools"]

[cover]
image = "images/duckdb-jq.jpg"
alt = "Mother duck with ducklings in the water"
+++

I reach for JQ almost every day. It's fast, it's everywhere, and for quick JSON inspection it's hard to beat. But somewhere along the way I started using DuckDB for anything more complex, and I don't plan to go back.

Here's how it works and when to use it.

## Getting Started

### Basic Setup

First, ensure you have DuckDB installed

```bash

# On macOS
brew install duckdb

# On Linux, Windows, or for you favourite programming language:
# Follow instructions here: https://duckdb.org/docs/installation/
```

### Sample Data

We'll use this example JSONL file (`data.jsonl`) throughout our examples:

```json

{"id": 1, "product": "Laptop", "price": 1200, "category": "Electronics", "in_stock": true}
{"id": 2, "product": "Mouse", "price": 25, "category": "Electronics", "in_stock": false}
{"id": 3, "product": "Desk Chair", "price": 150, "category": "Furniture", "in_stock": true}
{"id": 4, "product": "Coffee Mug", "price": 10, "category": "Kitchen", "in_stock": true}
```

### Common Operations

#### 1. Filtering Records

```sql

-- DuckDB
FROM read_json_auto('data.jsonl')
WHERE price > 100;

-- Equivalent JQ
cat data.jsonl | jq -c 'select(.price > 100)'
```

A minor thing I love about the SQL implementation in DuckDB, if you are writing `SELECT * FROM ...` you can drop the select and just use `FROM`.

#### 2. Aggregations

```sql

-- DuckDB
SELECT category, AVG(price) as avg_price 
FROM read_json_auto('data.jsonl') 
GROUP BY category;

-- Equivalent JQ
cat data.jsonl | jq -s 'group_by(.category) | map({category: .[0].category, avg_price: (map(.price) | add / length)})'
```

#### 3. Data Transformations

```sql

-- DuckDB
SELECT 
    product as item, 
    ROUND(price * 1.2, 2) as cost 
FROM read_json_auto('data.jsonl') 
WHERE in_stock = true;

-- Equivalent JQ
cat data.jsonl | jq -c 'select(.in_stock == true) | {item: .product, cost: (.price * 1.2)}'
```

## Why It Works For Me

- **SQL, not a new language**: I already know SQL. If I hand this off to someone else, they probably do too.
- **Columnar performance**: Large datasets don't make it sweat.
- **Type inference**: It figures out your types from the JSON automatically.
- **Multi-source queries**: Mix CSV, JSON, JSONL, and Parquet in one query, write to whatever format you need.

## Example

I have two files `data.jsonl` and `data.csv` that contain inventory similar to above. I need to read both files and write the result into a GitLab issue comment. Fortunately GitLab (and GitHub for that matter) support markdown. Lets switch it up and use the `-c` flag that duckdb offers. Here is how to do it:

```shell
 duckdb -markdown -c "
  FROM 'data.jsonl'
  UNION ALL
  FROM 'data.csv'"

| id |  product   | price |   category    | in_stock |
|---:|------------|------:|---------------|---------:|
| 1  | Laptop     | 1200  | Electronics   | true     |
| 2  | Mouse      | 25    | Electronics   | false    |
| 3  | Desk Chair | 150   | Furniture     | true     |
| 4  | Coffee Mug | 10    | Kitchen       | true     |
| 5  | Keyboard   | 200   | Electronics   | true     |
| 6  | Mouse Pad  | 15    | Miscellaneous | false    |
| 7  | Office Rug | 250   | Furniture     | true     |
| 8  | Tea Pot    | 70    | Kitchen       | true     |
```

I did not include a JQ example because you honestly can't do this with JQ. I suppose if you really wanted to use JQ you could do the following:

- Use DuckDB to convert the CSV file into JSONL
- Use JQ to merge the JSONL files into one JSONL file
- Use DuckDB (or other tool) to output it as a Markdown table

But at this point just use DuckDB and save yourself some trouble.

## When to Use What

Use DuckDB when:

- Working with large JSONL, JSON, CSV, or Parquet datasets
- Performing complex data operations
- Combining multiple data sources of the same or different file types
- Need for SQL-based analysis

Use JQ when:

- Quick command-line JSON transformations
- Simple filtering operations
- Pretty Printed JSON output (I still use JQ daily for this)
- Shell script integration

## Summary

If you're already comfortable with SQL, there's no real reason to struggle with JQ's syntax for complex transformations. DuckDB doesn't replace JQ entirely (I still use it daily for pretty-printing JSON), but for anything analytical or multi-source it's now my default.