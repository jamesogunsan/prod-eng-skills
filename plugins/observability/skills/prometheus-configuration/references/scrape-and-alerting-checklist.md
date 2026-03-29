# Scrape and Alerting Checklist

## Scrape Review

- Confirm critical services expose stable metrics endpoints
- Verify service discovery, relabelling, and target ownership
- Check scrape interval, timeout, and sample volume trade-offs
- Remove labels that create high cardinality without operational value

## Recording Rules

- Precompute service-health queries used in dashboards or alerts often
- Keep naming consistent for rate, latency, saturation, and error views
- Prefer rules that simplify triage, not every possible aggregation

## Alert Review

- Alert on meaningful symptoms such as sustained failures, latency, or saturation
- Avoid paging on isolated host metrics without service context
- Include runbook links, dashboard links, and ownership in annotations
- Review duplicate rules and threshold overlap

## Validation

- Validate config and rules before rollout
- Test queries against realistic traffic or historical data
- Check rule evaluation cost and alert fan-out risk
