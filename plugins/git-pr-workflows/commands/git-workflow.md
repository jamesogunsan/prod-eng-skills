---
description: "Run a phased git workflow review from code changes to pull request readiness"
argument-hint: "<target branch> [--skip-tests] [--draft-pr] [--no-push] [--squash] [--conventional] [--trunk-based]"
---

# Git Workflow Review

Use this command to run a practical git and pull request workflow for production-facing work. Keep the workflow evidence-led, local to this plugin, and explicit about delivery risk.

## Rules

1. Work in order and do not skip phases.
2. Write each phase output to `.git-workflow/` before moving on.
3. Use only local agents from `plugins/git-pr-workflows/agents/`.
4. Stop at each checkpoint and ask the user whether to proceed, revise, or pause.
5. Do not execute `git` or `gh` commands until the user explicitly approves execution.
6. Prefer clear reviewer context, safe sequencing, and rollback-aware delivery notes over process-heavy output.

## Required Local Inputs

- `agents/code-reviewer-agent.md`
- `agents/workflow-agent.md`
- `README.md`

## Session State

Create `.git-workflow/` if it does not exist.

Create or update `.git-workflow/state.json` with:

```json
{
  "target_branch": "$TARGET_BRANCH",
  "flags": {
    "skip_tests": false,
    "draft_pr": false,
    "no_push": false,
    "squash": false,
    "conventional": true,
    "trunk_based": false
  },
  "status": "in_progress",
  "current_phase": 1,
  "files_created": []
}
```

Parse `$ARGUMENTS` so that:

- `$TARGET_BRANCH` defaults to `main`
- `--skip-tests` defaults to `false`
- `--draft-pr` defaults to `false`
- `--no-push` defaults to `false`
- `--squash` defaults to `false`
- `--conventional` defaults to `true`
- `--trunk-based` defaults to `false`

## Phase 1: Change Review and Workflow Planning

### Step 1: Review Current Changes

Gather the current git context and save it to `.git-workflow/00-git-context.md`.

Then use the Task tool:

```text
Task:
  subagent_type: "code-reviewer-agent"
  description: "Review current changes for risk and readiness"
  prompt: |
    Review the current git changes for production readiness.

    ## Git Context
    [Insert contents of .git-workflow/00-git-context.md]

    Focus on:
    1. correctness and security risk
    2. rollout, rollback, and migration concerns
    3. missing tests or validation evidence
    4. observability or operational gaps
    5. issues that reviewers should see early

    Return a single markdown report with:
    - top findings grouped by severity
    - likely blocking issues
    - validation gaps
    - notes that must appear in the eventual PR
```

Save output to `.git-workflow/01-review.md`.

### Step 2: Branch, Commit, and PR Plan

Read `.git-workflow/00-git-context.md` and `.git-workflow/01-review.md`.

Use the Task tool:

```text
Task:
  subagent_type: "workflow-agent"
  description: "Plan branch, commit, and PR workflow"
  prompt: |
    Build a practical git workflow plan for the current change set.

    ## Git Context
    [Insert contents of .git-workflow/00-git-context.md]

    ## Review Findings
    [Insert contents of .git-workflow/01-review.md]

    Account for these workflow flags:
    - target branch: $TARGET_BRANCH
    - skip tests: $SKIP_TESTS
    - draft PR: $DRAFT_PR
    - no push: $NO_PUSH
    - squash: $SQUASH
    - conventional commits: $CONVENTIONAL
    - trunk based: $TRUNK_BASED

    Return a single markdown plan with:
    1. recommended branch strategy
    2. commit grouping and message approach
    3. PR framing and reviewer guidance
    4. blocking fixes or prerequisites before push
```

Save output to `.git-workflow/02-workflow-plan.md`.

## Checkpoint 1

Summarise the findings from:

- `.git-workflow/01-review.md`
- `.git-workflow/02-workflow-plan.md`

Then stop and ask the user to choose:

1. Proceed to validation and PR drafting
2. Revise the review or workflow plan
3. Pause and save progress

Update `.git-workflow/state.json` before stopping.

## Phase 2: Validation and Pull Request Package

### Step 3: Testing and Validation Plan

Read `.git-workflow/00-git-context.md` and `.git-workflow/01-review.md`.

If `--skip-tests` is set, write `.git-workflow/03-validation.md` explaining that tests were intentionally skipped and list the minimum checks the user should still perform.

Otherwise use the Task tool:

```text
Task:
  subagent_type: "code-reviewer-agent"
  description: "Plan validation and test coverage for current changes"
  prompt: |
    Create a validation plan for the current change set.

    ## Git Context
    [Insert contents of .git-workflow/00-git-context.md]

    ## Review Findings
    [Insert contents of .git-workflow/01-review.md]

    Return a single markdown report with:
    1. tests or checks that must run before push
    2. gaps in current coverage or verification
    3. migration or rollout validations still needed
    4. recommended evidence to include in the PR
```

Save output to `.git-workflow/03-validation.md`.

### Step 4: Commit and PR Draft

Read `.git-workflow/02-workflow-plan.md` and `.git-workflow/03-validation.md`.

Use the Task tool:

```text
Task:
  subagent_type: "workflow-agent"
  description: "Draft commit and pull request package"
  prompt: |
    Create a commit and pull request package for the current change set.

    ## Workflow Plan
    [Insert contents of .git-workflow/02-workflow-plan.md]

    ## Validation Plan
    [Insert contents of .git-workflow/03-validation.md]

    Return a single markdown package with:
    1. recommended commit message or commit set
    2. branch naming recommendation if needed
    3. PR title options
    4. final PR summary focused on why the change exists
    5. rollout, rollback, and reviewer checklist notes
```

Save output to `.git-workflow/04-pr-package.md`.

## Checkpoint 2

Summarise the findings from:

- `.git-workflow/03-validation.md`
- `.git-workflow/04-pr-package.md`

Then stop and ask the user to choose:

1. Proceed to execution readiness
2. Revise the validation plan or PR package
3. Pause and save progress

Update `.git-workflow/state.json` before stopping.

## Phase 3: Execution Readiness

### Step 5: Push and Merge Readiness

Read all files in `.git-workflow/`.

Use the Task tool:

```text
Task:
  subagent_type: "workflow-agent"
  description: "Prepare push and merge readiness summary"
  prompt: |
    Prepare a final execution-readiness summary for the current git workflow.

    Use the generated review, workflow, validation, and PR package documents as inputs.

    Return a single markdown summary with:
    1. exact prerequisites before push or PR creation
    2. recommended command sequence to stage, commit, push, and open the PR
    3. risks that still need explicit acknowledgement
    4. whether the PR should remain draft or be ready for review
```

Save output to `.git-workflow/05-execution-readiness.md`.

## Completion

Update `.git-workflow/state.json` to mark the run complete and list generated files.

Present the final result with:

1. the highest-risk review findings
2. required validation before merge
3. recommended commit and PR framing
4. files created in `.git-workflow/`

If the user wants to execute git or PR commands after this, show the planned commands first and ask for explicit confirmation.
