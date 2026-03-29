---
description: "Plan or review a monitoring stack setup using the local observability plugin"
argument-hint: "<system or platform> [--focus metrics|dashboards|tracing|alerts|balanced] [--depth quick|standard|deep]"
---

# Monitoring Setup

Use this command when the user needs a practical setup or improvement plan for metrics, dashboards, tracing, and alerting.

## Command Rules

1. Stay within the scope of `$ARGUMENTS`.
2. Use only local agents from `plugins/observability/agents/`.
3. Load the relevant local skills before drafting recommendations.
4. Prefer phased rollout guidance over a large all-at-once platform rewrite.
5. Separate collection setup, dashboard design, and alerting decisions clearly.

## Recommended Skills

- `skills/prometheus-configuration/SKILL.md`
- `skills/grafana-dashboards/SKILL.md`
- `skills/distributed-tracing/SKILL.md`
- `skills/observability-design/SKILL.md`

## Suggested Workflow

1. Parse `$ARGUMENTS` into the target system, focus, and depth.
2. Use `observability-agent` to recommend the telemetry architecture, operator workflow, and rollout sequence.
3. Use `performance-agent` when the setup must support bottleneck analysis or capacity reviews.
4. Use `network-agent` and `database-agent` when network-path or datastore visibility is part of the monitoring scope.
5. Consolidate the answer into:
   - recommended monitoring stack and telemetry flow
   - Prometheus or metrics collection plan
   - dashboard structure and ownership model
   - tracing and correlation plan
   - alerting strategy and rollout order

## Expected Output

Produce an implementation-ready plan that names the first components to deploy, the telemetry to capture first, the dashboards to build first, and the alerts to avoid until better signal quality exists.
