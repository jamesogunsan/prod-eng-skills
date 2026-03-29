# Background Job Review Checklist

## Semantics

- What makes a job successful, retryable, or permanently failed?
- Is the job safe to run more than once?

## Operations

- Are queue depth, job age, retry count, and dead-letter volume visible?
- Can operators tell whether replay is safe?

## Lifecycle

- What happens on worker crash, deploy, restart, or dependency outage?
- Does shutdown drain or checkpoint work predictably?
