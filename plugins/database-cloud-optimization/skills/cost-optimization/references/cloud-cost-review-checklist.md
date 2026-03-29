# Cloud Cost Review Checklist

## Review Categories

- Compute sizing, autoscaling, and idle resources
- Managed database and cache tier sizing
- Storage classes, snapshots, backup retention, and archival
- Network egress, NAT, load balancers, and cross-region traffic
- Observability spend from logs, traces, and metrics retention
- High-availability choices that may be oversized for the requirement

## Governance Checks

- Budget alerts exist at the right account, project, subscription, or compartment level
- Mandatory tags or labels are enforced for owner, environment, project, and cost center
- FinOps ownership is clear for each major workload
- Review cadence exists for anomalies, forecast drift, and realized savings

## Common Savings Levers

- Right-size compute and database tiers from measured utilisation
- Move bursty work to autoscaling or serverless where it actually lowers spend
- Use reserved or committed pricing only for stable baselines
- Reduce data transfer with caching, locality, and better placement
- Tune observability retention, sampling, and cardinality
- Remove idle replicas, stale snapshots, unused disks, and orphaned load balancers

## Validation Metrics

- Monthly spend by workload and by service
- Utilization by tier before and after rightsizing
- Database latency and throughput after cost changes
- Error rate, saturation, and queue depth after optimisation
- Forecasted vs realized savings after rollout
