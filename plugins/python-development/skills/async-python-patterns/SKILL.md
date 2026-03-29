---
name: async-python-patterns
description: Review async Python code with guidance on event-loop safety, task boundaries, cancellation, concurrency limits, blocking calls, and backpressure. Use for asyncio services, workers, and APIs.
---

# Async Python Patterns

Use this skill to review asynchronous Python code for correctness and production safety.

## Load References

- Read `references/async-review-checklist.md` for a general asyncio code review.
- Read `references/cancellation-and-concurrency-patterns.md` when the request is about task supervision, cancellation, timeouts, or fan-out control.

## Core Principles

- async code should make concurrency clearer, not harder to reason about
- avoid blocking the event loop with CPU work or synchronous I/O
- cancellation, timeouts, and cleanup need explicit handling
- concurrency should be bounded rather than unlimited by default

## Core Workflow

1. Identify where concurrency actually helps: I/O overlap, independent tasks, streaming, or queue-driven work.
2. Map blocking points, task creation sites, and cancellation boundaries.
3. Check how errors propagate across awaited tasks, task groups, and background work.
4. Review concurrency limits, timeout budgets, and cleanup behavior together.
5. Prefer explicit supervision over fire-and-forget task patterns.

## Review Guidance

- check for blocking library calls inside async code
- check whether tasks are awaited, supervised, or leaked
- check timeout and cancellation behavior
- check whether concurrency limits protect downstream systems
- check error handling around task groups and background tasks

## High-Value Heuristics

- If async code still performs blocking I/O, the event loop benefit is mostly gone.
- Prefer structured task management over manually tracked loose tasks.
- Cancellation should be treated as a real control path, not an afterthought.
- Bound fan-out with semaphores, queues, or worker pools when downstream capacity matters.
- If CPU-heavy work dominates, move it off the loop instead of forcing more async syntax.

## Common Failure Modes

- leaked tasks that keep running after request or job scope ends
- swallowed exceptions in background tasks
- timeout wrappers that cancel work without cleaning up state
- mixed sync and async clients causing hidden blocking
- unbounded concurrency overwhelming a dependency

## Validation Guidance

- test under concurrency, not only single-task correctness
- simulate cancellation and timeout behavior explicitly
- observe queue depth, in-flight tasks, and dependency latency under load
- verify shutdown behavior with active work in progress

## Output Expectations

1. Event-loop or blocking risks
2. Concurrency-boundary issues
3. Cancellation and timeout gaps
4. Safer async patterns to adopt
5. Validation steps under load
