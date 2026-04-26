---
description: Inspect GitHub PR comments and reviews
agent: build
---

Use `gh-pr-reviews` to inspect pull request comments, inline review comments, and submitted reviews.

Rules:
- If a PR number is provided, run `gh-pr-reviews <number>`.
- If a repository is provided, run `gh-pr-reviews -R owner/repo <number>`.
- If no PR number is provided, run `gh-pr-reviews` from the current repository.
- If authentication fails or private comments are missing, retry once with `gh-pr-reviews -a ...`.
- Summarize actionable feedback first, grouped by file or review thread when possible.
- Include review states and URLs that matter for follow-up.
