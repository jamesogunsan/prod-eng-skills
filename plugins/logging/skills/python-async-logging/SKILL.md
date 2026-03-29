---
name: python-async-logging
description: Design or improve Python async logging using structured output, queue-based handlers, trace-linked context, and production-safe rollout guidance. Use when reviewing Python logging configuration, JSON logging, OpenTelemetry correlation, or non-blocking logging architecture.
---

# Python Async Logging

Use this skill to guide Python logging work where structured output, background I/O, and trace correlation matter.

## Load References

- Read `references/async-logging-patterns.md` for queue-based logging, formatter design, and rollout guidance.
- Read `references/trace-correlation-checklist.md` when the request involves OpenTelemetry, trace IDs, span IDs, or distributed context.

## Core Workflow

1. Identify the runtime model: API, worker, CLI, or scheduled job.
2. Review current handler design, formatting, sinks, and failure behaviour.
3. Prefer non-blocking output paths when synchronous logging could affect latency or throughput.
4. Add trace correlation and request context only where it improves diagnosis.
5. Recommend phased rollout, validation, and rollback rather than changing every sink at once.

## What To Prioritise

- Structured logs that support search, aggregation, and incident response
- Clear logger ownership between application code and shared libraries
- Queue-based or background processing when write latency matters
- Trace-linked fields that align logs with spans and request flow
- Safe handling of errors, backpressure, disk usage, and sensitive data

## Output Expectations

Organise recommendations into:

1. Current logging model and main risks
2. Minimum viable improvements
3. Recommended handler, formatter, and field design
4. Trace correlation guidance where relevant
5. Validation, rollout, and rollback steps
