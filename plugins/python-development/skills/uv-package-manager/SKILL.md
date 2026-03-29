---
name: uv-package-manager
description: Use uv for Python environments, dependency installation, locking, and project workflows with guidance on pragmatic local development and reproducibility. Use for environment and tooling setup decisions.
---

# uv Package Manager

Use this skill when the user wants a practical Python workflow built around `uv`.

## Load References

- Read `references/uv-workflow-checklist.md` for a broad repo workflow review.
- Read `references/migrating-to-uv.md` when moving from `pip`, `pip-tools`, `poetry`, or ad hoc venv workflows.

## Core Principles

- keep environment setup fast and reproducible
- make dependency installation and lockfile behavior explicit
- keep developer workflows simple enough for new contributors to follow

## Core Workflow

1. Identify the project shape: app, library, monorepo package, CLI, or service.
2. Decide how environments, dependency sync, and lockfiles should work locally and in CI.
3. Standardize the smallest command set contributors need to install, run, test, and package the project.
4. Review migration friction from existing tooling before changing workflows.
5. Keep the uv workflow documented and boring.

## What To Review

- how environments are created and activated
- dependency add, sync, and lock flows
- local dev versus CI expectations
- packaging and script-running ergonomics

## Workflow Heuristics

- Prefer one documented path for bootstrap instead of multiple partially-supported flows.
- Make lockfile expectations explicit: when it changes, who updates it, and how CI enforces it.
- Keep script, tool, and package commands consistent across local and CI usage.
- Avoid layering old package-manager conventions on top of uv unless they still serve a real need.

## Migration Guidance

- Inventory the current commands developers actually use before replacing them.
- Migrate environment creation, dependency sync, and CI steps together so the workflow stays coherent.
- Document equivalent uv commands for the old workflow to reduce confusion.
- Remove stale commands and docs after the migration lands.

## Common Pitfalls

- partial migration where CI, docs, and local usage disagree
- unclear lockfile ownership
- environment activation assumptions that differ across shells or editors
- mixing multiple dependency-management sources without a policy

## Output Expectations

1. Recommended uv workflow
2. Environment and dependency steps
3. Repo or CI adjustments needed
4. Migration guidance from older tooling
5. Common mistakes to avoid
