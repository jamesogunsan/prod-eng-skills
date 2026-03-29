---
description: "Plan hardening improvements for shell automation using local shell agents"
argument-hint: "<script, automation workflow, or shell task> [--shell bash|posix] [--focus safety|ci|portability|balanced]"
---

# Shell Hardening

Use this command when the user wants to improve an existing shell script or automation workflow so it is safer and more production-ready.

## Command Rules

1. Stay within the scope of `$ARGUMENTS`.
2. Use only local agents from `plugins/shell-scripting/agents/`.
3. Load local skill guidance before recommending changes.
4. Prefer small, testable hardening steps over broad rewrites.
5. Call out destructive operations, environment assumptions, and rollback concerns explicitly.

## Recommended References

- `skills/bash-defensive-patterns/SKILL.md`
- `skills/shellcheck-configuration/SKILL.md`

## Workflow

Use the Task tool with the most appropriate local agent for the target shell:

```text
Task:
  subagent_type: "bash-agent"
  description: "Harden shell automation for $ARGUMENTS"
  prompt: |
    Harden this Bash shell automation task: $ARGUMENTS.

    Deliver a single markdown plan with:
    1. The main operational and safety risks
    2. The best immediate hardening changes
    3. Quoting, cleanup, validation, and error-handling improvements
    4. Linting, testing, and CI checks to add
    5. A staged rollout or verification approach
```

If the target is POSIX `sh`, use the same workflow with `subagent_type: "posix-shell-agent"` instead.

## Completion

Return a concise summary with:

- the most important hardening actions
- the safest rollout order
- the validation steps to run
- remaining risks or portability concerns
