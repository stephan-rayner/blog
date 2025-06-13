+++
date = '2025-04-15T10:41:09-04:00'
draft = false
title = '📝 Rewriting a Git Commit Message'
tags = ["git"]
+++

So you started contributing to a new project and have an excellent contribution to make. You code it up, test it, and wrap it up in a commit. You are exceedingly proud of yourself and then you realize that your commit message is a little unclear and also you have a typo.

```plaintext
fiz: typo
```

There is something ironic about this commit isn't there 😏. Let's fix this message, we can address the typo and make the message more expressive. Perhaps we can make the message something like the following:

```plaintext
fix: addressing typo in cli help message for file uploads
```


## Step by Step Process

The rest of this article focus on the process I follow when I end up in this situation, which if I am being honest after over a decade of professional work still happens regularly.

⚠️ Warning: It is important to know that this is a rather advanced git technique where you will be rewriting your history, this should be done with caution.

### Step 1: Look at your recent commits

Firstly, we need to figure out how far back the commit is in the log.

```bash
git log --oneline
```

### Step 2: Using an interactive rebase

Use the number of commits you want to review. For example, if the commit is 3 commits ago:

```bash
git rebase -i HEAD~3
```

This will open a text editor with a list of commits.

### Step 3: Mark the commit to be renamed

Change the word `pick` to `reword` (or just `r`) next to the commit you want to rename:

```plaintext
reword a1b2c3d Fix typo in README
pick   d4e5f6g Add unit tests
pick   h7i8j9k Update CI config
```

Then save and close the file.

### Step 4: Edit the commit message

Git will now prompt you to enter a new message for the commit(s) you marked with `reword`. Type your updated message, save, and close the editor.

### Step 5: You are done!

Assuming you have no conflicts, your rebase should be complete. If Git hits a conflict you will have to resolve it.

```bash
git rebase --continue
```

## A Quick Word of Caution

If you’ve already pushed the commit to a centralized repository we will have to overwrite it. Overwirting the old commit with the new one will in this case, require a force push:

```bash
git push --force

# or possibly

git push -f origin YOUR_GIT_BRANCH_HERE
```

Personally, I am fond of this method as it injects the name of the branch into the command at execution time.

```bash
git push -f origin $(git branch | grep '*' | tr -d '* [:space:]')
```

------

That’s it! Next time you typo your commit message or want to clean things up, interactive rebase can be your friend.

I hope that helped 😀!