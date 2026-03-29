---
name: python-observability
description: Improve observability in Python services and jobs with guidance on logs, metrics, traces, correlation, and debugging signals. Use for production reviews and incident-readiness work.
---

# Python Observability

Use this skill to make Python services easier to debug and operate.

## Load References

- Read `references/python-observability-checklist.md` for a broad signal review.
- Read `references/logging-metrics-and-tracing-guide.md` when deciding what telemetry to add and where.

## Core Principles

- logs should help explain what happened, not just that something happened
- metrics should support capacity, latency, error-rate, and backlog reasoning
- traces or request correlation matter when work crosses process or service boundaries
- observability should support triage, not create noisy dashboards

## Core Workflow

1. Identify the critical workflows, dependencies, and failure modes.
2. Review what an operator can currently see during an incident.
3. Separate baseline signals from nice-to-have telemetry.
4. Add correlation across logs, metrics, traces, deploys, and job execution.
5. Prefer signals that explain operator action, not vanity dashboards.

## What To Review

- structured logging fields and request correlation
- error logs that preserve enough context
- latency, throughput, queue, and failure metrics
- startup, shutdown, and dependency health signals
- alerts that point to real operator action

## Signal Design Heuristics

- Prefer structured logs with stable keys over free-form narrative strings.
- Log identifiers that help reconstruction: request ID, job ID, dependency name, tenant or shard where appropriate.
- Record counters, durations, backlog, saturation, and error classes before inventing many custom metrics.
- Use traces or correlation IDs where requests cross async, worker, or service boundaries.
- Treat alert quality as part of observability quality.

## Common Gaps

- logs without correlation identifiers
- metrics that count events but not latency or backlog
- no visibility into retries, queue age, or dependency timeouts
- startup and shutdown behavior missing from telemetry
- alerts that fire on symptoms without enough triage context

## Operational Guidance

- Emit one clear error at the boundary with enough context to act.
- Track background job execution, retry count, age, and outcome separately.
- Include deploy version or build metadata in logs and metrics when incident diagnosis depends on change timing.
- Review telemetry cost and noise as part of rollout.

## Output Expectations

1. Signal gaps
2. Logging improvements
3. Metrics or trace coverage to add
4. Incident triage improvements
5. The smallest useful observability upgrades
