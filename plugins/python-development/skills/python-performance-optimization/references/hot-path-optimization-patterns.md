# Hot Path Optimization Patterns

- replace repeated scans with indexed lookups where access patterns justify it
- avoid repeated parse or serialization work in tight loops
- batch I/O when round-trip latency dominates
- prefer generators when large temporary collections are avoidable
- reduce object churn when memory pressure or GC becomes visible
