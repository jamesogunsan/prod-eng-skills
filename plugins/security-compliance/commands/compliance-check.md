---
description: "Coordinate a security and compliance review using the local security-compliance plugin"
argument-hint: "<system, platform, or control scope> [--focus security|compliance|evidence|balanced] [--depth quick|standard|deep]"
---

# Security and Compliance Review

Use this command when the user needs a practical security and compliance assessment, control gap review, audit readiness check, or remediation plan for a defined system or delivery scope.

## Command Rules

1. Stay within the scope defined by `$ARGUMENTS`.
2. Use only local agents from `plugins/security-compliance/agents/`.
3. Write all step outputs under `.security-compliance/` before moving to the next step.
4. Load the local skill and references before drafting findings.
5. Prioritize real risk and control coverage over checklist-only language.
6. Separate current-state evidence, control gaps, and remediation recommendations clearly.

## Pre-flight

1. Create `.security-compliance/` if it does not exist.
2. Parse `$ARGUMENTS` into:
   - `$TARGET`: the system, platform, or review scope
   - `focus`: `security`, `compliance`, `evidence`, or `balanced`
   - `depth`: `quick`, `standard`, or `deep`
3. Initialize `.security-compliance/state.json` with the target, focus, depth, current step, and created files.

## Recommended References

- Load `skills/compliance-review/SKILL.md`
- Read `skills/compliance-review/references/control-review-checklist.md`
- Read `skills/compliance-review/references/audit-evidence-guide.md`

## Phase 1: Current-State Review

### Step 1: Assess Controls and Gaps

Use the Task tool:

```text
Task:
  subagent_type: "security-agent"
  description: "Assess security and compliance posture for $TARGET"
  prompt: |
    Review the current security and compliance posture for: $TARGET.

    Focus on the requested emphasis from `$ARGUMENTS`.

    Deliver:
    1. The most important security and compliance domains in scope
    2. Current controls that appear present or implied
    3. The highest-priority gaps, risks, and missing safeguards
    4. Framework mapping notes where relevant
    5. A concise current-state assessment the user can act on immediately

    Write the result as a single markdown document.
```

Save output to `.security-compliance/01-current-state.md`.

### Step 2: Review Evidence and Audit Readiness

Read `.security-compliance/01-current-state.md`.

Use the Task tool:

```text
Task:
  subagent_type: "security-agent"
  description: "Review audit evidence readiness for $TARGET"
  prompt: |
    Review likely audit and evidence-readiness needs for: $TARGET.

    ## Current-State Assessment
    [Insert contents of .security-compliance/01-current-state.md]

    Deliver:
    1. Evidence likely needed to support the current controls
    2. Missing documentation, ownership, or traceability gaps
    3. Controls that may exist operationally but are weakly evidenced
    4. Immediate evidence collection priorities

    Write the result as a single markdown document.
```

Save output to `.security-compliance/02-evidence-review.md`.

## Checkpoint

Before continuing, summarize the main control gaps and evidence weaknesses. Stop and ask the user whether to continue with remediation planning.

## Phase 2: Remediation Plan

### Step 3: Produce a Prioritized Remediation Plan

Read `.security-compliance/01-current-state.md` and `.security-compliance/02-evidence-review.md`.

Use the Task tool:

```text
Task:
  subagent_type: "security-agent"
  description: "Build remediation plan for $TARGET"
  prompt: |
    Build a prioritized remediation plan for: $TARGET.

    ## Current-State Assessment
    [Insert contents of .security-compliance/01-current-state.md]

    ## Evidence Review
    [Insert contents of .security-compliance/02-evidence-review.md]

    Deliver:
    1. Immediate control fixes or hardening work
    2. Medium-term compliance and evidence improvements
    3. Ownership suggestions by team or discipline
    4. Risks, trade-offs, and sequencing concerns
    5. A clear next-step plan for engineering and audit readiness

    Write the result as a single markdown document.
```

Save output to `.security-compliance/03-remediation-plan.md`.

## Completion

Update `.security-compliance/state.json` to mark the review complete.

Present a final summary that includes:

- key risk and control gaps
- evidence and documentation weaknesses
- highest-priority remediation actions
- major trade-offs or dependencies
- files created under `.security-compliance/`
