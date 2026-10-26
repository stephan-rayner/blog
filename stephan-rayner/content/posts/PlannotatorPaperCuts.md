+++
date = '2026-10-26T10:40:00-04:00'
draft = true
title = 'Getting Plannotator Running: A Few Paper Cuts'
tags = ["tools", "ai"]
+++

I recently set up Plannotator and hit a handful of small snags on the way. None of them were hard, but each one cost me a few minutes of "wait, why?". Here they are so you can skip them.

## Why Plannotator Is Great

When an AI agent hands me a plan, my feedback usually ends up as a wall of prose: "in step 3, I'd rather we...". Plannotator replaces that with a local, browser-based review layer. It opens the plan (or a diff, or a file, or a web page) and lets me mark it up inline, the way I would in a pull request. When I'm done, my structured feedback goes straight back to the agent.

A few things I like:

- **Plan review:** annotate the plan right where the problem is, then approve it or send it back.
- **Code review:** the same markup flow for your current changes or a pull request.
- **Annotate anything:** markdown files, config files, URLs, even a running local app.
- **Last message:** open the agent's latest reply and mark it up instead of typing a rebuttal.

Everything runs on localhost, and it only returns when you decide, so nothing happens behind your back.

## The Paper Cuts

### 1. The Binary Was Installed but Not on My PATH

The first thing I ran was a quick sanity check:

```bash
command -v plannotator
```

No output, exit code 1, and no hint as to why. The installer had put the binary in `~/.local/bin`, which wasn't on my PATH. Calling it by full path worked fine:

```bash
~/.local/bin/plannotator --help
```

### 2. Fixing It in Fish

I use fish, so the permanent fix was one line in `~/.config/fish/config.fish`:

```fish
fish_add_path $HOME/.local/bin
```

If you're on bash or zsh, the equivalent is:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Then open a new terminal (or source your config) and check it again:

```bash
command -v plannotator
```

### 3. `/plannotator` Doesn't Do Anything by Itself

I typed `/plannotator` expecting a review window to pop open. It doesn't. That skill is a reference for the CLI, not an action. The ones that actually launch things are separate:

- `/plannotator-review` for code changes or a pull request
- `/plannotator-annotate` for a file, URL, or folder
- `/plannotator-last` for the latest assistant message

Plan review is the exception: it opens on its own when you exit plan mode, so you never run it by hand.

### 4. Don't Run Bare `plannotator`

Running `plannotator` with no arguments looks like a natural way to poke at it. Don't. That's the hook entry point and it expects JSON on stdin. Use `plannotator --help` instead.

### 5. Sessions Block Until You Decide

Every review session waits for you to approve, close, or send feedback. That can take a while, so if you launch it from a script, give it a long timeout or run it in the background. If a session gets stopped, run the same command again and your draft annotations come back.

## Quick Checklist

1. Install Plannotator.
2. Make sure `~/.local/bin` is on your PATH.
3. Confirm with `command -v plannotator`.
4. Try `/plannotator-last` on any reply to see the markup flow.

------

That's it! Small bumps, but they're easy to dodge once you know where they are.

I hope that helped 😀!
