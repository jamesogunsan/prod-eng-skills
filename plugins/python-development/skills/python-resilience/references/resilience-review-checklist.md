# Python Resilience Review Checklist

## Dependency Safety

- Does every external call have a timeout?
- Are retries bounded and jittered where appropriate?
- Are downstream limits and quotas respected?

## State Safety

- Can work be repeated safely?
- Are partial successes recorded clearly?
- Can replay or restart duplicate side effects?

## Load And Backpressure

- Is concurrency bounded?
- Are queue depth and task age visible?
- Can slow dependencies saturate workers or threads?

## Lifecycle

- Does startup validate what it needs?
- Does shutdown drain, checkpoint, or abandon work predictably?
- Are health and readiness signals meaningful?
