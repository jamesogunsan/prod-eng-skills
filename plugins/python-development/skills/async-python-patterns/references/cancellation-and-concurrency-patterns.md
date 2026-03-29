# Cancellation And Concurrency Patterns

## Cancellation

- treat cancellation as a normal control path
- clean up partial state before propagating or suppressing cancellation

## Concurrency

- use semaphores, queues, or worker pools to bound fan-out
- prefer structured task groups over loose fire-and-forget tasks
- make timeout ownership explicit at each boundary
