---
description: Inspect and address GitHub PR comments and reviews
agent: build
---

Use `gh-pr-reviews` to inspect pull request comments, inline review comments, and submitted reviews. When the prompt asks to fix, address, handle, or resolve feedback, implement the requested changes instead of only summarizing them.

Rules:
- If a PR number is provided, run `gh-pr-reviews <number>`.
- If a repository is provided, run `gh-pr-reviews -R owner/repo <number>`.
- If no PR number is provided, run `gh-pr-reviews` from the current repository.
- If authentication fails or private comments are missing, retry once with `gh-pr-reviews -a ...`.
- Summarize actionable feedback first, grouped by file or review thread when possible.
- Include review states and URLs that matter for follow-up.
- For fix/address requests, separate actionable comments from stale or non-actionable discussion before editing.
- Inspect referenced files and surrounding code before making changes.
- Apply the requested fixes directly, keeping edits scoped to review feedback and local project style.
- Run focused verification after editing, such as tests, type checks, linters, or formatting checks.
- Report changed files, verification results, and any unresolved feedback.
