---
name: python-anti-patterns
description: Identify and correct common Python anti-patterns including over-clever code, weak naming, broad exception handling, mutable shared state, and fragile control flow. Use for reviews and cleanups.
---

# Python Anti-Patterns

Use this skill to spot Python code that works but is harder to read, test, or operate than it should be.

## Load References

- Read `references/anti-pattern-review-checklist.md` for broad cleanup reviews.
- Read `references/refactor-priority-guide.md` when deciding what to fix first versus what to leave alone.

## Core Workflow

1. Identify whether the problem is readability, correctness risk, operability risk, or change friction.
2. Separate stylistic annoyance from real maintenance danger.
3. Prefer the smallest cleanup that improves clarity and safety materially.
4. Avoid refactors that change everything at once without behavior protection.
5. Pair cleanup recommendations with tests or validation where risk is non-trivial.

## Common Anti-Patterns

- boolean comparisons like `== True` or `== None`
- wildcard imports and indirect namespace confusion
- comments that explain avoidable complexity
- giant functions with many unrelated responsibilities
- hidden mutable shared state
- broad `except` blocks that mask real failures
- manual loops where a clear comprehension or helper would be simpler
- incomplete tests that silently pass

## Higher-Risk Smells

- hidden dependency access through globals or module state
- giant orchestrator functions mixing validation, I/O, retries, and domain rules
- silent fallback behavior that hides corruption or missing config
- framework objects threaded through business logic everywhere
- helper modules that centralize unrelated logic and become impossible to reason about

## Review Questions

- is the code explicit about what it does and why
- can another engineer safely change it
- are errors surfaced clearly
- does the structure encourage isolated testing
- would a smaller helper or module make the logic obvious

## Cleanup Prioritization

- Fix anti-patterns that can hide defects, leak resources, or damage operability first.
- Next, fix patterns that slow change across the codebase, such as giant modules and unclear boundaries.
- Leave low-value style churn alone if the code is stable and the payoff is tiny.
- When multiple anti-patterns coexist, address the root structural cause instead of polishing symptoms.

## Output Expectations

1. Anti-patterns found
2. Why they are risky
3. Smaller clearer alternatives
4. Recommended cleanup order
5. Tests or checks to add after cleanup
