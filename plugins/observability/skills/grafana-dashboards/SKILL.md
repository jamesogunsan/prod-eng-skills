---
name: grafana-dashboards
description: Design or improve Grafana dashboards for operators, service owners, and reliability reviews. Use when building dashboards, fixing weak visualisation, improving triage flow, or aligning metrics with operational decisions.
---

# Grafana Dashboards

Use this skill to guide dashboard design for service health, dependency visibility, and operational triage.

## Load References

- Read `references/dashboard-review-checklist.md` for panel selection, layout, variable, and ownership guidance.

## Core Workflow

1. Identify who will use the dashboard: on-call, service owner, platform team, or leadership.
2. Start with the questions the dashboard must answer during triage.
3. Organize the layout so service health appears before deep-diagnostic panels.
4. Prefer a few high-value dashboards over many weak ones.
5. Make ownership, runbooks, and linked alerts obvious.

## What To Prioritize

- RED and USE-style service and resource views where relevant
- Clear latency, error, throughput, and saturation panels
- Correlation with deploys, incidents, and dependency failures
- Templating only where it improves investigation speed
- Panel descriptions and units that reduce ambiguity

## Output Expectations

Organize recommendations into:

1. Dashboard audience and purpose
2. Panel layout and key queries
3. Variables and drill-down approach
4. Alert and runbook linkage
5. Review and maintenance expectations
