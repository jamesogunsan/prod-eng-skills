# Context Manager And Cleanup Patterns

## Prefer

- `with` blocks for files, sessions, temp resources, and managed handles
- explicit startup and shutdown hooks for long-lived clients
- cleanup tests for exception and cancellation paths

## Watch For

- context managers that hide network calls or retries unexpectedly
- manual open-close logic spread across multiple branches
- resource cleanup depending on garbage collection timing
