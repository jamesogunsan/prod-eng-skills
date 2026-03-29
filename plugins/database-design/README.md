# Database Design

This plugin bundles agents, commands, and reusable guidance for schema design, database platform selection, PostgreSQL-specific table design, and SQL review work.

## Contents

- `agents/`: local agents for database architecture and SQL analysis
- `commands/`: orchestrated review workflow for database design decisions
- `skills/`: reusable database design guidance, including PostgreSQL-specific rules

## Focus Areas

- Greenfield and re-architecture database design
- Technology selection across relational, NoSQL, and cloud databases
- Schema modeling, indexing, constraints, and migration planning
- PostgreSQL table design, data type selection, and operational gotchas
- SQL review work for complex queries, analytics, and performance-sensitive workloads

## Use These Repo Skills In OpenCode

From the repository root, install a skill from this repo with `npx openskills install <skill-path>`.

Examples:

```bash
npx openskills install ./plugins/database-design/skills/postgresql
```
