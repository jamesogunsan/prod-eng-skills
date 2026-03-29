# Performance Review Checklist

## Baseline

- What metric is actually bad: latency, throughput, CPU, memory, startup, or cost?
- What profiling or telemetry data supports that claim?

## Hot Path Analysis

- Is the bottleneck CPU, I/O, allocation, serialization, or dependency latency?
- Are data structures and algorithms appropriate for the workload shape?

## Safety

- How will gains be validated?
- What correctness or readability risk does the optimization introduce?
- Is rollback easy if production behavior changes unexpectedly?
