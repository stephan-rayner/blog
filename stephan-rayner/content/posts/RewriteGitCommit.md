+++
date = '2025-04-15T10:41:09-03:00'
draft = false
title = '📝 How to Rewrite a Git Commit with `rebase -i`'
+++

<!-- ## 📝 How to Rewrite a Git Commit with `rebase -i` -->

Ever make a commit and then immediately realize the message could be clearer or you typed “fix” as “fiz”? Don’t worry — Git has your back.

If the commit isn’t already pushed (or you're okay force-pushing), you can easily rename it using **interactive rebase**. Here’s how.

### Step 1: See your recent commits

First, check how far back the commit is:

```bash
git log --oneline
```

Each line is a commit, with the most recent on top. Count how far back the one you want to rename is.

### Step 2: Start an interactive rebase

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

Git will now prompt you to enter a new message for the commit you marked. Type your updated message, save, and close the editor.

### Step 5: Done!

If there are no conflicts, your rebase will complete. If Git hits a conflict, it’ll tell you what to do — usually:

```bash
git rebase --continue
```

### A Quick Word of Caution

If you’ve already pushed the commit to a shared branch, renaming it will rewrite history. You’ll need to force push:

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

That’s it! Next time you typo your commit message or want to clean things up, interactive rebase is your friend.