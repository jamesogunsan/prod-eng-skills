# Timeouts, Retries, And Idempotency

## Timeouts

- Prefer explicit per-dependency timeouts over implicit defaults.
- Make timeout budgets fit the caller's latency budget.

## Retries

- Retry only transient failures.
- Add limits, backoff, and jitter.
- Do not retry forever in background loops without clear operator signals.

## Idempotency

- Identify operations that may run more than once.
- Use idempotency keys, dedupe records, or safe upsert semantics where needed.
- Treat payments, notifications, and third-party writes as high-risk side effects.
