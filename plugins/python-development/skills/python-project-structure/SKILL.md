---
name: python-project-structure
description: Plan or review Python project layout with guidance on modules, package boundaries, naming, dependency flow, and maintainable repository structure. Use for new projects, refactors, and architecture reviews.
---

# Python Project Structure

Use this skill to make Python repositories easier to navigate, test, and evolve.

## Load References

- Read `references/project-layout-recipes.md` when the user needs suggested layouts for libraries, CLIs, services, or workers.
- Read `references/module-boundary-smells.md` when the structure already exists and you need a sharper refactor review.

## Core Principles

- keep modules small enough that responsibility is obvious
- prefer explicit package boundaries over large grab-bag utility modules
- organize code so imports flow cleanly and circular imports are less likely
- make it easy for another engineer to find the main entry points quickly

## Core Workflow

1. Identify the delivery shape: library, CLI, service, worker, monolith, or internal platform package.
2. Map the main responsibilities: domain logic, orchestration, infrastructure, interfaces, and shared utilities.
3. Check whether current imports and naming reinforce those boundaries or cut across them.
4. Recommend the smallest structural change that improves clarity and ownership.
5. Sequence refactors so behavior remains stable while boundaries improve.

## What Good Looks Like

- package and module names are short, lowercase, and clear
- service, domain, and infrastructure layers are separated when complexity justifies it
- internal helpers stay internal through naming and placement
- test layout mirrors the main source tree enough to stay discoverable
- config, scripts, and runtime entry points are easy to locate

## Layout Heuristics

- For libraries, keep the public import surface narrow and stable.
- For services, separate request handling, domain rules, infrastructure adapters, and startup wiring.
- For workers and jobs, separate scheduling, job orchestration, and task logic.
- Keep framework-specific files at the edges when possible so core logic remains portable and testable.
- Avoid a giant `utils` package unless each helper truly lacks a better home.

## Review Guidance

- check whether modules mix unrelated concerns
- check whether import patterns suggest boundary problems
- check whether naming communicates intent without redundancy
- check whether public APIs are explicit and internal details stay internal
- check whether the structure fits the current project size instead of a hypothetical future platform

## Boundary Smells

- imports that flow both directions between packages
- framework objects leaking deep into domain code
- one module owning setup, business rules, and external I/O together
- large helper modules that quietly become dependency hubs
- package names that describe teams, folders, or history rather than responsibilities

## Refactor Strategy

- move one boundary at a time
- stabilize tests around public behavior before splitting modules aggressively
- introduce facades or adapters before cutting hard dependencies
- keep import paths and public APIs stable where downstream code depends on them
- call out when the right answer is less structure, not more

## Output Expectations

When reviewing structure, organize guidance into:

1. Current layout strengths
2. Boundary or ownership issues
3. Recommended module or package splits
4. Import and dependency-flow fixes
5. The smallest safe refactor sequence
