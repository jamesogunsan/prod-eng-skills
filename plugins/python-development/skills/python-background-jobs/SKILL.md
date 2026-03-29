---
name: python-background-jobs
description: Design and review Python background jobs, workers, schedulers, and queues with guidance on retries, idempotency, observability, and failure recovery. Use for async processing and operational job design.
---

# Python Background Jobs

Use this skill when the work runs outside a direct request-response flow.

## Load References

- Read `references/background-job-review-checklist.md` for end-to-end worker and queue reviews.
- Read `references/job-retry-and-recovery-patterns.md` when the main problem is retries, dead letters, duplicate work, or operator recovery.

## Core Principles

- background work must be observable and restart-safe
- retries should not duplicate unsafe side effects
- queue backlog and worker saturation need clear signals
- job design should separate orchestration from business logic

## Core Workflow

1. Identify the job trigger, work unit, side effects, and success criteria.
2. Review queue semantics, concurrency, retry policy, and idempotency together.
3. Check how jobs behave during deploys, worker crashes, restarts, and dependency failures.
4. Ensure operators can inspect age, backlog, failure mode, and replay safety.
5. Recommend the smallest hardening changes that reduce duplicate work and recovery pain.

## What To Review

- idempotency of job handlers
- retry and dead-letter behavior
- concurrency and locking risks
- queue depth, age, and throughput visibility
- startup, shutdown, and deploy behavior for workers

## Design Heuristics

- Keep the job payload minimal but sufficient to reload or reconstruct needed state.
- Make business logic testable outside the worker framework.
- Treat retries as part of semantics, not just infrastructure configuration.
- Prefer explicit dead-letter or poison-message handling over infinite churn.
- Be clear whether ordering matters and who owns that guarantee.

## Recovery Guidance

- Operators should know whether failed jobs are safe to replay.
- Distinguish transient failure from permanent business rejection.
- Record enough state to inspect partial completion and side effects.
- Shutdown should stop pulling new work before abandoning or draining current work.

## Common Failure Modes

- retries duplicating emails, payments, or third-party writes
- workers saturating downstream systems under backlog pressure
- hidden locking assumptions causing duplicate execution
- jobs that depend on request context no longer available when replayed
- no visibility into queue age, retry count, or dead-letter growth

## Output Expectations

1. Job and worker risks
2. Safer retry and idempotency patterns
3. Observability and alerting needs
4. Operational recovery guidance
5. Highest-value hardening steps
