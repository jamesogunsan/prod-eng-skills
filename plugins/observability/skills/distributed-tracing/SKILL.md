---
name: distributed-tracing
description: Design or improve distributed tracing with OpenTelemetry-first instrumentation, propagation, sampling, and trace analysis. Use when instrumenting services, debugging request paths, reviewing span quality, or planning trace-based diagnostics.
---

# Distributed Tracing

Use this skill to guide tracing rollout and trace-quality reviews across distributed services.

## Load References

- Read `references/otel-tracing-checklist.md` for instrumentation priorities, propagation checks, and sampling guidance.

## Core Workflow

1. Map the request path and identify the most important service boundaries.
2. Ensure trace context propagates across HTTP, messaging, jobs, and background work.
3. Prioritize spans that explain latency, retries, dependency time, and failures.
4. Review sampling, retention, and cost before recommending broader rollout.
5. Correlate traces with logs, metrics, and deploy events.

## What To Prioritize

- OpenTelemetry-first instrumentation unless an existing platform constrains the choice
- Consistent span naming and useful attributes
- Context propagation across all meaningful boundaries
- Trace views that reveal dependency latency and retry behaviour
- Sampling policies that preserve useful production visibility without excessive cost

## Output Expectations

Organize recommendations into:

1. Trace coverage and propagation gaps
2. Instrumentation priorities
3. Sampling and storage guidance
4. Debugging and analysis use cases
5. Validation and rollout steps
