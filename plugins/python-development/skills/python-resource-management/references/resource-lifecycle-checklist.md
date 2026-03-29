# Resource Lifecycle Checklist

## Acquisition

- What resources are opened or acquired?
- Who owns cleanup?
- Is the lifetime narrower than the enclosing function if possible?

## Failure Paths

- Do exceptions still release resources?
- Do timeouts or retries leave anything half-open?
- Are partial writes or temp artifacts cleaned up?

## Shutdown

- Do services and workers stop new work before cleanup?
- Are connections, locks, and subprocesses drained or terminated safely?
