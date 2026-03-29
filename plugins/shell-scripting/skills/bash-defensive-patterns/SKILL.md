---
name: bash-defensive-patterns
description: Apply defensive Bash scripting patterns for safer automation, reliable error handling, quoting, cleanup, and testable operational scripts. Use when reviewing or writing Bash scripts that may affect production systems.
---

# Bash Defensive Patterns

Use this skill when the user needs Bash guidance that is safe enough for CI, automation, and operational scripting.

## Load References

- Read `references/defensive-bash-checklist.md` for a quick review pass over Bash safety basics.
- Read `references/risky-operations-checklist.md` when the script can modify systems, files, deployments, or other production state.

## Core Priorities

1. Quote expansions correctly and avoid unsafe word splitting.
2. Validate inputs, environment variables, and external dependencies early.
3. Use traps and cleanup logic for temporary files and partial failure paths.
4. Prefer idempotent operations and dry-run support for risky scripts.
5. Add linting and lightweight test coverage before relying on the script operationally.

## What To Review

- Use of `set -Eeuo pipefail` and whether the script can handle it safely
- Quoting of variables, array usage, and iteration safety
- Handling of temporary files, directories, and cleanup traps
- Safety around `rm`, `mv`, `find`, `xargs`, and subprocess orchestration
- Logging, traceability, and operator-facing error messages

## Output Expectations

Organise recommendations into:

1. Immediate safety issues
2. Correctness and maintainability concerns
3. Suggested defensive patterns
4. Validation or linting steps
5. Follow-up improvements
