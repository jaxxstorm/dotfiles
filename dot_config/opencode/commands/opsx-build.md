---

description: Create, plan, and implement a new OpenSpec change
agent: build
subtask: false
--------------

Create and implement a new OpenSpec change for the following request:

<request>
$ARGUMENTS
</request>

Execute the entire workflow as one continuous operation:

1. Create a new OpenSpec change.
2. Generate all required planning artifacts.
3. Implement every task.
4. Run validation.
5. Report the final result.

Do not stop between stages unless there is a genuine blocker that cannot reasonably be resolved from the request or repository.

## Stage 1: Create the change

Use the native skill tool to load:

`openspec-new-change`

Use the request above as the full description of the proposed change.

Derive a concise, descriptive, lowercase kebab-case change name from the request.

The change name must:

* Begin with a lowercase letter.
* Contain only lowercase letters, numbers, and single hyphens.
* Clearly describe the requested change.
* Not conflict with an existing active change.

Execute the new-change workflow completely.

After creating the change, determine and retain the exact change name as:

`CHANGE_NAME`

All later stages must explicitly operate on this same change.

Do not stop after creating the change.

Do not ask the user to run `/opsx-new`, `/opsx-ff`, `/opsx-apply`, or any other command.

## Stage 2: Generate the planning artifacts

Use the native skill tool to load:

`openspec-ff-change`

Execute the fast-forward workflow completely for:

`CHANGE_NAME`

Use the original request as the source of product intent and scope.

Inspect the repository where necessary so that the generated proposal, specifications, design, and tasks are concrete and implementation-ready.

Do not generate generic artifacts when repository-specific details can be determined.

Continue until every artifact required before implementation has been completed.

Verify the result with:

```sh
openspec status --change "$CHANGE_NAME" --json
```

Inspect the returned status.

If any required artifact is missing, incomplete, or not ready for implementation, complete it before continuing.

Do not pause for approval between artifacts unless the request requires a material product decision that cannot reasonably be inferred from either:

* The original request.
* Existing repository behavior.
* Existing project conventions.
* Existing tests or documentation.

## Stage 3: Implement the change

Use the native skill tool to load:

`openspec-apply-change`

Execute the apply workflow completely for:

`CHANGE_NAME`

Implement every incomplete task associated with the change.

During implementation:

* Follow the generated proposal, specifications, and design.
* Use the task list as the implementation checklist.
* Update task checkboxes as tasks are completed.
* Preserve existing repository architecture and conventions.
* Avoid unrelated refactoring or cleanup.
* Add or update tests where appropriate.
* Update documentation where required by the change.
* Run relevant formatting, linting, type-checking, testing, and build commands.
* Fix failures caused by the implementation.
* Re-run validation after making fixes.
* Continue until all tasks are complete or a genuine external blocker prevents further progress.

Do not stop merely to provide a progress update.

Do not ask the user to invoke `/opsx-apply`.

Do not switch to another active OpenSpec change.

Do not leave tasks incomplete solely because the implementation spans multiple files or requires several iterations.

## Stage 4: Final validation

Before finishing, run:

```sh
openspec status --change "$CHANGE_NAME" --json
```

Confirm that:

* All required OpenSpec artifacts exist.
* The change is ready and internally consistent.
* Every implementation task is checked off.
* The implementation matches the generated specifications.
* Relevant tests pass.
* Relevant linting and type checks pass.
* Relevant builds complete successfully.
* The final diff does not include unrelated changes.

Review the implementation for omissions, incomplete error handling, missing tests, and inconsistencies with existing repository patterns.

Fix any issues found during this review and repeat the relevant validation.

## Final response

Report:

* The exact OpenSpec change name.
* A concise summary of what was implemented.
* The important files or components changed.
* The validation commands that were run.
* Whether each validation step passed.
* Any remaining blockers or intentionally deferred work.

Do not sync or archive the change.

Do not claim validation succeeded unless the relevant command was actually run successfully.

