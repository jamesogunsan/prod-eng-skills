# Job Retry And Recovery Patterns

## Retries

- retry only transient failures
- add bounded attempts and backoff
- separate permanent rejection from transient failure

## Recovery

- record enough state to inspect partial completion
- document replay safety for operators
- route poison jobs to dead-letter handling instead of infinite churn
