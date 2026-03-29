# Failure Handling Recipes

## Fail Fast

Use when inputs are invalid, invariants are broken, or continuing would hide corruption.

## Retry

Use when the failure is transient and the operation is safe to repeat. Pair with backoff, limits, and observability.

## Fallback

Use only when degraded output is truly acceptable and the caller can live with reduced fidelity.

## Translate

Use when internal exception types should not cross a boundary, but preserve the original cause when possible.

## Propagate

Use when the current layer lacks the right context to recover safely.
