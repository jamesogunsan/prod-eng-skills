---
name: tdd-cycle
description: Guide red-green-refactor work with practical advice on selecting the next test, keeping implementations minimal, and refactoring safely. Use when the user wants structured TDD help, interview-ready TDD reasoning, or a safer incremental coding workflow.
---

# TDD Cycle

Use this skill to guide test-driven development work from requirement slicing through failing tests, minimum passing code, and safe refactoring.

## Load References

- Read `references/red-green-refactor-checklist.md` when the user needs a quick stage-by-stage reminder.
- Read `references/test-selection-guidelines.md` when the next test is unclear or the request is too broad.
- Read `references/refactor-safety-checklist.md` when the code has gone green and needs cleanup without changing behaviour.

## Core Workflow

1. Pick one behaviour that matters now.
2. Write the smallest failing test that proves the behaviour is missing.
3. Implement the minimum change needed to make that test pass.
4. Run the relevant tests and confirm the suite is green.
5. Refactor only when behaviour is protected and the cleanup is clearly bounded.
6. Repeat with the next most valuable behaviour or edge case.

## What To Prioritise

- Small cycles with fast feedback
- Behaviour-focused assertions over implementation detail checks
- Minimal fixtures and mocks that keep intent obvious
- Clear separation between behaviour change and refactoring
- Readable tests that explain the requirement being protected

## Common Failure Modes

- Writing tests that cover too much behaviour at once
- Implementing more code than the current test requires
- Refactoring before the suite is stable enough to protect the change
- Using mocks that hide real behaviour or make tests brittle
- Letting the cycle stall because the next test is not well scoped

## Output Expectations

When producing recommendations, organise them into:

1. Current stage and target behaviour
2. Smallest next test or implementation step
3. Why this step is right-sized
4. What to defer until later
5. Verification and the next cycle after this one
