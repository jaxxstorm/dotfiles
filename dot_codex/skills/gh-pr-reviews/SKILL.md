---
name: gh-pr-reviews
description: Inspect GitHub pull request comments and reviews with the local gh-pr-reviews command. Use when the user asks to see, summarize, or address PR comments, reviews, requested changes, or inline feedback.
---

# GitHub PR Reviews

Use the local `gh-pr-reviews` command to gather PR conversation context before summarizing or addressing review feedback.

## Usage

- From inside a GitHub repository checkout, run `gh-pr-reviews` to inspect the current PR.
- To inspect a specific PR, run `gh-pr-reviews <number>`.
- To inspect a PR in another repository, run `gh-pr-reviews -R owner/repo <number>`.
- If unauthenticated API limits or private repository access block the request, retry with `gh-pr-reviews -a ...` so the command uses `GH_TOKEN` or the token from `~/.config/gh/hosts.yml`.

The output groups top-level issue comments, PR metadata, inline review comments, and submitted reviews. Preserve the file paths, review states, and URLs when reporting actionable feedback.

## Agent Guidance

When the user asks to address feedback, first run `gh-pr-reviews` and identify concrete requested changes before editing files. If the command cannot determine the current PR, use `gh pr view --json number,headRepositoryOwner,headRepository` or ask for the PR number and repository.
