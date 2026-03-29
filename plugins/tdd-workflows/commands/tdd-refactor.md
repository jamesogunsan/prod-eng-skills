---
description: "Recommend safe refactors after a TDD step has gone green"
argument-hint: "<current passing solution or design concern> [--focus readability|duplication|design|balanced]"
---

# TDD Refactor Step

Use this command when the tests are green and the user wants help cleaning up the solution safely.

## Command Rules

1. Stay within the scope of `$ARGUMENTS`.
2. Use only local agents from `plugins/tdd-workflows/agents/`.
3. Load `skills/tdd-cycle/SKILL.md` before making recommendations.
4. Do not mix new behaviour work into the refactor guidance.

## Recommended References

- `skills/tdd-cycle/SKILL.md`
- `skills/tdd-cycle/references/red-green-refactor-checklist.md`
- `skills/tdd-cycle/references/refactor-safety-checklist.md`

## Workflow

Use the Task tool:

```text
Task:
  subagent_type: "refactor-agent"
  description: "Recommend safe refactor step for $ARGUMENTS"
  prompt: |
    Recommend safe refactors for: $ARGUMENTS.

    Deliver a single markdown document with:
    1. The refactor worth doing now
    2. Why it is safe with a green test suite
    3. Verification checks to run immediately
    4. Refactors to defer until later
    5. The next likely TDD cycle after cleanup
```

## Completion

Return a concise summary with:

- the best refactor to do now
- why it is safe
- the verification checks
- what to leave for later
