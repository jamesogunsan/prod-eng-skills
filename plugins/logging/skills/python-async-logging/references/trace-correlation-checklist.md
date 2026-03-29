# Trace Correlation Checklist

Use this checklist when logs and traces must line up during incident response.

## Required Checks

- Confirm instrumentation creates spans for the relevant request or job path.
- Verify trace IDs and span IDs can be pulled from active context and added to logs.
- Check that inbound headers are preserved through load balancers, gateways, and proxies.
- Check that outbound calls propagate context to downstream services.
- Validate worker, queue, and background-task boundaries where context is commonly lost.

## Sampling And Export

- Ensure sampling choices do not remove the traces operators expect to correlate with logs.
- Confirm exporter or collector failures do not silently hide telemetry loss.
- Keep correlation fields available in logs even when trace export quality is degraded.

## Common Failure Modes

- Missing parent spans because context was never extracted or reattached.
- Split traces because an edge component strips or rewrites propagation headers.
- Logs without trace fields because the formatter has no access to current context.
- Background tasks that start work without carrying request context forward.
