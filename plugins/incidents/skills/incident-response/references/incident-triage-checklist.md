# Incident Triage Checklist

Use this checklist to keep incident handling structured under pressure.

## Classify the Incident

- What is broken or degraded?
- Who is affected and how severely?
- Is there data loss, security exposure, or revenue risk?
- What is the current blast radius?
- Does this need immediate escalation?

## Gather High-Value Evidence

- Alerts, dashboards, logs, traces, and error samples
- Recent deploys, config changes, migrations, and dependency events
- Scope by region, tenant, endpoint, queue, job type, or feature flag
- Known workarounds, runbooks, and past incident history

## Stabilize Safely

- Prefer rollback, failover, or traffic reduction when reversible
- Disable the smallest risky feature before broader shutdowns
- Define validation checks before making changes
- Record who is doing what and when the next status update is due

## Track the Investigation

- List ranked hypotheses and the evidence for each one
- Note what has already been ruled out
- Distinguish probable cause from confirmed cause
- Keep a timeline of major events and decisions

## Close the Loop

- Confirm recovery with service, user, and business signals
- Capture residual risk and follow-up monitoring needs
- Schedule postmortem and assign owners for action items
