---
description: Continuously execute an OpenSpec change using the Beads ready queue
agent: build
---

Execute OpenSpec change `$1` through its existing Beads task graph. **Work until there is no safe executable task left**, not until one bead completes or blocks.

## Preconditions

1. Require a change name, locate `openspec/changes/$1/`, and find exactly one matching Beads epic via external reference `openspec:$1`. If none exists, stop and request `/change-beadify $1`.
2. Read proposal, design, task list, delta specs, relevant project architecture and repository conventions. Beads is authoritative for task state; OpenSpec is authoritative for scope and intended behavior.
3. Inspect `bd children <epic-id> --json`, `bd list --parent <epic-id> --status in_progress --json`, and `bd ready --parent <epic-id> --exclude-type epic --json` to understand existing state. If resuming a task, continue it only when current ownership is unambiguous; do not steal other workers' tasks.

## Continuous execution loop

4. Atomically claim one eligible task: `bd ready --parent <epic-id> --exclude-type epic --claim --json`. Do not choose work from unchecked Markdown or claim unrelated project tasks.
5. For each claimed task:
   - Read its acceptance criteria, dependencies and referenced OpenSpec requirements.
   - Implement only the task's approved scope; make small, reviewable code changes.
   - Add/update relevant tests and run the narrowest meaningful validation.
   - Close the bead **only** if the acceptance criteria are demonstrated; include the validation in the close reason or notes.
   - Then mark the corresponding OpenSpec task checkbox complete.
   - Immediately loop back to claim the next ready task. Do not pause for a progress summary or ask whether to continue after each successful task.
6. If additional implementation work is discovered, create a child issue under the same change epic, link it to its origin with `bd dep add <new-id> <origin-id> --type discovered-from` (non-blocking provenance), and create **separate `blocks` edges** only where a real prerequisite exists. Extend `tasks.md` with a stable new task ID if work belongs in this OpenSpec change. If it changes public behavior, requirements or architecture, stop **that dependent scope**, update or request approval of OpenSpec artifacts first, and continue unrelated ready tasks.

## Blocking and failures

7. A single blocked or failing task **does not stop the loop**. Diagnose boundedly; if it cannot be resolved without external input or changing approved scope:
   - Record exact reproduction, cause, test output and the required unblock action in Beads.
   - Set the bead's state appropriately (`bd update <id> --status blocked` for unresolved external blockers, or return it to open if waiting on a newly created blocking prerequisite).
   - Never claim success, never check its OpenSpec checkbox, and continue with other ready tasks.
8. If a test failure points to a shared system regression, investigate and fix or create a blocker bead. Do not suppress/skip tests just to close tasks. If the working tree is globally unsafe, stop and report.
9. If there are no ready tasks, inspect open/blocked/in-progress descendants, `bd ready --parent <epic-id> --explain`, and `bd graph check`. Resolve only **demonstrable bookkeeping mistakes**. Do not steal active claims or rewrite dependencies to manufacture readiness.
10. Exit when (a) no unfinished child tasks remain, (b) all remaining work is truly blocked or claimed by another worker, or (c) safe progress requires a user decision, missing secret, unavailable environment, or destructive operation. Never spin indefinitely on the same unresolved task.

## End of run

11. Run relevant broad tests if all child tasks are complete, validate OpenSpec structure with `openspec validate $1` where supported, and reconcile closed bead IDs with checked task numbers. Identify any mismatches explicitly.
12. Report: completed IDs, remaining ready/blocked/in-progress tasks, test evidence, discovered scope, blockers, git changes and next steps.
13. Do **not** automatically archive or close the change epic. Those require a separate implementation-level `/opsx-verify $1` review and archive decision.
14. Do not commit, push, or deploy unless explicitly requested. If Dolt sync is configured, report whether `bd dolt push` is needed.
