---
name: shellcheck-configuration
description: Set up or review ShellCheck usage for Bash and POSIX shell projects, including linting scope, CI integration, and practical rule handling. Use when improving shell script quality gates or explaining lint findings.
---

# ShellCheck Configuration

Use this skill when the user wants to introduce, tighten, or explain ShellCheck-based validation for shell scripts.

## Load References

- Read `references/ci-linting-checklist.md` when the user needs CI-friendly linting guidance.
- Read `references/warning-triage-guide.md` when the work depends on explaining or prioritising ShellCheck findings.

## Core Priorities

1. Use ShellCheck as a default guardrail for shell correctness and safety.
2. Keep suppressions narrow, justified, and visible.
3. Match linting mode to the intended shell, such as Bash or POSIX `sh`.
4. Integrate linting into local workflows and CI without creating noisy false positives.
5. Pair linting with formatting and targeted script tests where practical.

## What To Review

- Whether scripts declare the correct shebang and intended shell
- Whether ShellCheck mode matches the script target
- Which warnings indicate real safety or correctness problems
- Whether any suppressions are too broad or hiding design issues
- How to integrate ShellCheck with `shfmt`, tests, and CI pipelines

## Output Expectations

Organise recommendations into:

1. Current linting posture
2. Important warnings or configuration gaps
3. CI and local workflow recommendations
4. Suppression guidance where needed
5. Follow-up quality improvements
