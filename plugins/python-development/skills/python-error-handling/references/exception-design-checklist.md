# Exception Design Checklist

## Exception Type Design

- Does the exception tell the caller what went wrong in actionable terms?
- Is it clear whether the failure is validation, domain, dependency, or infrastructure related?
- Should this error be retried, surfaced, translated, or logged once and propagated?

## Handler Quality

- Is the `try` block narrow enough?
- Is the handler catching the right exception type?
- Is useful context preserved without leaking secrets?
- Is the fallback behavior safe and honest?

## Translation

- Should this layer translate a lower-level exception into a domain or API-facing one?
- If yes, is the original cause preserved with `raise ... from ...`?
