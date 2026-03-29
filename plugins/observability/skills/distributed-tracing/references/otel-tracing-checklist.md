# OTel Tracing Checklist

## Coverage

- Instrument ingress, core services, background jobs, and critical dependencies
- Include database, cache, queue, and third-party calls where they affect latency or failures
- Capture deploy or version metadata where useful for regression analysis

## Span Quality

- Use stable span names and meaningful service identifiers
- Add attributes that help filtering without exposing sensitive data
- Record retries, timeouts, and important error outcomes clearly

## Propagation

- Verify trace context across HTTP, gRPC, queues, and async workers
- Check that logs and traces can be correlated during incident review
- Confirm missing context does not break end-to-end analysis

## Sampling

- Keep enough traces for incident and regression analysis
- Increase detail for critical paths or known-problem services
- Review cost and storage implications before broadening capture
