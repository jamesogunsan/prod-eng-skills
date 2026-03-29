---
name: python-resilience
description: Improve resilience in Python services and jobs with guidance on retries, timeouts, idempotency, backpressure, graceful degradation, and shutdown handling. Use for production design and hardening.
---

# Python Resilience

Use this skill to review whether Python systems fail safely under real production conditions.

## Load References

- Read `references/resilience-review-checklist.md` for a broad production review.
- Read `references/timeouts-retries-and-idempotency.md` when the request is about dependency failure, duplicate work, or recovery semantics.

## Core Principles

- timeouts, retries, and idempotency should be explicit
- degraded behavior is better than uncontrolled collapse
- shutdown and restart behavior matters as much as steady-state behavior
- resilience work should reduce blast radius, not just add more retry loops

## Core Workflow

1. Map critical request, job, and dependency paths.
2. Identify where latency, overload, and partial failure can accumulate.
3. Review timeout, retry, and concurrency behavior together rather than in isolation.
4. Check whether duplicate execution or partial success can corrupt state.
5. Recommend the smallest changes that reduce blast radius first.

## Review Guidance

- check timeout strategy across HTTP, queues, databases, and subprocesses
- check whether retries are bounded and safe
- check whether duplicate work or partial failure can corrupt state
- check whether services drain and shut down cleanly
- check whether dependency failure creates backpressure or cascading failure

## Timeouts, Retries, And Backpressure

- Every external dependency should have an explicit timeout.
- Retries need attempt limits, jitter or backoff, and a clear owner.
- Retries should not outlive the usefulness of the request or job.
- Backpressure controls should protect downstream dependencies and your own worker pools.
- Queue depth, task age, and worker saturation should be observable.

## Idempotency And State Safety

- Call out which operations are safe to repeat and which are not.
- Prefer idempotency keys, deduplication, or upsert-style semantics where repeated attempts are likely.
- Record enough state to distinguish never-started, in-progress, partially-completed, and completed work.
- Be explicit about external side effects such as payments, emails, or third-party writes.

## Shutdown And Recovery

- Services should stop accepting new work before terminating active work.
- Workers should finish, checkpoint, or safely abandon tasks according to clear semantics.
- Startup should validate required dependencies and configuration early.
- Recovery guidance should include replay safety, rollback expectations, and operator signals.

## Output Expectations

1. Resilience gaps
2. Timeout and retry fixes
3. Idempotency or state-safety concerns
4. Graceful degradation ideas
5. Operational checks to add
