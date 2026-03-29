# Database Cost Patterns

## Common Cost Drivers

- Large service tiers used to mask slow queries or missing indexes
- Over-replication for workloads that do not need the read capacity
- Storage growth from weak retention, verbose event data, or oversized backups
- Connection storms and inefficient pooling that force higher instance sizes
- Repeated reads caused by poor caching or chatty service boundaries

## Performance Problems That Raise Spend

- N+1 query patterns that inflate query count and CPU load
- Full table scans on hot paths due to missing or mismatched indexes
- Synchronous writes and long transactions that throttle concurrency
- Poor partitioning or archival strategy on large historical tables
- Expensive analytical queries running on transactional systems without isolation

## High-Value Improvements

- Rewrite or batch high-frequency queries before raising service tiers
- Add or correct indexes based on actual access patterns
- Introduce cache layers where read traffic is repetitive and invalidation is manageable
- Move cold data to cheaper storage or archival patterns
- Review replica count, failover topology, and storage IOPS assumptions against actual requirements

## Evidence To Collect

- Slow query samples and execution plans
- Read vs write mix by workload
- Cache hit rates and connection pool saturation
- Storage growth trends, retention windows, and backup volume
- Cost by database instance, cluster, or service tier
