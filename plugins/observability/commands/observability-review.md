---
description: "Coordinate an observability review using the local observability plugin"
argument-hint: "<system or service> [--focus telemetry|alerting|performance|reliability|balanced] [--depth quick|standard|deep]"
---

# Observability Review

Use this command when the user needs to review or improve monitoring, logging, tracing, alerting, or telemetry coverage for a service or platform.

## Command Rules

1. Stay within the scope of `$ARGUMENTS`.
2. Use only local agents from `plugins/observability/agents/`.
3. Write step outputs under `.observability/` and read those files before the next phase.
4. Load the local skill and references before drafting architecture or alerting guidance.
5. Prioritize signal quality, operator usefulness, and implementation realism over tool sprawl.
6. Stop at the checkpoint before moving from current-state review to target-state recommendations.

## Pre-flight

1. Create `.observability/` if it does not exist.
2. Parse `$ARGUMENTS` into:
   - `$TARGET`: the system or service being reviewed
   - `focus`: `telemetry`, `alerting`, `performance`, `reliability`, or `balanced`
   - `depth`: `quick`, `standard`, or `deep`
3. Initialize `.observability/state.json` with the target, chosen focus, chosen depth, current step, created files, and status.

## Recommended References

- `skills/observability-design/SKILL.md`
- `skills/observability-design/references/telemetry-review-checklist.md`
- `skills/observability-design/references/slo-and-alerting-guide.md`

## Phase 1: Current-State Review

### Step 1: Observability Baseline

Use the Task tool:

```yaml
Task:
  subagent_type: "observability-agent"
  description: "Assess observability baseline for $TARGET"
  prompt: |
    Review the current observability posture for: $TARGET.

    Assess monitoring coverage, tracing, logging quality, dashboard usefulness,
    alert quality, and major instrumentation gaps. Focus on what operators need
    in order to detect, diagnose, and explain production issues quickly.

    Deliver a single markdown report with:
    1. Current telemetry strengths
    2. Instrumentation and visibility gaps
    3. Alerting and dashboard quality issues
    4. Highest-risk blind spots
    5. Immediate fixes worth doing first
```

Save the output to `.observability/01-baseline.md`.

### Step 2: Performance Signal Review

Read `.observability/01-baseline.md`.

Use the Task tool:

```yaml
Task:
  subagent_type: "performance-agent"
  description: "Review performance telemetry for $TARGET"
  prompt: |
    Review performance-related observability for: $TARGET.

    Use the baseline review below to identify missing latency, throughput,
    saturation, user-experience, and workload signals.

    ## Baseline Review
    [Insert contents of .observability/01-baseline.md]

    Deliver a single markdown report with:
    1. Missing or weak performance signals
    2. Metrics and traces needed for bottleneck analysis
    3. Dashboard improvements for operators and engineering teams
    4. Validation ideas for performance regressions
    5. Priority recommendations
```

Save the output to `.observability/02-performance-signals.md`.

### Step 3: Network and Data Visibility Review

Read `.observability/01-baseline.md`.

Use the Task tool twice when relevant to the scope:

```yaml
Task:
  subagent_type: "network-agent"
  description: "Review network visibility for $TARGET"
  prompt: |
    Review network and edge observability for: $TARGET.

    Use the baseline review below. Focus on DNS, TLS, CDN behaviour, load balancers,
    service mesh traffic, packet loss, latency, and cross-service communication visibility.

    ## Baseline Review
    [Insert contents of .observability/01-baseline.md]

    Deliver a single markdown report with key blind spots, recommended telemetry,
    useful dashboards, and operational risks.
```

```yaml
Task:
  subagent_type: "database-agent"
  description: "Review database visibility for $TARGET"
  prompt: |
    Review database observability for: $TARGET.

    Use the baseline review below. Focus on slow query visibility, connection pressure,
    lock contention, index health, workload attribution, and saturation signals.

    ## Baseline Review
    [Insert contents of .observability/01-baseline.md]

    Deliver a single markdown report with key blind spots, recommended telemetry,
    useful dashboards, and operational risks.
```

Save the outputs to `.observability/03-network-visibility.md` and `.observability/04-database-visibility.md` when those reviews are relevant. If one is not relevant, write a short note stating it was intentionally skipped.

## Checkpoint

Stop here and ask the user whether to continue with the target-state observability plan.

Summarize the key issues from:

- `.observability/01-baseline.md`
- `.observability/02-performance-signals.md`
- `.observability/03-network-visibility.md`
- `.observability/04-database-visibility.md`

## Phase 2: Target-State Plan

### Step 4: Implementation Plan

Read all previous `.observability/*.md` files.

Use the Task tool:

```yaml
Task:
  subagent_type: "observability-agent"
  description: "Create observability improvement plan for $TARGET"
  prompt: |
    Create an implementation-ready observability plan for: $TARGET.

    Use the previous review outputs to recommend a practical target state for
    telemetry, dashboards, alerts, tracing, ownership, and rollout order.

    Deliver a single markdown report with:
    1. Recommended telemetry architecture
    2. Instrumentation rollout priorities
    3. Dashboard and alert changes
    4. SLI and SLO recommendations
    5. Validation, runbook, and ownership guidance
    6. Risks, tradeoffs, and cost considerations
```

Save the output to `.observability/05-implementation-plan.md`.

## Completion

Update `.observability/state.json` to mark the session complete and summarize:

- the largest visibility gaps
- the most important telemetry changes
- alerting or SLO changes to make first
- any network or database monitoring follow-up
- the files created under `.observability/`
