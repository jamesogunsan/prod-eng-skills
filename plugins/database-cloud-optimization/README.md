# Database Cloud Optimisation

This plugin bundles agents, commands, and reusable guidance for reducing cloud and database spend without losing performance, reliability, or architectural clarity.

## Contents

- `agents/`: local agents for cloud cost review, backend efficiency, database design, and database performance work
- `commands/`: orchestrated cost-review workflow for database and cloud optimisation
- `skills/`: reusable cost optimisation guidance and reference material for database-heavy and cloud-heavy reviews

## Focus Areas

- Cloud cost baselining across AWS, Azure, GCP, and OCI
- Database performance-to-cost tuning for queries, indexes, caching, replicas, and storage
- Backend architecture patterns that reduce unnecessary database and infrastructure load
- Target-state data architecture decisions that improve efficiency and scalability
- FinOps controls such as tagging, budgeting, and review cadence

## Use These Repo Skills In OpenCode

From the repository root, install a skill from this repo with `npx openskills install <skill-path>`.

Examples:

```bash
npx openskills install ./plugins/database-cloud-optimization/skills/cost-optimization
```
