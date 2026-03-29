---
description: "Recommend the minimum code change needed to pass the current TDD test"
argument-hint: "<current failing test or behaviour> [--focus balanced|speed|design]"
---

# TDD Green Step

Use this command when the user already has a failing test and wants guidance on the smallest implementation needed to go green.

## Command Rules

1. Stay within the scope of `$ARGUMENTS`.
2. Use only local agents from `plugins/tdd-workflows/agents/`.
3. Load `skills/tdd-cycle/SKILL.md` before making recommendations.
4. Prefer the smallest passing change over broad implementation.

## Recommended References

- `skills/tdd-cycle/SKILL.md`
- `skills/tdd-cycle/references/red-green-refactor-checklist.md`

## Workflow

Use the Task tool:

```text
Task:
  subagent_type: "tdd-agent"
  description: "Recommend minimum green step for $ARGUMENTS"
  prompt: |
    Recommend the minimum green step for: $ARGUMENTS.

    Deliver a single markdown document with:
    1. The smallest implementation change that should make the test pass
    2. Temporary shortcuts that are acceptable during green
    3. Risks of over-implementing in this step
    4. Fast verification checks
    5. The most likely next test after this passes
```

## Completion

Return a concise summary with:

- the minimum passing change
- shortcuts that are acceptable for now
- the verification checks
- the next likely cycle
