---
name: prometheus-configuration
description: Design or improve Prometheus-based metrics collection, scrape strategy, recording rules, and alerting foundations for production systems. Use when setting up Prometheus, reviewing scrape coverage, defining recording rules, or planning actionable alerts.
---

# Prometheus Configuration

Use this skill to guide Prometheus setup and improvement work across collection, labelling, rules, and operational validation.

## Load References

- Read `references/scrape-and-alerting-checklist.md` for scrape coverage, relabelling, recording-rule, and alert-review guidance.

## Core Workflow

1. Identify which services, platforms, and dependencies need metrics.
2. Review scrape paths, labels, intervals, and service discovery before proposing new rules.
3. Separate raw collection concerns from query and recording-rule concerns.
4. Prefer recording rules for high-value, repeatedly used service-health views.
5. Keep alerts tied to user or operator impact rather than raw infrastructure noise.

## What To Prioritize

- Stable metric naming and label hygiene
- Coverage for latency, throughput, saturation, and errors
- Recording rules for expensive or frequently reused queries
- Alert rules with clear ownership, runbooks, and low noise
- Validation with `promtool` or equivalent checks where applicable

## Output Expectations

Organize recommendations into:

1. Metrics coverage and scrape design
2. Recording rules or query improvements
3. Alerting changes
4. Validation steps
5. Risks, scale limits, and cost considerations
