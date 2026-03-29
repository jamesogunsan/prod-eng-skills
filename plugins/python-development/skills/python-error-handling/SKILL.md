---
name: python-error-handling
description: Improve Python exception handling with guidance on specific exceptions, failure boundaries, recovery strategy, chaining, and safe error reporting. Use for debugging, code reviews, and reliability improvements.
---

# Python Error Handling

Use this skill to make failure behavior explicit, narrow, and maintainable.

## Load References

- Read `references/exception-design-checklist.md` when reviewing exception taxonomy or API-facing error contracts.
- Read `references/failure-handling-recipes.md` when deciding between fail-fast, retry, fallback, translation, or logging strategies.

## Core Principles

- errors should never pass silently unless they are explicitly silenced for a good reason
- catch the narrowest useful exception
- keep `try` blocks as small as possible
- choose exception types based on what the caller needs to handle
- preserve useful failure context when translating exceptions

## Core Workflow

1. Identify where the failure originates: validation, domain logic, dependency call, infrastructure boundary, or shutdown path.
2. Decide whether the right behavior is to fail fast, retry, degrade, or translate the error.
3. Narrow the `try` scope so the actual failing operation is obvious.
4. Preserve actionable context in logs and exception messages without leaking sensitive data.
5. Confirm that tests cover the intended failure semantics.

## What To Prefer

- `except SpecificError:` instead of broad exception handlers
- `raise NewError from original_error` when wrapping failures
- clear validation before risky work where that improves messages or control flow
- one obvious recovery path rather than many hidden partial fallbacks

## Exception Design Guidance

- Prefer exception names that answer what went wrong in terms the caller can act on.
- Keep domain-level exceptions distinct from transport, persistence, and framework exceptions.
- Use translation layers at boundaries so internal exceptions do not leak across public APIs casually.
- Preserve original tracebacks when wrapping lower-level failures unless you are deliberately hiding internals.
- Do not convert everything into one generic application error.

## What To Avoid

- bare `except:`
- large `try` blocks that hide the real failing line
- swallowing failures and returning misleading defaults
- exception types that do not communicate what went wrong

## Retry And Recovery Heuristics

- Retry only when the operation is transient-failure-prone and safe to repeat.
- Pair retries with timeouts, attempt limits, and observability.
- Use fallback behavior only when degraded results are genuinely acceptable.
- Prefer surfacing a controlled failure over returning partial garbage.
- Distinguish validation failures from operational failures so callers do not retry the wrong thing.

## Logging And Reporting Guidance

- Log failures once at the boundary that owns the context to act on them.
- Avoid duplicate logging at every stack layer.
- Include identifiers, dependency names, and operation context that help reproduction.
- Exclude secrets, tokens, and sensitive payloads from error messages and logs.

## Output Expectations

1. Failure handling issues
2. Exception-scope problems
3. Better exception types or messages
4. Recovery and retry guidance
5. Tests needed around failure paths
