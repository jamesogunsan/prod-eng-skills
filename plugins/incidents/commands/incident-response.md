---
description: "Coordinate an incident response review using the local incidents plugin"
argument-hint: "<incident or outage> [--focus triage|mitigation|communication|postmortem|balanced] [--depth quick|standard|deep]"
---

# Incident Response Review

Use this command for a live outage, degraded service, alert investigation, rollback decision, or post-incident review.

## Command Rules

1. Stay within the scope of `$ARGUMENTS`.
2. Use only local agents from `plugins/incidents/agents/`.
3. Create outputs under `.incidents/` and read prior step files before continuing.
4. Prefer stabilization and risk reduction before deeper analysis.
5. Load `skills/incident-response/SKILL.md` before drafting recommendations.
6. Stop at the checkpoint and wait for user approval before moving from response to postmortem work.

## Pre-flight

1. Create `.incidents/` if it does not exist.
2. Parse `$ARGUMENTS` into:
   - `$TARGET`: the incident, system, or outage description
   - `focus`: `balanced` unless a `--focus` flag is provided
   - `depth`: `standard` unless a `--depth` flag is provided
3. Create `.incidents/state.json` with the target, focus, depth, current step, and created files.

## Recommended References

- `skills/incident-response/SKILL.md`
- `skills/incident-response/references/incident-triage-checklist.md`
- `skills/incident-response/references/postmortem-template.md`

## Phase 1: Triage and Stabilization

### Step 1: Incident Triage

Use the Task tool:

```text
Task:
  subagent_type: "incident-agent"
  description: "Triage production incident for $TARGET"
  prompt: |
    Triage this incident: $TARGET.

    Classify likely severity, blast radius, affected systems, immediate risks, and missing evidence.
    Recommend the first safe mitigation actions and the telemetry or change history needed next.

    Deliver a single markdown document with:
    1. Incident summary
    2. Severity and impact assessment
    3. Most likely fault domains
    4. Immediate mitigation actions
    5. Evidence to collect next
```

Save the result to `.incidents/01-triage.md`.

### Step 2: Investigation and Recovery Plan

Read `.incidents/01-triage.md`.

Use the Task tool:

```text
Task:
  subagent_type: "incident-agent"
  description: "Build investigation plan for $TARGET"
  prompt: |
    Build an investigation and recovery plan for: $TARGET.

    ## Triage Context
    [Insert full contents of .incidents/01-triage.md]

    Produce ranked hypotheses, validation steps, rollback or containment options, and clear stop/go criteria.

    Deliver a single markdown document with:
    1. Ranked hypotheses
    2. Validation plan
    3. Recovery options with tradeoffs
    4. Recommended path
    5. Risks and watchouts
```

Save the result to `.incidents/02-recovery-plan.md`.

### Step 3: Communication Draft

Read `.incidents/01-triage.md` and `.incidents/02-recovery-plan.md`.

Use the Task tool:

```text
Task:
  subagent_type: "incident-agent"
  description: "Draft incident communications for $TARGET"
  prompt: |
    Draft communications for this incident: $TARGET.

    ## Triage
    [Insert full contents of .incidents/01-triage.md]

    ## Recovery Plan
    [Insert full contents of .incidents/02-recovery-plan.md]

    Write clear updates for engineers and non-technical stakeholders.

    Deliver a single markdown document with:
    1. Short engineering update
    2. Short stakeholder update
    3. Current risks and unknowns
    4. Next update checkpoint
```

Save the result to `.incidents/03-communications.md`.

## Checkpoint

Stop and present the key findings from:

- `.incidents/01-triage.md`
- `.incidents/02-recovery-plan.md`
- `.incidents/03-communications.md`

Ask the user whether to:

1. Proceed to postmortem and prevention work
2. Revise the response plan
3. Pause and save progress

Do not continue until the user chooses option 1.

## Phase 2: Postmortem and Prevention

### Step 4: Postmortem Draft

Read `.incidents/01-triage.md`, `.incidents/02-recovery-plan.md`, and `.incidents/03-communications.md`.

Use the Task tool:

```text
Task:
  subagent_type: "incident-agent"
  description: "Draft postmortem for $TARGET"
  prompt: |
    Draft a blameless postmortem for: $TARGET.

    ## Incident Context
    [Insert full contents of .incidents/01-triage.md, .incidents/02-recovery-plan.md, and .incidents/03-communications.md]

    Deliver a single markdown document with:
    1. Summary
    2. Customer impact
    3. Timeline
    4. Root cause and contributing factors
    5. What worked and what did not
    6. Follow-up actions with priorities
```

Save the result to `.incidents/04-postmortem.md`.

## Completion

Update `.incidents/state.json` to mark the session complete and summarize:

- Incident severity and scope
- Recommended mitigation path
- Key communications produced
- Follow-up actions and prevention work
- Files created under `.incidents/`
