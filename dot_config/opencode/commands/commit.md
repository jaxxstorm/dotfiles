---
description: Generate and confirm a conventional commit message from current changes
agent: build
---

Review the current git changes and prepare a conventional commit.

Rules:
- Use minimal tokens.
- Inspect staged and unstaged changes.
- Generate exactly one conventional commit message in this format:

  type(scope): summary

- Allowed types:
  - feat
  - fix
  - docs
  - refactor
  - test
  - chore
  - build
  - ci
  - perf

- Prefer a scope when it is obvious.
- Keep the summary concise and specific.
- Do not commit yet.

Return exactly:
1. Proposed commit message
2. Very short rationale
3. Ask: "Commit with this message? (yes/no)"

If the user confirms yes:
- Run the git commit command with the proposed message.
- Then print only the final commit message and resulting git output.

If the user says no:
- Ask for a replacement message or what should change.
