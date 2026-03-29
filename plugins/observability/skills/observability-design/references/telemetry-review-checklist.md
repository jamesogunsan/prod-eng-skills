# Telemetry Review Checklist

## Coverage Areas

- Critical user journeys, APIs, async jobs, and background workers
- Dependencies such as databases, caches, queues, third-party APIs, and service mesh hops
- Infrastructure layers including compute, containers, load balancers, storage, and network paths
- Deployment and change events that help explain regressions

## Signals To Check

- Metrics for latency, throughput, saturation, and errors
- Logs that are structured, queryable, and correlated with request or trace identifiers
- Traces that show service boundaries, downstream calls, retries, and time spent
- Events or annotations for deploys, incidents, feature flags, and batch operations

## Common Blind Spots

- Missing telemetry for background jobs or scheduled tasks
- Alert rules that fire on symptoms without useful context
- Dashboards that show raw infrastructure but not service health
- High-cardinality metrics that are expensive but not actionable
- Database and queue bottlenecks that cannot be tied back to callers
- Network or CDN issues with weak visibility into hops, TLS, or regional behaviour

## Review Questions

- Can an operator detect customer-facing failure quickly?
- Can an engineer identify the failing dependency within minutes?
- Can the team explain what changed before the issue started?
- Are dashboards and alerts mapped to ownership and runbooks?
- Is telemetry cost proportional to the value it provides?
