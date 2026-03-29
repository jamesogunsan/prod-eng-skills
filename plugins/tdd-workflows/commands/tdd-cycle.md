---
description: "Run a practical red-green-refactor workflow using local TDD agents"
argument-hint: "<requirement, bug fix, or coding task> [--focus balanced|speed|design|coverage] [--depth quick|standard|deep]"
---

# TDD Cycle Review

Use this command when the user wants help driving a task through red, green, and refactor without skipping the discipline that makes TDD useful.

## Command Rules

1. Stay within the scope of `$ARGUMENTS`.
2. Use only local agents from `plugins/tdd-workflows/agents/`.
3. Write each step output under `.tdd-workflows/` before moving to the next step.
4. Load `skills/tdd-cycle/SKILL.md` before planning any stage.
5. Keep each recommendation tied to one small cycle at a time.
6. Stop at the checkpoint before moving from green to refactor guidance.

## Pre-flight

1. Create `.tdd-workflows/` if it does not exist.
2. Parse `$ARGUMENTS` into:
   - `$TARGET`: the requirement, bug fix, or coding task
   - `focus`: `balanced` unless a `--focus` flag is provided
   - `depth`: `standard` unless a `--depth` flag is provided
3. Create `.tdd-workflows/state.json` with the target, focus, depth, current step, and created files.

## Recommended References

- `skills/tdd-cycle/SKILL.md`
- `skills/tdd-cycle/references/red-green-refactor-checklist.md`
- `skills/tdd-cycle/references/test-selection-guidelines.md`
- `skills/tdd-cycle/references/refactor-safety-checklist.md`

## Phase 1: Red and Green

### Step 1: Plan the Next Failing Test

Use the Task tool:

```text
Task:
  subagent_type: "tdd-agent"
  description: "Plan the next red step for $TARGET"
  prompt: |
    Plan the next TDD red step for: $TARGET.

    Focus on one small behaviour only. Recommend the best next failing test,
    why it is the right scope, the suggested test name, and what should be deferred.

    Deliver a single markdown document with:
    1. Target behaviour
    2. Recommended failing test
    3. Why this is the smallest useful step
    4. Fixture or mock notes
    5. What to defer until later cycles
```

Save the result to `.tdd-workflows/01-red-plan.md`.

### Step 2: Recommend the Minimum Green Change

Read `.tdd-workflows/01-red-plan.md`.

Use the Task tool:

```text
Task:
  subagent_type: "tdd-agent"
  description: "Plan the green step for $TARGET"
  prompt: |
    Recommend the minimum green step for: $TARGET.

    ## Red Plan
    [Insert full contents of .tdd-workflows/01-red-plan.md]

    Deliver a single markdown document with:
    1. Smallest implementation change to make the test pass
    2. Temporary shortcuts that are acceptable at this stage
    3. Risks of doing too much in this cycle
    4. Fast verification steps
    5. Candidate next tests after this one passes
```

Save the result to `.tdd-workflows/02-green-plan.md`.

## Checkpoint

Stop and present the key findings from:

- `.tdd-workflows/01-red-plan.md`
- `.tdd-workflows/02-green-plan.md`

Ask the user whether to:

1. Proceed to refactor guidance
2. Revise the red or green plan
3. Pause and save progress

Do not continue until the user chooses option 1.

## Phase 2: Refactor and Next Cycle

### Step 3: Recommend Safe Refactors

Read `.tdd-workflows/01-red-plan.md` and `.tdd-workflows/02-green-plan.md`.

Use the Task tool:

```text
Task:
  subagent_type: "refactor-agent"
  description: "Plan the refactor step for $TARGET"
  prompt: |
    Recommend safe refactor steps for: $TARGET.

    ## Red Plan
    [Insert full contents of .tdd-workflows/01-red-plan.md]

    ## Green Plan
    [Insert full contents of .tdd-workflows/02-green-plan.md]

    Deliver a single markdown document with:
    1. Refactors worth doing now
    2. Why they are safe after green
    3. Verification checks needed
    4. Refactors to defer
    5. The next best TDD cycle after cleanup
```

Save the result to `.tdd-workflows/03-refactor-plan.md`.

## Completion

Update `.tdd-workflows/state.json` to mark the session complete and summarise:

- the target behaviour selected first
- the recommended failing test
- the minimum green change
- the safest refactors to apply
- the next recommended cycle
- files created under `.tdd-workflows/`
