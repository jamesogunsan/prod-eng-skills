# Async Review Checklist

## Event Loop Safety

- Are blocking calls present in async code?
- Are CPU-heavy sections running on the event loop unnecessarily?

## Task Management

- Are tasks awaited or supervised?
- Can background tasks fail silently?
- Is cancellation handled explicitly?

## Concurrency Control

- Are fan-out and downstream load bounded?
- Do timeouts fit the end-to-end latency budget?
