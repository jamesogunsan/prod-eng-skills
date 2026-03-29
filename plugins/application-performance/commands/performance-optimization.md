---
description: "Run a phased application performance review using local performance agents"
argument-hint: "<application or service> [--focus latency|throughput|cost|balanced] [--depth quick|standard|deep]"
---

# Application Performance Review

Use this command to run a practical performance review for an application, service, or user journey. Keep the workflow evidence-led, production-aware, and local to this plugin.

## Rules

1. Work in order and do not skip phases.
2. Write each phase output to `.performance-optimization/` before moving on.
3. Use only local agents from `plugins/application-performance/agents/`.
4. Stop at each checkpoint and ask the user whether to proceed, revise, or pause.
5. Prefer measured bottlenecks, safe rollout steps, and clear validation over broad optimisation advice.

## Required Local Inputs

- Load `skills/apm-implementation/SKILL.md`
- Read `skills/apm-implementation/references/uptrace-apm-guide.md` when the user needs APM, telemetry, or OpenTelemetry guidance
- Read `skills/apm-implementation/references/mendix-performance-best-practices.md` when the target is a Mendix system

## Session State

Create `.performance-optimization/` if it does not exist.

Create or update `.performance-optimization/state.json` with:

```json
{
  "target": "$TARGET",
  "focus": "balanced",
  "depth": "standard",
  "status": "in_progress",
  "current_phase": 1,
  "files_created": []
}
```

Parse `$ARGUMENTS` so that:

- `$TARGET` is the request before any flags
- `--focus` defaults to `balanced`
- `--depth` defaults to `standard`

## Phase 1: Baseline and Visibility

### Step 1: Baseline profile

Use the Task tool:

```yaml
Task:
  subagent_type: "performance-agent"
  description: "Create performance baseline for $TARGET"
  prompt: |
    Review the performance of: $TARGET.

    Establish a baseline for the most important user journeys, service paths, or background jobs.
    Use the provided focus and depth settings. Prioritise latency, throughput, error rate,
    saturation, and cost where relevant.

    Include:
    1. Likely bottlenecks ranked by impact
    2. Evidence needed or already available
    3. Immediate quick wins
    4. Structural risks or capacity constraints
    5. Metrics to track during the rest of the review

    Write the result as a single markdown report.
```

Save output to `.performance-optimization/01-baseline.md`.

### Step 2: Observability review

Read `.performance-optimization/01-baseline.md`.

Use the Task tool:

```yaml
Task:
  subagent_type: "observability-agent"
  description: "Review observability for $TARGET"
  prompt: |
    Review observability and APM readiness for: $TARGET.

    ## Baseline
    [Insert contents of .performance-optimization/01-baseline.md]

    Assess whether the current metrics, logs, traces, alerts, and dashboards are good enough
    to diagnose performance issues quickly in production.

    Include:
    1. Instrumentation gaps
    2. Alerting or dashboard weaknesses
    3. High-value telemetry improvements
    4. APM or OpenTelemetry rollout advice where relevant
    5. Validation signals for later changes

    Write the result as a single markdown report.
```

Save output to `.performance-optimization/02-observability.md`.

### Step 3: Frontend and journey review

Read `.performance-optimization/01-baseline.md`.

Use the Task tool:

```yaml
Task:
  subagent_type: "frontend-agent"
  description: "Review frontend performance for $TARGET"
  prompt: |
    Review frontend or browser-facing performance for: $TARGET.

    ## Baseline
    [Insert contents of .performance-optimization/01-baseline.md]

    If the target is not browser-facing, state that clearly and explain what can be skipped.
    Otherwise assess Core Web Vitals, loading behaviour, rendering cost, bundle weight,
    caching, and user-perceived speed.

    Include:
    1. The slowest journeys or pages
    2. Likely causes of poor user-perceived speed
    3. Quick wins and larger delivery changes
    4. Rollout or cache risks to watch
    5. Metrics to verify improvement

    Write the result as a single markdown report.
```

Save output to `.performance-optimization/03-frontend.md`.

## Checkpoint 1

Summarise the findings from:

- `.performance-optimization/01-baseline.md`
- `.performance-optimization/02-observability.md`
- `.performance-optimization/03-frontend.md`

Then stop and ask the user to choose:

