---
description: "Review Python code or architecture using the local python-development agents and skills"
argument-hint: "<module, service, package, or code area> [--focus style|design|testing|operations|balanced] [--depth quick|standard|deep]"
---

# Python Review

Use this command when the user needs a Python code review, design review, refactor plan, testing guidance, or production-readiness assessment.

## Command Rules

1. Stay within the scope defined by `$ARGUMENTS`.
2. Use only local agents from `plugins/python-development/agents/`.
3. Write step outputs under `.python-development/` before moving to the next step.
4. Favor readable, explicit, maintainable Python over clever shortcuts.
5. Load the most relevant local skills before drafting findings.
6. Separate immediate fixes from deeper structural improvements.

## Pre-flight

1. Create `.python-development/` if it does not exist.
2. Parse `$ARGUMENTS` into:
   - `$TARGET`: the module, service, package, or code area to review
   - `focus`: `style`, `design`, `testing`, `operations`, or `balanced`
   - `depth`: `quick`, `standard`, or `deep`
3. Initialize `.python-development/state.json` with the target, focus, depth, current step, and created files.

## Recommended References

- Load `skills/python-code-style/SKILL.md`
- Load `skills/python-project-structure/SKILL.md`
- Load `skills/python-testing-patterns/SKILL.md` when testability matters
- Load `skills/python-error-handling/SKILL.md` and `skills/python-resource-management/SKILL.md` when reliability or safety issues appear
- Load `skills/python-type-safety/SKILL.md` when contracts, annotations, or data-shape ambiguity matter
- Load `skills/python-design-patterns/SKILL.md` and `skills/python-anti-patterns/SKILL.md` for refactor-heavy or architecture-heavy reviews
- Load `skills/python-packaging/SKILL.md` and `skills/uv-package-manager/SKILL.md` when environment, dependency, or workflow setup matters
- Load `skills/python-performance-optimization/SKILL.md`, `skills/python-observability/SKILL.md`, and `skills/python-resilience/SKILL.md` for production service reviews
- Load `skills/python-background-jobs/SKILL.md` and `skills/async-python-patterns/SKILL.md` for workers, schedulers, queues, or asyncio-heavy code

## Focus Routing

- `style`: emphasize `python-code-style`, `python-anti-patterns`, and `python-type-safety`
- `design`: emphasize `python-project-structure`, `python-design-patterns`, `python-packaging`, and `python-configuration`
- `testing`: emphasize `python-testing-patterns`, `python-type-safety`, and `python-error-handling`
- `operations`: emphasize `python-error-handling`, `python-resource-management`, `python-resilience`, `python-observability`, and `python-performance-optimization`
- `balanced`: load the smallest useful mix from style, design, testing, and operations without forcing every skill into the review

## Phase 1: Baseline Review

### Step 1: Core Python Review

Use the Task tool:

```text
Task:
  subagent_type: "python-agent"
  description: "Review Python implementation for $TARGET"
  prompt: |
    Review the Python implementation for: $TARGET.

    Use the requested focus and depth from `$ARGUMENTS`.

    Before drafting findings, load the local Python skills that best match the focus and runtime shape.

    Prioritize:
    1. Readability, explicitness, and anti-pattern cleanup
    2. Naming, structure, module boundaries, and type clarity
    3. Error handling, safe resource usage, and configuration boundaries
    4. Testability, maintainability, and packaging or workflow concerns when relevant
    5. Production risks if this code runs in a service, async flow, or background job

    Deliver:
    1. What is working well
    2. Highest-priority issues
    3. Concrete fixes or refactors
    4. Testing and validation gaps
    5. Which local skills most strongly informed the recommendations
    6. Follow-up improvements worth doing later

    Write the result as a single markdown document.
```

Save output to `.python-development/01-python-review.md`.

### Step 2: Framework Review When Relevant

If the target is FastAPI-specific, API-heavy, or clearly service-oriented, use the Task tool:

```text
Task:
  subagent_type: "fastapi-agent"
  description: "Review FastAPI service concerns for $TARGET"
  prompt: |
    Review the FastAPI or API-service concerns for: $TARGET.

    ## Existing Python Review
    [Insert contents of .python-development/01-python-review.md]

    Before drafting findings, load the local skills that matter most for service design: project structure, configuration, testing, error handling, async patterns, observability, and resilience.

    Deliver:
    1. API design or service-boundary concerns
    2. Validation, error handling, and dependency issues
    3. Runtime, latency, and observability risks
    4. Safe rollout or operational checks
    5. Which local skills most strongly informed the recommendations

    Write the result as a single markdown document.
```

Save output to `.python-development/02-service-review.md`.

Otherwise, write a short note to `.python-development/02-service-review.md` stating that no FastAPI-specific review was needed.

## Checkpoint

Before continuing, summarize the biggest Python issues, structural concerns, and service risks. Stop and ask the user whether to continue with an implementation-ready improvement plan.

## Phase 2: Improvement Plan

### Step 3: Produce the Improvement Plan

Read `.python-development/01-python-review.md` and `.python-development/02-service-review.md`.

Use the Task tool:

```text
Task:
  subagent_type: "python-agent"
  description: "Produce Python improvement plan for $TARGET"
  prompt: |
    Produce an implementation-ready Python improvement plan for: $TARGET.

    ## Baseline Review
    [Insert contents of .python-development/01-python-review.md]

    ## Service Review
    [Insert contents of .python-development/02-service-review.md]

    Build the plan by explicitly combining the strongest relevant local skills instead of repeating the review.

    Deliver:
    1. The safest high-value fixes to do first
    2. Recommended refactor order
    3. Testing and validation steps
    4. Observability or reliability improvements
    5. Risks to watch during rollout
    6. Skill-driven rationale for why this order is correct

    Keep the result practical and implementation-ready.
```

Save output to `.python-development/03-improvement-plan.md`.

## Completion

Update `.python-development/state.json` to mark the review complete.

Present a final summary that includes:

- the main readability and design issues
- the most important reliability or safety concerns
- the best next fixes to implement
- testing and validation expectations
- files created under `.python-development/`
