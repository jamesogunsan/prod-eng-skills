# SLO and Alerting Guide

## SLI Categories

- Availability for critical endpoints, jobs, or workflows
- Latency for user-facing requests and internal dependencies
- Correctness or success rate for core business transactions
- Freshness or delay for pipelines, queues, and asynchronous processing

## SLO Design Checks

- Define objectives around user impact, not only infrastructure health
- Choose windows that reflect real operational risk
- Track burn rate so alerts reflect urgency and remaining error budget
- Keep objectives realistic enough to support healthy engineering decisions

## Alerting Practices

- Page on urgent symptoms that need human action now
- Route lower-priority signals to tickets, chat, or review queues
- Include context: impacted service, suspected dependency, recent deploys, dashboards, and runbooks
- Suppress duplicates and correlate related alerts where possible
- Review false positives and stale alerts regularly

## Common Problems

- Paging on CPU or memory without service impact context
- Objectives that are too broad to guide prioritization
- Alerts with no dashboard, no runbook, or unclear ownership
- Overlapping thresholds that produce noisy escalations
- Missing alert coverage for silent failures, backlogs, and degraded dependencies