1. Proceed to optimisation planning
2. Revise the baseline or reviews
3. Pause and save progress

Update `.performance-optimization/state.json` before stopping.

## Phase 2: Optimisation Planning

### Step 4: Service and data path improvements

Read `.performance-optimization/01-baseline.md` and `.performance-optimization/02-observability.md`.

Use the Task tool:

```yaml
Task:
  subagent_type: "performance-agent"
  description: "Plan service and data path improvements for $TARGET"
  prompt: |
    Create a production-safe optimisation plan for: $TARGET.

    ## Baseline
    [Insert contents of .performance-optimization/01-baseline.md]

    ## Observability Review
    [Insert contents of .performance-optimization/02-observability.md]

    Focus on backend, API, worker, queue, cache, and database paths.

    Include:
    1. Highest-value improvements in priority order
    2. Query, cache, concurrency, or batching changes where relevant
    3. Capacity or architecture risks
    4. Rollout and rollback considerations
    5. Tests and measurements needed before and after change

    Write the result as a single markdown report.
```

Save output to `.performance-optimization/04-services.md`.

### Step 5: Frontend delivery improvements

Read `.performance-optimization/03-frontend.md`.

Use the Task tool:

```yaml
Task:
  subagent_type: "frontend-agent"
  description: "Plan frontend delivery improvements for $TARGET"
  prompt: |
    Turn the frontend findings for: $TARGET into a practical optimisation plan.

    ## Frontend Review
    [Insert contents of .performance-optimization/03-frontend.md]

    Include:
    1. Bundle and asset delivery improvements
    2. Rendering and interaction improvements
    3. CDN, caching, or image delivery guidance where relevant
    4. Risks to accessibility, SEO, or cache correctness
    5. How to verify the user impact after release

    Write the result as a single markdown report.
```

Save output to `.performance-optimization/05-frontend-plan.md`.

### Step 6: Monitoring and regression guardrails

Read `.performance-optimization/02-observability.md`, `.performance-optimization/04-services.md`, and `.performance-optimization/05-frontend-plan.md`.

Use the Task tool:

```yaml
Task:
  subagent_type: "observability-agent"
  description: "Define monitoring and regression guardrails for $TARGET"
  prompt: |
    Define monitoring, alerting, and regression guardrails for: $TARGET.

    ## Observability Review
    [Insert contents of .performance-optimization/02-observability.md]

    ## Service Plan
    [Insert contents of .performance-optimization/04-services.md]

    ## Frontend Plan
    [Insert contents of .performance-optimization/05-frontend-plan.md]

    Include:
    1. The telemetry needed before rollout
    2. Alerts, dashboards, and SLO checks to watch after release
    3. Regression thresholds or performance budgets
    4. Suggested load or comparison testing
    5. Runbook or ownership notes for follow-up

    Write the result as a single markdown report.
```

Save output to `.performance-optimization/06-guardrails.md`.

## Checkpoint 2

Summarise the plans from:

- `.performance-optimization/04-services.md`
- `.performance-optimization/05-frontend-plan.md`
- `.performance-optimization/06-guardrails.md`

Then stop and ask the user to choose:

1. Proceed to rollout roadmap
2. Revise the optimisation plans
3. Pause and save progress

Update `.performance-optimization/state.json` before stopping.

## Phase 3: Rollout Roadmap

### Step 7: Final roadmap

Read all files in `.performance-optimization/`.

Use the Task tool:

```yaml
Task:
  subagent_type: "performance-agent"
  description: "Create final performance roadmap for $TARGET"
  prompt: |
    Create the final optimisation roadmap for: $TARGET.

    Use the baseline, review, and guardrail outputs to produce a staged plan that an
    engineering team could execute safely.

    Include:
    1. Immediate quick wins
    2. Medium-term engineering changes
    3. High-risk structural work that needs extra validation
    4. Rollout sequence and ownership suggestions
    5. Success measures for each stage

    Write the result as a single markdown report.
```

Save output to `.performance-optimization/07-roadmap.md`.

## Completion

Update `.performance-optimization/state.json` so it records:

- `status: "complete"`
- `current_phase: 3`
- all files created during the workflow

Present a concise final summary covering:

- the biggest bottlenecks found
- the most important telemetry gaps
- the safest high-impact improvements
- the recommended rollout order
- the files created in `.performance-optimization/`
