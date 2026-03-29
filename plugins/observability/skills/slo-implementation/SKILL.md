---
name: slo-implementation
description: Define and improve SLIs, SLOs, error budgets, and burn-rate alerting for production services. Use when establishing reliability targets, reviewing service health objectives, or aligning alerts with user-facing impact.
---

# SLO Implementation

Use this skill to guide practical SLO design, rollout, and review.

## Load References

- Read `references/error-budget-checklist.md` for target setting, burn-rate alerting, and review-process guidance.

## Core Workflow

1. Identify the user-facing workflows or service promises that matter most.
2. Choose SLIs that can be measured reliably from existing telemetry.
3. Set SLO targets that are ambitious enough to guide decisions but realistic enough to be sustainable.
4. Define error-budget policy and burn-rate alerts before relying on the objectives operationally.
5. Review objectives regularly as architecture, traffic, or business criticality changes.

## What To Prioritize

- Availability, latency, success rate, and freshness where they reflect user impact
- Clean ownership of each objective, alert, and review process
- Multi-window burn-rate alerts instead of raw threshold paging
- Clear policy for risky releases when the error budget is being consumed quickly
- Practical dashboards and reports that show budget health and trend direction

## Output Expectations

Organize recommendations into:

1. Candidate SLIs
2. Recommended SLO targets and windows
3. Error-budget policy
4. Alerting and dashboard guidance
5. Review cadence, ownership, and risks
