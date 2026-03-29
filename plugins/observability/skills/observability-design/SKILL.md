---
name: observability-design
description: Design or improve observability for modern services using practical telemetry coverage, OpenTelemetry-first instrumentation, alerting discipline, and SLI and SLO thinking. Use when reviewing dashboards, traces, logs, alert quality, operator workflows, or production visibility gaps.
---

# Observability Design

Use this skill to guide current-state reviews and target-state plans for monitoring, logging, tracing, alerting, and production diagnostics.

## Load References

- Read `references/telemetry-review-checklist.md` for baseline review structure, instrumentation priorities, and visibility gaps.
- Read `references/slo-and-alerting-guide.md` when the request involves SLI and SLO design, alert tuning, paging policy, or error budget thinking.

## Core Workflow

1. Identify the platform, service boundaries, and the most important user or operator workflows.
2. Assess current telemetry across metrics, logs, traces, events, and dependency visibility.
3. Separate collection problems from interpretation problems such as weak dashboards or noisy alerts.
4. Prioritize blind spots that slow down detection, diagnosis, or recovery.
5. Recommend phased rollout work instead of a large tooling rewrite unless the evidence supports it.

## What To Prioritize

- Fast detection of user-facing failures and latency regressions
- Clear ownership for dashboards, alerts, and operational runbooks
- OpenTelemetry-first instrumentation unless the user is tightly constrained by an existing vendor
- Correlation across logs, traces, metrics, and deployment events
- Cost-aware retention, sampling, and high-cardinality control

## Review Guidance

When the user has not supplied stricter targets, default to guidance such as:

- latency views that include p50, p95, and p99
- error-rate tracking for critical transactions and APIs
- saturation metrics for CPU, memory, queues, and connection pools
- alerting tied to user impact and burn rate rather than raw infrastructure noise
- dashboards that support triage first, deep diagnosis second

## Output Expectations

Organize recommendations into:

1. Current state and blind spots
2. Evidence or telemetry still needed
3. Immediate fixes
4. Target-state architecture and rollout plan
5. SLI, SLO, and alerting guidance
6. Risks, tradeoffs, ownership, and cost considerations
