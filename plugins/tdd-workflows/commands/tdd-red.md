---
description: "Choose the next smallest failing test for a TDD task"
argument-hint: "<requirement, bug fix, or coding task> [--focus balanced|speed|design|coverage]"
---

# TDD Red Step

Use this command when the user wants help identifying the next failing test without jumping ahead to implementation.

## Command Rules

1. Stay within the scope of `$ARGUMENTS`.
2. Use only local agents from `plugins/tdd-workflows/agents/`.
3. Load `skills/tdd-cycle/SKILL.md` before making recommendations.
4. Optimise for one small failing test, not a full plan.

## Recommended References

- `skills/tdd-cycle/SKILL.md`
- `skills/tdd-cycle/references/red-green-refactor-checklist.md`
- `skills/tdd-cycle/references/test-selection-guidelines.md`

## Workflow

Use the Task tool:

```text
Task:
  subagent_type: "tdd-agent"
  description: "Choose next failing test for $ARGUMENTS"
  prompt: |
    Choose the next smallest failing test for: $ARGUMENTS.

    Deliver a single markdown document with:
    1. The target behaviour to protect next
    2. A recommended failing test name and purpose
    3. Why this test is the right size
    4. Minimal setup, fixtures, or mocks needed
    5. What should wait until a later cycle
```

## Completion

Return a concise summary with:

- the chosen behaviour
- the recommended failing test
- why it is the right next step
- what to defer
