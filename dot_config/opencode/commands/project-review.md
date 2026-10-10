---
description: Audit project progress, architecture drift, risks and next executable work
agent: build
---

Review the long-running project. Optional focus: `$ARGUMENTS`.

This is a **read-only evidence-based project assessment**. Do not implement, replan, alter issues, change code, archive changes, or push data.

## Examine

1. Read `docs/project/` and ADRs, repository README, canonical `openspec/specs/`, all active OpenSpec changes, and Beads project/capability/change epics (include closed issues where necessary).
2. Inspect the codebase, recent Git history, tests and CI configuration for implementation evidence. Do not claim a subsystem is production-ready just because its beads are closed.
3. Inspect Beads using `bd list --all --limit 0 --json`, `bd ready --exclude-type epic --json`, `bd blocked --json`, `bd graph check`, and scoped descendant queries as needed.
4. Compare planned capabilities with actual implementations. Reconcile completed task checkboxes against closed Beads issues, and identify drift, duplicated tasks, orphaned work, abandoned claims, circular dependencies, missing acceptance criteria, and unplanned discoveries.
5. Identify integration risks between independently implemented capabilities: API compatibility, schema evolution, auth/security boundaries, migrations, resource lifecycle, operational failure modes and contract-test gaps.

## Output

Give a compact, decision-oriented review with these sections:

- **Executive state:** what works, what is only planned, what is uncertain
- **Progress:** each active capability/change, evidence of completion, and gaps
- **Runnable work:** next 3–5 highest-leverage ready tasks or change epics with their actual Beads IDs
- **Blockers:** exact prerequisites and recommended unblock actions
- **Architectural drift:** concrete mismatches between docs, OpenSpec, tests and code
- **Decisions for the user:** only decisions that cannot responsibly be inferred
- **Recommended next action:** explicit slash command and change name

Separate facts, interpretations and unknowns. Quote relevant file paths and bead IDs. Don't invent progress percentages when there's no grounded denominator. Do not silently alter the roadmap or close work during an audit.
