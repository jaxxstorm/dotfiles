---
name: gh-pr-reviews
description: Inspect and address GitHub pull request comments and reviews with the local gh-pr-reviews command. Use when the user asks to see, summarize, fix, or address PR comments, reviews, requested changes, or inline feedback.
---

# GitHub PR Reviews

Use the local `gh-pr-reviews` command to gather PR conversation context before summarizing, fixing, or otherwise addressing review feedback.

## Usage

- From inside a GitHub repository checkout, run `gh-pr-reviews` to inspect the current PR.
- To inspect a specific PR, run `gh-pr-reviews <number>`.
- To inspect a PR in another repository, run `gh-pr-reviews -R owner/repo <number>`.
- If unauthenticated API limits or private repository access block the request, retry with `gh-pr-reviews -a ...` so the command uses `GH_TOKEN` or the token from `~/.config/gh/hosts.yml`.

The output groups top-level issue comments, PR metadata, inline review comments, and submitted reviews. Preserve the file paths, review states, and URLs when reporting actionable feedback.

## Agent Guidance

When the user asks to summarize or inspect feedback, report actionable items first, grouped by file or review thread when possible.

When the user asks to address, fix, handle, or resolve feedback, do the work end to end:

1. Run `gh-pr-reviews` and identify concrete requested changes before editing files.
2. Separate actionable code/doc/test requests from non-actionable comments, discussion, praise, stale feedback, and already-satisfied feedback.
3. Inspect the referenced files and surrounding code before making changes.
4. Implement the actionable feedback directly, keeping edits scoped to the requested changes and the repository's existing style.
5. Run the most focused relevant verification available, such as targeted tests, type checks, linters, or formatting checks.
6. Report the changes made, verification run, and any feedback that remains unresolved or intentionally not changed.

Do not stop after summarizing when the user asked to fix or address feedback. If the command cannot determine the current PR, use `gh pr view --json number,headRepositoryOwner,headRepository` or ask for the PR number and repository.
