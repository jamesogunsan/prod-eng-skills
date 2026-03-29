# Propagation Gotchas

Use this note when traces do not stitch together cleanly.

## Common Pitfalls

- A WAF, load balancer, ingress, or service mesh component strips propagation headers.
- Trace context is extracted on ingress but not forwarded on outbound requests.
- Worker or queue processing starts without restoring the parent context.
- Operators expect the collector to repair missing context automatically.

## Practical Guidance

- Verify header forwarding at every edge hop before blaming the SDK.
- Check both logs and traces so you can see where the request path forks.
- Treat split traces as a request-path problem first, not only a dashboard problem.
- Make sure any trace-linked log formatter still works when export quality drops.
