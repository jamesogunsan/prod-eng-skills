---
description: "Plan a new Python module, package, or service using the local python-development plugin"
argument-hint: "<project, package, tool, or service idea> [--focus package|service|cli|library|balanced] [--depth quick|standard|deep]"
---

# Python Scaffold

Use this command when the user needs a starting structure for a new Python package, CLI, service, worker, or internal library.

## Command Rules

1. Stay within the scope defined by `$ARGUMENTS`.
2. Use only local agents from `plugins/python-development/agents/`.
3. Write step outputs under `.python-scaffold/` before moving to the next step.
4. Prefer simple, explicit project structure over premature abstraction.
5. Load the most relevant local skills before proposing layout, tooling, or runtime patterns.
6. Include testing, configuration, and operational defaults in the first draft.

## Pre-flight

1. Create `.python-scaffold/` if it does not exist.
2. Parse `$ARGUMENTS` into:
   - `$TARGET`: the project, package, tool, or service to design
   - `focus`: `package`, `service`, `cli`, `library`, or `balanced`
   - `depth`: `quick`, `standard`, or `deep`
3. Initialize `.python-scaffold/state.json` with the target, focus, depth, current step, and created files.

## Recommended References

- Load `skills/python-project-structure/SKILL.md`
- Load `skills/python-packaging/SKILL.md`
- Load `skills/python-configuration/SKILL.md`
- Load `skills/python-testing-patterns/SKILL.md`
- Load `skills/uv-package-manager/SKILL.md`
- Load `skills/python-type-safety/SKILL.md` for contract-first APIs and shared models
- Load `skills/python-design-patterns/SKILL.md` and `skills/python-anti-patterns/SKILL.md` for boundary and abstraction choices
- Load `skills/python-observability/SKILL.md`, `skills/python-resilience/SKILL.md`, and `skills/python-resource-management/SKILL.md` for services or jobs
- Load `skills/python-background-jobs/SKILL.md` and `skills/async-python-patterns/SKILL.md` for worker, scheduler, queue, or asyncio-heavy systems

## Focus Routing

- `package`: emphasize project structure, packaging, type safety, testing, and uv workflow
- `service`: emphasize project structure, configuration, observability, resilience, async patterns, and FastAPI concerns when applicable
- `cli`: emphasize packaging, configuration, resource management, testing, and simple command boundaries
- `library`: emphasize public API clarity, type safety, packaging, testing, and stable module boundaries
- `balanced`: use the smallest coherent mix without over-designing the first version

## Phase 1: Structure and Defaults

### Step 1: Project Shape

Use the Task tool:

```text
Task:
  subagent_type: "python-agent"
  description: "Design Python project structure for $TARGET"
  prompt: |
    Design a practical Python project structure for: $TARGET.

    Use the requested focus and depth from `$ARGUMENTS`.

    Before drafting the plan, load the local skills that best match the target shape.

    Deliver:
    1. Recommended package or service layout
    2. Module boundaries and responsibilities
    3. Configuration, dependency, and environment strategy
    4. Testing structure and quality checks
    5. Common mistakes to avoid in the first version
    6. Which local skills most strongly informed the structure

    Write the result as a single markdown document.
```

Save output to `.python-scaffold/01-structure.md`.

### Step 2: Service Guidance When Relevant

If the target is an API or service, use the Task tool:

```text
Task:
  subagent_type: "fastapi-agent"
  description: "Design FastAPI or service scaffolding for $TARGET"
  prompt: |
    Design the service-specific structure and runtime guidance for: $TARGET.

    ## Base Structure
    [Insert contents of .python-scaffold/01-structure.md]

    Before drafting service guidance, load the local skills for configuration, observability, resilience, async patterns, and testing.

    Deliver:
    1. API or service-layer layout
    2. Dependency and lifecycle structure
    3. Health, observability, and runtime concerns
    4. Safe rollout and operational defaults
    5. Which local skills most strongly informed the service design

    Write the result as a single markdown document.
```

Save output to `.python-scaffold/02-service-shape.md`.

Otherwise, write a short note to `.python-scaffold/02-service-shape.md` stating that no service-specific scaffold was needed.

## Checkpoint

Before continuing, summarize the proposed structure, testing defaults, and runtime choices. Stop and ask the user whether to continue with an implementation-ready scaffold plan.

## Phase 2: Implementation Plan

### Step 3: Produce the Scaffold Plan

Read `.python-scaffold/01-structure.md` and `.python-scaffold/02-service-shape.md`.

Use the Task tool:

```text
Task:
  subagent_type: "python-agent"
  description: "Produce Python scaffold plan for $TARGET"
  prompt: |
    Produce an implementation-ready scaffold plan for: $TARGET.

    ## Base Structure
    [Insert contents of .python-scaffold/01-structure.md]

    ## Service Shape
    [Insert contents of .python-scaffold/02-service-shape.md]

    Combine the structure and service guidance into one implementation-ready plan shaped by the strongest local skills.

    Deliver:
    1. Directory and module layout
    2. First files to create and why
    3. Testing, linting, and typing defaults
    4. Configuration and packaging guidance
    5. Early observability and reliability checks
    6. Why this scaffold is the right level of complexity for the target

    Keep the result concise and implementation-ready.
```

Save output to `.python-scaffold/03-scaffold-plan.md`.

## Completion

Update `.python-scaffold/state.json` to mark the scaffold plan complete.

Present a final summary that includes:

- recommended project layout
- packaging and environment defaults
- testing and quality guardrails
- runtime and observability expectations
- files created under `.python-scaffold/`
