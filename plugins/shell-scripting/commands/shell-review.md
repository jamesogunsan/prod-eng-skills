---
description: "Review a shell script for safety, portability, and operational quality using local shell agents"
argument-hint: "<script, snippet, or shell task> [--shell bash|posix] [--focus safety|portability|maintainability|balanced]"
---

# Shell Review

Use this command when the user wants a shell script or shell task reviewed for correctness, safety, portability, and maintainability.

## Command Rules

1. Stay within the scope of `$ARGUMENTS`.
2. Use only local agents from `plugins/shell-scripting/agents/`.
3. Load the relevant local skill before reviewing the script.
4. Choose `bash-agent` for Bash-specific work and `posix-shell-agent` for portable `sh` work.
5. Prioritise correctness, destructive-risk reduction, and operator clarity over clever shell tricks.

## Recommended References

- `skills/bash-defensive-patterns/SKILL.md`
- `skills/shellcheck-configuration/SKILL.md`

## Workflow

1. Infer the shell target from `$ARGUMENTS` or the script context.
2. Load the matching local skill guidance.
3. Use the Task tool with the appropriate local agent for the target shell.

```text
Task:
  subagent_type: "bash-agent"
  description: "Review shell script for $ARGUMENTS"
  prompt: |
    Review this Bash shell script or shell task: $ARGUMENTS.

    Deliver a single markdown review with:
    1. Immediate correctness or safety risks
    2. Portability issues where relevant
    3. Suggested fixes or safer patterns
    4. Linting, testing, or validation guidance
    5. A concise recommended next step
```

If the target is POSIX `sh`, use the same workflow with `subagent_type: "posix-shell-agent"` instead.

## Completion

Return a concise summary with:

- the highest-risk issues first
- the safest corrections
- whether Bash or POSIX shell is the better fit
- any validation steps to run next
