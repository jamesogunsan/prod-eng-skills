---
name: database-cloud-cost-optimisation
description: Review and improve database and cloud cost efficiency across infrastructure, data stores, and backend architecture. Use when a workload needs spending analysis, rightsizing, retention review, cost-performance tuning, or a phased optimisation plan.
---

# Database and Cloud Cost Optimisation

Use this skill to guide cost optimisation work that spans cloud infrastructure, databases, and backend architecture.

## Load References

- Read `references/cloud-cost-review-checklist.md` for provider-level review categories, tagging checks, and common savings levers.
- Read `references/database-cost-patterns.md` for database-specific cost drivers, performance traps, and remediation patterns.

## Core Workflow

1. Identify the primary spend drivers: compute, database tier, storage, network, observability, or overbuilt resilience.
2. Separate quick wins from structural changes.
3. Check whether performance problems are causing unnecessary spend.
4. Review backend architecture for chatty patterns, excess retries, or avoidable synchronous load.
5. Tie recommendations to expected savings, risk, and verification metrics.

## What To Prioritise

- Idle or oversized compute and database capacity
- Query inefficiencies that force larger database tiers
- Read and write amplification from poor schema, indexing, or service boundaries
- Storage growth from weak retention, backup, or archival policies
- Network and data-transfer charges caused by topology decisions
- Missing budgets, tagging, ownership, and review cadence

## Output Expectations

When producing recommendations, organise them into:

1. Current cost drivers
2. Evidence or metrics still needed
3. Immediate savings opportunities
4. Medium-term architecture changes
5. Guardrails, validation, and monitoring
6. Risks, trade-offs, and sequencing
