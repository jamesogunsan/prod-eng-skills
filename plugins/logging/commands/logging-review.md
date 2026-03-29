---
description: "Review logging and trace correlation using local logging agents"
argument-hint: "<service, code path, config, or logging task> [--focus logging|tracing|privacy|balanced] [--depth quick|standard|deep]"
---

# Logging Review

Use this command when the user wants a production logging or trace-correlation review.

## Command Rules

1. Stay within the scope of `$ARGUMENTS`.
2. Use only local agents from `plugins/logging/agents/`.
3. Load local skill guidance before reviewing the target.
4. Prefer `logging-agent` for logging architecture and `tracing-agent` for propagation or correlation issues.
5. Prioritise operational usefulness, safe rollout, and clear findings over exhaustive theory.

## Recommended References

- `skills/logging-review/SKILL.md`
- `skills/python-async-logging/SKILL.md`

## Workflow

1. Determine whether the main risk is logging quality, trace propagation, or both.
2. Load the most relevant local skill.
3. Use the Task tool with the matching local agent.

```text
Task:
  subagent_type: "logging-agent"
  description: "Review logging setup for $ARGUMENTS"
  prompt: |
    Review this logging setup, code path, or operational logging task: $ARGUMENTS.

    Deliver a single markdown review with:
    1. Immediate correctness or operability risks
    2. Structured logging and context-field gaps
    3. Trace correlation issues where relevant
    4. Safe rollout or rollback considerations
    5. A concise recommended next step
```

If the problem is primarily distributed tracing or propagation, use the same workflow with `subagent_type: "tracing-agent"` instead.

## Completion

Return a concise summary with:

- the highest-risk gaps first
- the safest improvements
- whether logging, tracing, or both need attention first
- any validation steps to run next
