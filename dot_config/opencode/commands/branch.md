---
description: Create a new git branch from a short description
agent: build
---

Create a new git branch for this work.

User input: $ARGUMENTS

Rules:
- Use minimal tokens.
- Inspect the current branch name first.
- Create a concise kebab-case branch name.
- Prefix the branch with my username, jaxxstorm:
- The branch name should be short, descriptive, and safe for git.
- Then run the git command to create and switch to it.
- After creation, print only:
  - the previous branch
  - the new branch
  - the exact command that was run
- Do not make any other changes.

Example intent:
- "add login page" -> jaxxstorm/add-login-page
- "fix panic in auth middleware" -> jaxxstorm/auth-middleware-panic
