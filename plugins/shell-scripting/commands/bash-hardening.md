---
description: "Review or improve a Bash script for safety, maintainability, and production use"
argument-hint: "<script path or shell task> [--focus safety|debugging|ci|balanced]"
---

# Bash Hardening

Use the local Bash agent to review or improve a Bash script with production-safe patterns.

## Use Local Context

- Read the target script or the user's shell snippet carefully before making recommendations.
- Load `skills/bash-defensive-patterns/SKILL.md`.
- Load `skills/shellcheck-configuration/SKILL.md` when linting, CI checks, or warning handling matters.
- Use only local agents from `plugins/shell-scripting/agents/`.

## Ask The Bash Agent

Use the Task tool with:

```yaml
subagent_type: "bash-agent"
description: "Harden a Bash script for safe operational use"
prompt: |
  Review and improve this Bash task for production use: $ARGUMENTS

  Focus on:
  - quoting, arrays, loops, and strict-mode safety
  - input validation, dependency checks, and temporary resource cleanup
  - risky operations, blast radius reduction, and dry-run opportunities
  - logging, exit-code handling, and operator-facing diagnostics
  - ShellCheck guidance, testability, and CI suitability

  Return:
  1. Immediate safety or correctness issues
  2. Recommended Bash patterns to apply
  3. Suggested validation and linting steps
  4. A concise hardened example where useful
```

## Output Structure

Organise the response into:

1. Key risks
2. Recommended fixes
3. Validation steps
4. Follow-up improvements
