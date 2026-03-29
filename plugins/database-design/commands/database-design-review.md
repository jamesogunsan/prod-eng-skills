---
description: "Review a database design request using the local database-design agents"
argument-hint: "<system or workload> [--focus schema|selection|postgresql|migration|balanced] [--depth quick|standard|deep]"
---

# Database Design Review

Use this command when the user wants a schema review, database technology recommendation, migration plan, PostgreSQL-specific design guidance, or SQL design feedback.

## Command Rules

1. Stay inside the scope described by `$ARGUMENTS`.
2. Use only local agents from `plugins/database-design/agents/`.
3. Prefer the plugin skill for reusable PostgreSQL guidance instead of repeating low-level rules from scratch.
4. Present trade-offs clearly: correctness, performance, operability, migration risk, and cost.
5. If the request is PostgreSQL-specific, load `skills/postgresql/SKILL.md` before launching agents.

## Suggested Workflow

### 1. Frame the request

- Parse `$ARGUMENTS` into:
  - target system or workload
  - review focus: `schema`, `selection`, `postgresql`, `migration`, or `balanced`
  - review depth: `quick`, `standard`, or `deep`
- Restate the problem in one short paragraph before launching agents.

### 2. Run the primary architecture review

Use the Task tool:

```text
subagent_type: "database-agent"
description: "Review database design for $ARGUMENTS"
prompt: |
  Review the database design request for: $ARGUMENTS.

  Produce a practical recommendation with:
  1. Recommended database architecture or platform choice
  2. Schema and data modeling guidance
  3. Key trade-offs across performance, consistency, operability, and migration risk
  4. Risks, assumptions, and constraints
  5. Phased next steps

  If the request is PostgreSQL-specific, use the patterns from `skills/postgresql/SKILL.md`.

  Write the final output as a concise markdown review.
```

### 3. Run supporting SQL review when relevant

Use the SQL review agent when the request includes query design, indexing, analytical SQL, reporting logic, or PostgreSQL implementation details.

```text
subagent_type: "sql-agent"
description: "Review SQL and schema details for $ARGUMENTS"
prompt: |
  Review the SQL and schema details for: $ARGUMENTS.

  Focus on:
  1. Query design and readability
  2. Indexing and access-path implications
  3. PostgreSQL-specific table design rules when relevant
  4. Migration safety and maintainability
  5. Concrete improvements or caveats

  Write the final output as a concise markdown review.
```

### 4. Consolidate the result

Return a final review with these sections:

1. Recommended database approach
2. Why this design fits
3. SQL or schema concerns to address
4. Risks and migration considerations
5. Next implementation steps

## Skill Routing

- `skills/postgresql/SKILL.md` for PostgreSQL-specific schema, indexing, constraints, and data type guidance

## Expected Output

The final response should be opinionated, implementation-ready, and explicit about trade-offs. Avoid generic database comparisons unless they materially affect the recommendation.
