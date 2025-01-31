+++
date = '2025-01-26T15:20:51-04:00'
draft = false
title = 'Column-Oriented vs Row-Oriented Databases: How to Avoid Looking Silly'
tags = ["database"]
+++

## Motivation

The motivation for this article comes from my time at a comically dysfunctional mobile game studio and particularly a rather brash "VP of Core Tech" who once went on at length longly, loudly, and publicly, about how poor a decision it was for the analytics department (not in any way shape or form connected to his division, responsibility, or experience) I lead to choose a SQL based database to use as our datalake. Given that we had chosen BigQuery, I was deeply confused by his rantings. That is to say, I was deeply confused until I realised he had conflated SQL with relational database management systems typically used for CRUD (Create, Read, Update, and Delete) operations. BigQuery is many things but that is absolutely not one of them, and by the end of this article you will understand why, when to use a tool like it, and importantly when not to.

## The More Polite Intro

Choosing SQL as a query language is a preference for me when I am choosing a database system. I do this for a few reasons but the simplest is that I already know it, and if I ever need to hand it off to someone else they probably know SQL as well. If by any happenstance they do not know SQL it is easy to learn and the internet is replete with resources to help them.

When choosing a database that leverages SQL as its query language, one of the critical considerations is whether to use a **column-oriented** or **row-oriented** database. Each is optimized for specific use cases and particular workloads, and understanding their differences can help you make an informed decision.

------

## **Row-Oriented: The Transactional Storyteller**

Think of row-oriented databases like a traditional bookshelf. Each book (row) sits complete on the shelf, with all its chapters (columns) together. This makes perfect sense when you want to grab a single book and read it cover to cover. Storing data by rows, meaning that all fields of a single record are stored together on disk is intuitive and mirrors the logical structure of a traditional table.

### **Best Use Case:**

Row-oriented databases excel in transactional workloads, occasionally called OLTP (**Online Transaction Processing**), where operations involve frequent, small read/write transactions affecting a few rows.

### **Advantages:**

- **Efficient for inserts and updates:** Since all fields of a row are stored together, writing or updating a complete record is straightforward.
- **Optimized for point queries:** Quick retrieval of single records or a small number of rows.
- **Simple storage design:** Mirrors how data is logically represented in tables.

### **Disadvantages:**

- **Inefficient for analytical queries:** Scanning large datasets to retrieve specific fields requires reading unnecessary data, increasing I/O operations.
- **Limited compression:** Data stored row by row does not benefit from compression as effectively as columnar storage.
- **Scalability challenges for big data analytics:** Handling massive analytical workloads can strain row-oriented systems due to their storage and processing inefficiencies.

### **Examples:**

Popular row-oriented databases include **MySQL**, **PostgreSQL**, and **Microsoft SQL Server**.

------

## **Column-Oriented: The Data Scientist's Dream**

Continuing our book analogy, imagine you're a literature researcher interested in how authors typically start their first chapters. With a column-oriented approach, all first chapters are stored together, making your analysis much more efficient. Column-oriented databases store data by columns rather than rows. This means all values for a specific field are stored together, making it highly efficient for analytical operations.

### **Best Use Case:**

Column-oriented databases really come into their own with analytics operations where queries often aggregate data over many rows but focus on a subset of fields. These workloads are often described by more business types than I as OLAP (**Online Analytical Processing**).

### **Advantages:**

- **Faster for analytics:** Since only the required columns are read, input/output (I/O) operations are minimized for analytical queries.
- **High data compression:** Similar data types stored together in columns allow for better compression, reducing storage requirements.
- **Efficient for aggregations:** Operations like `SUM`, `AVG`, or `COUNT` are optimized since data is aligned by field.

### **Disadvantages:**

- **Slower for updates/inserts:** Modifying or inserting data is less efficient due to the columnar storage layout.
- **Point lookups can be slower:** Unless indexing is employed, retrieving a single record is more complex.

### **Examples:**

Leading column-oriented databases include **Snowflake**, **Amazon Redshift**, **Google BigQuery**, and **ClickHouse**.

------

