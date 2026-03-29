---
description: "Review a testing request and generate a practical unit testing plan with local agents"
argument-hint: "<module, class, function, or requirement> [--focus generation|debugging|coverage|balanced] [--depth quick|standard|deep]"
---

# Unit Test Review and Generation

Use this command when the user needs a unit testing plan, help generating tests, guidance on missing cases, or help debugging a failing or flaky unit test.

## Command Rules

1. Stay within the scope defined by `$ARGUMENTS`.
2. Use only local agents from `plugins/unit-testing/agents/`.
3. Write all step outputs under `.unit-testing/` before moving to the next step.
4. Prefer behavior-focused tests over implementation-coupled tests.
5. Load the local skill before proposing test cases or mock strategies.
6. If the request is mainly about broken tests, prioritize debugging and stabilization before adding more coverage.

## Pre-flight

1. Create `.unit-testing/` if it does not exist.
2. Parse `$ARGUMENTS` into:
   - `$TARGET`: the module, class, function, or requirement to review
   - `focus`: `generation`, `debugging`, `coverage`, or `balanced`
   - `depth`: `quick`, `standard`, or `deep`
3. Initialize `.unit-testing/state.json` with the target, focus, depth, current step, and created files.

## Recommended References

- Load `skills/unit-test-design/SKILL.md`
- Read `skills/unit-test-design/references/test-case-checklist.md`
- Read `skills/unit-test-design/references/mocking-and-fixture-guidelines.md`

## Phase 1: Test Review

### Step 1: Plan Coverage and Test Cases

Use the Task tool:

```text
Task:
  subagent_type: "test-automator-agent"
  description: "Plan unit tests for $TARGET"
  prompt: |
    Review the target and design a practical unit testing plan for: $TARGET.

    Focus on the requested emphasis from `$ARGUMENTS`.

    Deliver:
    1. The main behaviors that need unit tests
    2. The highest-value happy path, edge case, and failure case coverage
    3. Recommended mock and fixture strategy
    4. Cases that should stay out of unit tests and move to broader testing
    5. A prioritized test plan the user can implement immediately

    Write the result as a single markdown document.
```

Save output to `.unit-testing/01-test-plan.md`.

### Step 2: Debugging Review When Needed

Read `.unit-testing/01-test-plan.md`.

If the request includes failing tests, flaky behavior, brittle assertions, or debugging intent, use the Task tool:

```text
Task:
  subagent_type: "debugger-agent"
  description: "Review failing or flaky tests for $TARGET"
  prompt: |
    Review the test failure or instability concerns for: $TARGET.

    ## Existing Test Plan
    [Insert contents of .unit-testing/01-test-plan.md]

    Deliver:
    1. Likely causes of the failing or flaky behavior
    2. Whether the problem is more likely in the product code, the test code, or the setup
    3. The smallest reliable fix or debugging experiment to try next
    4. Suite hardening recommendations to prevent recurrence

    Write the result as a single markdown document.
```

Otherwise, write a short note to `.unit-testing/02-debug-review.md` stating that no dedicated debugging review was needed for this request.

## Checkpoint

Before continuing, summarize the planned coverage and any debugging findings. Stop and ask the user whether to continue with implementation-ready test guidance.

## Phase 2: Implementation Guidance

### Step 3: Produce Implementation-Ready Guidance

Read `.unit-testing/01-test-plan.md` and `.unit-testing/02-debug-review.md`.

Use the Task tool:

```text
Task:
  subagent_type: "test-automator-agent"
  description: "Produce implementation-ready test guidance for $TARGET"
  prompt: |
    Produce implementation-ready unit testing guidance for: $TARGET.

    ## Test Plan
    [Insert contents of .unit-testing/01-test-plan.md]

    ## Debug Review
    [Insert contents of .unit-testing/02-debug-review.md]

    Deliver:
    1. Recommended test file structure
    2. Ordered list of test cases to implement first
    3. Mock, fixture, and setup guidance
    4. Risks that could make the tests brittle or low-value
    5. Clear next steps for the user to implement or refine the suite

    Keep the result framework-aware when the stack is known and generic-but-practical when it is not.
```

Save output to `.unit-testing/03-implementation-guide.md`.

## Completion

Update `.unit-testing/state.json` to mark the review complete.

Present a final summary that includes:

- key behaviors to test
- recommended mock and fixture approach
- debugging findings, if any
- the highest-priority next test cases
- files created under `.unit-testing/`
