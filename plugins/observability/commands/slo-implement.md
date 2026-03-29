---
description: "Design SLOs and alerting guidance using the local observability plugin"
argument-hint: "<service or workflow> [--focus availability|latency|error-budget|balanced] [--depth quick|standard|deep]"
---

# SLO Implementation

Use this command when the user needs service level indicators, service level objectives, burn-rate alerting, or error-budget guidance.

## Command Rules

1. Stay within the scope of `$ARGUMENTS`.
2. Use only local agents from `plugins/observability/agents/`.
3. Load `skills/slo-implementation/SKILL.md` and `skills/observability-design/SKILL.md` before drafting targets or alerts.
4. Tie SLOs to user-facing outcomes, not generic infrastructure thresholds.
5. Keep proposed objectives realistic enough to support engineering decisions.

## Suggested Workflow

1. Parse `$ARGUMENTS` into the service, workflow, focus, and depth.
2. Use `observability-agent` to identify meaningful SLIs, ownership boundaries, and alerting expectations.
3. Use `performance-agent` when latency or throughput objectives need more detailed measurement guidance.
4. Structure the answer into:
   - candidate SLIs and why they matter
   - recommended SLO targets and windows
   - error-budget policy and burn-rate alerts
   - dashboard and review-process expectations
   - rollout and validation plan

## Expected Output

Produce an opinionated SLO plan with practical targets, alerting logic, review cadence, and the data needed to measure compliance reliably.