## **Real-World Application: Mobile Games**

Let's use a mobile game scenario to illustrate when each shines:

### **Row-Oriented:**

```sql
-- Finding a specific player's details (Great for row-oriented)
SELECT * FROM players WHERE player_id = '12345';
```

Perfect for:

- Player profile updates
- Inventory management
- Real-time game state changes

### **Column-Oriented:**

```sql
-- Calculating average spending per region (Column-oriented wins)
SELECT region, AVG(purchase_amount)
FROM player_purchases
GROUP BY region;
```

Ideal for:

- Player behavior analysis
- Revenue reporting
- Feature engagement metrics

------

## **On Disk is Where Things Really Start to Make Sense**

The way data is stored on disk significantly impacts the performance of row-oriented and column-oriented databases.

### **Row-Oriented Storage:**

In row-oriented databases, data for each row is stored contiguously on disk. For example, consider a table with three columns (`id`, `name`, `score`) and three rows of data:

| id   | name  | score |
| ---- | ----- | ----- |
| 1    | Alice | 30    |
| 2    | Amine | 25    |
| 3    | Dylan | 27    |

On disk, the data would be stored like this:

```
1, Alice, 30
2, Amine, 25
3, Dylan, 27
```

This structure ensures that all fields for a single record can be read or written in one operation. It’s ideal for transactional workloads or applications requiring frequent row-level updates or lookups.

### **Column-Oriented Storage:**

In column-oriented databases, data for each column is stored contiguously on disk. Using the same table example, the data would be stored like this:

```
Column 1 (id): 1, 2, 3
Column 2 (name): Alice, Amine, Dylan
Column 3 (score): 30, 25, 27
```

This format allows for efficient scanning of specific columns. For instance, if an analytical query only needs the `score` column, the database can directly read:

```
30, 25, 27
```

without loading irrelevant columns. Additionally, storing similar data types together enables better compression and faster aggregations.

------

## **Key Differences Between Row-Oriented and Column-Oriented Databases**

| **Aspect**              | **Row-Oriented Databases**         | **Column-Oriented Databases**           |
| ----------------------- | ---------------------------------- | --------------------------------------- |
| **Storage**             | Data stored row by row             | Data stored column by column            |
| **Best Use Case**       | OLTP (e.g., CRUD, Web App Backend) | OLAP (e.g., Analytics)                  |
| **Query Speed**         | Faster for row-based lookups       | Faster for column-based operations      |
| **Data Compression**    | Limited                            | High                                    |
| **Insert/Update Speed** | Efficient                          | Slower                                  |
| **Examples**            | MySQL, PostgreSQL, SQLite          | Snowflake, Redshift, ClickHouse, DuckDB |

------

## **Why Not Both 🤷, Modern Trends: Bridging the Gap**

With evolving technology and diverse workloads, many modern databases aim to combine the best of both worlds. Hybrid databases, such as **SAP HANA** and **Vertica**, offer mixed approaches to handle both OLTP and OLAP efficiently. These systems adapt storage and query strategies based on the workload type, providing flexibility without compromising performance.

------

## **Conclusion**

Remember our friend, the VP of unreasonably strong opinions from the introduction? His mistake wasn't in questioning the choice of database - asking questions is good (perhaps he should have started with even more questions 🤷)! - but in assuming that SQL automatically meant row-oriented CRUD operations, that was the big miss. As we've learned, SQL is just a query language, and it can be used effectively with both row-oriented and column-oriented architectures.

The key takeaway is this: when choosing a database, don't get caught up in buzzwords or assumptions. Instead, focus on your specific needs:

- If you're building a system that needs to handle lots of individual transactions (like a game's player inventory system), row-oriented databases are your friend.
- If you're building an analytics platform that needs to crunch numbers across millions of records (like, say, analyzing player behavior in a mobile game), column-oriented databases will serve you much better.

Both architectures have their place, and understanding their strengths and weaknesses helps you make informed decisions - and avoid looking silly in front of your team. After all, the best database isn't the one with the most impressive name or the latest buzz; it's the one that best serves your specific use case.