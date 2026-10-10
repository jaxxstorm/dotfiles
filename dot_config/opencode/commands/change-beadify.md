---
description: Import an approved OpenSpec change into an idempotent Beads task graph
agent: build
---

Import the OpenSpec change `$1` into Beads. **Planning only — no implementation.**

## Read and validate

1. Require a nonempty change name. Verify `openspec/changes/$1/` exists. Do not recreate an archived change.
2. Read the change's `proposal.md`, `design.md`, `tasks.md`, and every delta specification under `specs/`; use `openspec status --change $1` and `openspec validate $1` where supported.
3. Stop if there is no actionable `tasks.md` or if the design has unresolved decisions that make implementation unsafe or incoherent. Request an OpenSpec planning update rather than inventing details.
4. Also inspect `docs/project/` and existing capability epics if present.

## Idempotent import

5. Search **all** Beads issues, including closed ones (`bd list --all --limit 0 --json`), for exact `external_ref` matches. Do not rely only on titles or the default 50-item limit.
6. Reuse or create exactly one epic with external reference `openspec:$1`. If a matching capability epic exists, parent the change epic to the right capability; if ambiguous, report the choice before making it. Keep the association stable on reruns.
7. Parse numbered task checkboxes (for example `1.1`, `1.2`) as stable references. For each actionable task, reuse or create exactly one child bead with:
   - External reference `openspec:$1#<task-number>`
   - Metadata `openspec_change` and `openspec_task`
   - Description describing deliverable and relevant design/spec paths
   - Specific acceptance criteria including expected tests
   - Labels such as `openspec` and `change:$1`
8. Reconcile already-checked tasks against the code and tests. **Do not automatically close a bead merely because a checkbox is checked**; report unverifiable completions. Never reopen a previously closed bead without identifying an actual regression or changed requirement.
9. Derive blocking dependencies from true implementation prerequisites and known interfaces. Use `bd dep add <dependent> <prerequisite>` (the dependent is the first argument). Leave independent tasks parallel. Do not infer a sequential dependency merely from task numbering.
10. Preserve the existing graph on reruns. Report tasks removed/renumbered in OpenSpec as drift rather than deleting Beads history.

## Verify and report

11. Run `bd graph check`, `bd graph <change-epic-id>` and `bd ready --parent <change-epic-id> --exclude-type epic --json`.
12. Summarize epic ID, new/reused tasks, dependencies, work already verified complete, ready tasks, blocked tasks and unresolved ambiguities.
13. If sound, recommend `/change-apply $1`.

Do not edit source code, commit, push or archive in this command.
