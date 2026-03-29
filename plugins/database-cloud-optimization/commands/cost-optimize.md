---
description: "Run a phased database and cloud cost optimisation review using local agents"
argument-hint: "<system or workload> [--focus cloud|database|backend|balanced] [--depth quick|standard|deep]"
---

# Database and Cloud Cost Optimisation

Use this command to run a structured cost review for a workload with database, backend, and cloud components.

## Command Rules

1. Execute the steps in order.
2. Save each step output under `.database-cloud-optimization/` before moving on.
3. Read prior step files when a later step depends on them.
4. Stop at the checkpoint and wait for explicit user approval before continuing.
5. Use only local agents from this plugin.
6. If a step fails, stop and report the issue instead of skipping ahead.

## Pre-flight

1. Create `.database-cloud-optimization/` if it does not exist.
2. Parse `$ARGUMENTS` into:
   - `$TARGET`: everything before flags
   - `--focus`: default `balanced`
   - `--depth`: default `standard`
3. Create `.database-cloud-optimization/state.json` with the target, focus, depth, current step, and created files.

## Recommended References

- Read `../skills/cost-optimization/SKILL.md` before starting.
- Read `../skills/cost-optimization/references/database-cost-patterns.md` when the work is database-heavy.
- Read `../skills/cost-optimization/references/cloud-cost-review-checklist.md` when the work is cloud-infrastructure-heavy.

---

## Phase 1: Baseline Review

### Step 1: Cloud Cost Baseline

Use the Task tool:

```yaml
subagent_type: cloud-agent
description: Review cloud cost baseline for $TARGET
prompt: |
  Review the cloud cost baseline for: $TARGET.

  Focus: $FOCUS
  Depth: $DEPTH

  Assess likely spend drivers across compute, storage, networking, managed services,
  observability, and resilience choices. Highlight waste patterns, weak tagging,
  overprovisioning, and missing budget controls.

  Deliverables:
  1. Current cost driver summary
  2. Top waste and inefficiency risks
  3. Provider-specific review checklist
  4. Quick wins vs structural changes

  Write the result as one markdown document.
```

Save to `.database-cloud-optimization/01-cloud-baseline.md`.

### Step 2: Database Cost and Performance Review

Read `.database-cloud-optimization/01-cloud-baseline.md`.

Use the Task tool:

```yaml
subagent_type: database-performance-agent
description: Review database cost and performance for $TARGET
prompt: |
  Review database cost and performance trade-offs for: $TARGET.

  Focus: $FOCUS
  Depth: $DEPTH

  Cloud baseline:
  [Insert full contents of .database-cloud-optimization/01-cloud-baseline.md]

  Assess likely issues in query shape, indexing, connection management, caching,
  replicas, storage growth, retention, and service tier sizing. Call out where
  performance problems are creating unnecessary spend.

  Deliverables:
  1. Database cost drivers
  2. Performance-to-cost bottlenecks
  3. Query, index, and caching opportunities
  4. Capacity and storage recommendations

  Write the result as one markdown document.
```

Save to `.database-cloud-optimization/02-database-review.md`.

### Step 3: Backend and Architecture Efficiency Review

Read `.database-cloud-optimization/01-cloud-baseline.md` and `.database-cloud-optimization/02-database-review.md`.

Use the Task tool:

```yaml
subagent_type: backend-agent
description: Review backend efficiency for $TARGET
prompt: |
  Review backend architecture efficiency for: $TARGET.

  Focus: $FOCUS
  Depth: $DEPTH

  Cloud baseline:
  [Insert full contents of .database-cloud-optimization/01-cloud-baseline.md]

  Database review:
  [Insert full contents of .database-cloud-optimization/02-database-review.md]

  Assess API shapes, chatty service patterns, synchronous dependencies, retry storms,
  queue usage, cache placement, and background job design. Identify architecture issues
  that increase cloud spend or database load.

  Deliverables:
  1. Backend inefficiencies driving cost
  2. Service and API design improvements
  3. Caching and async processing opportunities
  4. Expected impact on cloud and database spend

  Write the result as one markdown document.
```

Save to `.database-cloud-optimization/03-backend-review.md`.

---

## Checkpoint

Present a short summary from:

- `.database-cloud-optimization/01-cloud-baseline.md`
- `.database-cloud-optimization/02-database-review.md`
- `.database-cloud-optimization/03-backend-review.md`

Ask the user:

```text
Initial cost review complete.

1. Approve - build the optimisation plan
2. Request changes - tell me what to revisit
3. Pause - save progress and stop here
```

Do not continue unless the user selects option 1.

---

## Phase 2: Optimisation Plan

### Step 4: Target-State Database Design Review

Read `.database-cloud-optimization/02-database-review.md` and `.database-cloud-optimization/03-backend-review.md`.

Use the Task tool:

```yaml
subagent_type: database-agent
description: Design target-state data architecture for $TARGET
prompt: |
  Propose target-state database architecture improvements for: $TARGET.

  Database review:
  [Insert full contents of .database-cloud-optimization/02-database-review.md]

  Backend review:
  [Insert full contents of .database-cloud-optimization/03-backend-review.md]

  Recommend schema, data placement, replication, partitioning, retention, and service
  boundary changes that reduce long-term cost without creating fragile operations.

  Deliverables:
  1. Target-state data architecture
  2. Migration and rollout considerations
  3. Risks and trade-offs
  4. Cost and scalability impact

  Write the result as one markdown document.
```

Save to `.database-cloud-optimization/04-data-architecture.md`.

### Step 5: Consolidated Cost Optimisation Plan

Read all prior files in `.database-cloud-optimization/`.

Use the Task tool:

```yaml
subagent_type: cloud-agent
description: Build consolidated optimisation plan for $TARGET
prompt: |
  Build a consolidated database and cloud cost optimisation plan for: $TARGET.

  Use the prior review documents as inputs.

  Produce a phased plan covering:
  - immediate savings
  - medium-term architecture changes
  - database-specific efficiency improvements
  - governance controls such as budgets, tagging, and review cadence

  Deliverables:
  1. Prioritised action plan
  2. Estimated savings bands
  3. Dependencies and sequencing
  4. Validation metrics and guardrails

  Write the result as one markdown document.
```

Save to `.database-cloud-optimization/05-optimization-plan.md`.

## Completion

Update `.database-cloud-optimization/state.json` to mark the run complete and list the generated files.

Present the final result with:

1. Key cost drivers
2. Highest-value optimisations
3. Risks and trade-offs
4. Files created in `.database-cloud-optimization/`
