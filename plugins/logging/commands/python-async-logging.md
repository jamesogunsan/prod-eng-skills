---
description: "Plan Python async logging and trace-linked context using local logging agents"
argument-hint: "<python service, API, worker, or logging task> [--focus async|tracing|json|balanced]"
---

# Python Async Logging

Use this command when the user wants to design or improve non-blocking Python logging with structured output and trace correlation.

## Command Rules

1. Stay within the scope of `$ARGUMENTS`.
2. Use only local agents from `plugins/logging/agents/`.
3. Load local skill guidance before giving implementation advice.
4. Prefer `logging-agent` for logger design and `tracing-agent` when propagation or span correlation is central.
5. Emphasise safe rollout, validation, and operator usability.

## Recommended References

- `skills/python-async-logging/SKILL.md`
- `skills/logging-review/SKILL.md`

## Workflow

1. Identify the Python runtime, framework, and current logging model.
2. Load `skills/python-async-logging/SKILL.md`.
3. Use the Task tool with a local agent.

```text
Task:
  subagent_type: "logging-agent"
  description: "Plan Python async logging for $ARGUMENTS"
  prompt: |
    Design or improve Python async logging for this target: $ARGUMENTS.

    Deliver a single markdown plan with:
    1. Recommended logger and handler structure
    2. Queue-based or non-blocking design guidance
    3. Structured logging fields and exception handling
    4. Trace correlation expectations where relevant
    5. Validation, rollout, and rollback advice
```

If trace propagation or span stitching is the main risk, switch to `subagent_type: "tracing-agent"`.

## Completion

Return a concise summary with:

- the safest implementation path
- the minimum telemetry fields that must be present
- the main rollout risks
- the next validation step
