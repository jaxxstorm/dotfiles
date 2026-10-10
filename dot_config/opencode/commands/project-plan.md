---
description: Design or revise a long-running project's architecture and Beads roadmap
agent: build
---

Plan the software project described by `$ARGUMENTS` (or the current repository if no argument is supplied).

This is a **collaborative architecture and roadmap** command, not an implementation command.

## First: build an evidence-based picture

1. Inspect the existing codebase, README, architecture docs, `openspec/specs/`, active `openspec/changes/`, Beads state (`bd list --all --limit 0 --json`), and existing ADRs. Work with what is already present; do not overwrite established decisions.
2. Establish the project's goals, use cases, explicit non-goals, success criteria, constraints, and what is already implemented.
3. Decompose the system into capabilities with clear responsibilities and integration boundaries. Distinguish architectural prerequisites from things that can be developed independently.
4. Explore important technical alternatives, data models, API contracts, trust boundaries, operations, failure modes, test strategy, and migration/compatibility concerns. Challenge unsupported assumptions.
5. Prioritize unknowns by impact and cost of being wrong. Recommend spikes for uncertain, high-risk decisions.
6. Propose milestones with objective exit criteria and a small next implementation slice. Do not generate hundreds of detailed tasks for distant features.

## Review gate

Present a concise proposed architecture and capability roadmap, with:
- Known facts versus assumptions
- Decisions and alternatives with their tradeoffs
- Risks, unanswered questions and recommended validation
- Proposed capability boundaries and cross-capability dependencies
- One recommended first OpenSpec change

**Ask for the user's approval of major design decisions before treating them as settled.** If the user has not approved the plan, stop after presenting it; do not create Beads or implementation code.

## After approval

1. Create or update, preserving useful existing content:
   - `docs/project/vision.md`
   - `docs/project/architecture.md`
   - `docs/project/capabilities.md`
   - `docs/project/roadmap.md`
   - `docs/project/decisions/` (one ADR per substantive decision)
2. Record unresolved decisions explicitly; do not silently invent answers.
3. Create or reuse one Beads **project epic** (with stable external ref `project:<repo-or-project-slug>`), then create/reuse one **capability epic** per near-term capability, parented to the project epic. Check existing Beads issues including closed items before creating anything. Avoid duplicate epics on reruns.
4. Populate capability epic descriptions with outcomes, scope, integration contracts and links to relevant architecture docs. Wire only verified hard dependencies with `bd dep add <dependent> <prerequisite>`. Do not over-serialize work.
5. Run `bd graph check`. Show the roadmap, IDs, missing decisions, first change name, and recommended next command `/opsx-new <change-name>`.

## Guardrails

- No implementation code in this command.
- No speculative completion claims.
- Don't treat Beads status as proof of working functionality without tests or code evidence.
- Project docs explain architecture and rationale; OpenSpec owns testable behavioral requirements; Beads owns execution status.
- Don't commit or push unless asked.
