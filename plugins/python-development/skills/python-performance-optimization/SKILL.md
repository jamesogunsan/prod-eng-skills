---
name: python-performance-optimization
description: Review Python performance with guidance on profiling first, algorithm choice, data structures, allocation patterns, and avoiding premature optimization. Use for latency, throughput, and efficiency work.
---

# Python Performance Optimization

Use this skill when Python code is slow, memory-hungry, or under production pressure.

## Load References

- Read `references/performance-review-checklist.md` for a broad profiling and optimization review.
- Read `references/hot-path-optimization-patterns.md` when the focus is algorithmic, memory, or hot-path code changes.

## Core Principles

- measure before changing code
- prefer algorithm and data-structure wins over micro-optimizations
- readability still matters unless the hot path proves otherwise
- production performance work should include observability and rollback thinking

## Core Workflow

1. Define the performance problem clearly: latency, throughput, memory, startup, or cost.
2. Measure with profiling, tracing, sampling, or production telemetry before proposing code changes.
3. Isolate hot paths and separate CPU, I/O, allocation, and dependency latency issues.
4. Prefer structural wins before syntax-level tweaks.
5. Validate gains with before-and-after evidence and watch for correctness regressions.

## High-Value Review Areas

- repeated linear scans that should use sets or dictionaries
- unnecessary list creation when generators are enough
- expensive serialization or parsing in hot paths
- blocking I/O inside latency-sensitive flows
- large object churn and memory growth

## Optimization Heuristics

- Algorithmic complexity beats micro-optimizing individual lines.
- Caching helps only when the hit rate, invalidation rules, and memory cost are understood.
- Batch I/O or DB work when round-trip cost dominates.
- Reduce repeated parsing, conversion, and serialization in hot paths.
- If the workload is dependency-bound, tune concurrency or external interactions before rewriting pure Python logic.

## Common Traps

- benchmarking unrealistic toy inputs
- optimizing cold paths because they look ugly
- increasing complexity for gains too small to matter
- hiding performance problems with larger machines or more workers alone
- forgetting GC, allocation churn, or payload size effects

## Validation Guidance

- Capture the baseline, target, and measurement method.
- Validate both average and tail behavior where latency matters.
- Check CPU, memory, error rate, and dependency load after each change.
- Keep rollback and feature-flag options when production risk is meaningful.

## Output Expectations

1. Likely hot spots
2. What to measure first
3. Safer high-value optimizations
4. Risks to correctness or readability
5. Validation and rollback checks
