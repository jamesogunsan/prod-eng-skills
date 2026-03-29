---
description: "Improve a pull request description, review framing, and PR readiness"
argument-hint: "<branch, diff, or pull request context> [--focus summary|review|risk|balanced] [--depth quick|standard|deep]"
---

# Pull Request Enhancement

Use this command when the user wants a stronger pull request title, summary, reviewer guidance, or overall review readiness.

## Rules

1. Stay within the scope of `$ARGUMENTS`.
2. Use only local agents from `plugins/git-pr-workflows/agents/`.
3. Write step outputs under `.pr-enhance/` and read prior step files instead of relying on memory.
4. Prioritise reviewer clarity, change risk, and testing evidence over marketing language.
5. Stop at the checkpoint and wait for the user before producing the final package.

## Pre-flight

1. Create `.pr-enhance/` if it does not exist.
2. Parse `$ARGUMENTS` into `$TARGET`, `focus`, and `depth`.
3. Initialise `.pr-enhance/state.json` with the target, chosen options, current phase, and files created.

## Recommended Local Inputs

- `agents/code-reviewer-agent.md`
- `agents/workflow-agent.md`
- `commands/git-workflow.md`

## Phase 1: Review Readiness

### Step 1: Change and Risk Summary

Use the Task tool:

```text
Task:
  subagent_type: "code-reviewer-agent"
  description: "Assess pull request readiness for $TARGET"
  prompt: |
    Review this branch, diff, or pull request context for review readiness: $TARGET.

    Focus on:
    1. the main change being proposed
    2. likely reviewer concerns or hidden production risks
    3. missing test or validation evidence
    4. rollout, rollback, or migration notes that should be visible
    5. the smallest clear explanation a reviewer needs first

    Return a single markdown report with:
    - concise change summary
    - review risks and open questions
    - testing or validation gaps
    - notes that should appear in the PR body
```

Save output to `.pr-enhance/01-review-readiness.md`.

### Step 2: PR Draft

Read `.pr-enhance/01-review-readiness.md`.

Use the Task tool:

```text
Task:
  subagent_type: "workflow-agent"
  description: "Draft improved pull request content for $TARGET"
  prompt: |
    Draft improved pull request content for: $TARGET.

    ## Review Readiness Notes
    [Insert contents of .pr-enhance/01-review-readiness.md]

    Produce a reviewer-friendly markdown draft with:
    1. PR title options
    2. a short summary focused on why the change exists
    3. key changes worth calling out
    4. testing and validation notes
    5. risks, rollout notes, and reviewer checkpoints

    Keep the result concise, specific, and ready to paste into a PR description.
```

Save output to `.pr-enhance/02-pr-draft.md`.

## Checkpoint

Stop after Phase 1 and ask the user whether to:

1. accept the draft
2. revise the framing
3. expand with a more detailed reviewer checklist

Do not continue until the user approves or requests a revision.

## Phase 2: Final Packaging

### Step 3: Reviewer Checklist and Final Version

Read `.pr-enhance/01-review-readiness.md` and `.pr-enhance/02-pr-draft.md`.

Use the Task tool:

```text
Task:
  subagent_type: "workflow-agent"
  description: "Finalise pull request package for $TARGET"
  prompt: |
    Finalise a pull request package for: $TARGET.

    ## Review Readiness
    [Insert contents of .pr-enhance/01-review-readiness.md]

    ## Draft PR Copy
    [Insert contents of .pr-enhance/02-pr-draft.md]

    Return a final markdown package with:
    1. recommended PR title
    2. final PR body
    3. reviewer checklist
    4. optional follow-up comments or notes for reviewers
```

Save output to `.pr-enhance/03-final-pr-package.md`.

## Completion

Update `.pr-enhance/state.json` and present a concise summary covering:

- the recommended PR framing
- the biggest review risks called out
- missing evidence or checks to complete
- created files in `.pr-enhance/`
