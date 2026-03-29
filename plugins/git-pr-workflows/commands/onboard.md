---
description: "Create a practical engineering onboarding plan for a repository, team, or role"
argument-hint: "<role, team, or onboarding context> [--focus repo|workflow|delivery|balanced] [--depth quick|standard|deep]"
---

# Contributor Onboarding

Use this command when the user wants a practical onboarding plan for engineers joining a repository, team workflow, or pull request process.

## Rules

1. Stay within the scope of `$ARGUMENTS`.
2. Use only local agents from `plugins/git-pr-workflows/agents/`.
3. Write step outputs under `.git-onboarding/` and read prior step files before continuing.
4. Prioritise contributor productivity, repository safety, and review readiness over generic HR process detail.
5. Stop at the checkpoint and wait for the user before producing the final contribution path.

## Pre-flight

1. Create `.git-onboarding/` if it does not exist.
2. Parse `$ARGUMENTS` into `$TARGET`, `focus`, and `depth`.
3. Initialise `.git-onboarding/state.json` with the target, chosen options, current phase, and files created.

## Recommended Local Inputs

- `README.md`
- `agents/workflow-agent.md`
- `agents/code-reviewer-agent.md`
- `commands/git-workflow.md`

## Phase 1: Repo and Workflow Baseline

### Step 1: Workflow Expectations Review

Use the Task tool:

```text
Task:
  subagent_type: "workflow-agent"
  description: "Assess contributor workflow expectations for $TARGET"
  prompt: |
    Review this repository, team, or onboarding context: $TARGET.

    Identify the workflow expectations a new contributor would need in order to succeed.

    Focus on:
    1. branch and pull request expectations
    2. commit and review habits that matter most
    3. testing and validation expectations
    4. common delivery risks or failure modes
    5. the minimum repository context a contributor needs first

    Return a single markdown report with:
    - workflow expectations
    - likely onboarding friction points
    - repo or delivery habits to teach early
    - risks to avoid in the first week
```

Save output to `.git-onboarding/01-workflow-baseline.md`.

### Step 2: Onboarding Plan Draft

Read `.git-onboarding/01-workflow-baseline.md`.

Use the Task tool:

```text
Task:
  subagent_type: "workflow-agent"
  description: "Draft contributor onboarding plan for $TARGET"
  prompt: |
    Create a practical contributor onboarding plan for: $TARGET.

    ## Workflow Baseline
    [Insert contents of .git-onboarding/01-workflow-baseline.md]

    Build an implementation-ready onboarding plan with:
    1. day 1 setup goals
    2. first week repository and workflow milestones
    3. pull request and review habits to teach early
    4. first safe contribution ideas
    5. checks for when the contributor is ready to work independently
```

Save output to `.git-onboarding/02-onboarding-plan.md`.

## Checkpoint

Stop after Phase 1 and ask the user whether to:

1. accept the plan
2. tailor it to a specific role or seniority level
3. expand it with a 30/60/90 day version

Do not continue until the user approves or requests a revision.

## Phase 2: First-Task and Review Readiness

### Step 3: First Contribution Path

Read `.git-onboarding/01-workflow-baseline.md` and `.git-onboarding/02-onboarding-plan.md`.

Use the Task tool:

```text
Task:
  subagent_type: "code-reviewer-agent"
  description: "Create first-contribution path for $TARGET"
  prompt: |
    Create a practical first-contribution path for: $TARGET.

    ## Workflow Baseline
    [Insert contents of .git-onboarding/01-workflow-baseline.md]

    ## Onboarding Plan
    [Insert contents of .git-onboarding/02-onboarding-plan.md]

    Return a markdown guide with:
    1. a first-task profile suitable for a new contributor
    2. what they should verify before opening a PR
    3. what reviewers will expect to see
    4. signs they are ready for larger work
```

Save output to `.git-onboarding/03-first-contribution.md`.

## Completion

Update `.git-onboarding/state.json` and present a concise summary covering:

- the core workflow expectations
- the onboarding milestones
- the recommended first-contribution path
- created files in `.git-onboarding/`
