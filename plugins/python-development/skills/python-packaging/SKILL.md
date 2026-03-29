---
name: python-packaging
description: Plan or review Python packaging, dependency management, build metadata, and distribution choices for libraries, applications, and internal tooling. Use for package layout, release readiness, and tooling decisions.
---

# Python Packaging

Use this skill when the user needs a packaging strategy that stays maintainable across local development, CI, release, and production usage.

## Load References

- Read `references/packaging-review-checklist.md` for a general packaging or release review.
- Read `references/dependency-and-versioning-strategy.md` when the main question is about pins, constraints, lockfiles, or release compatibility.

## Core Principles

- keep packaging boring and explicit
- separate runtime dependencies from developer-only tooling
- make install, test, and release flows easy to understand
- avoid unnecessary custom build logic early

## Core Workflow

1. Identify whether the project is a library, service, CLI, worker, or internal-only tool.
2. Decide what must be installable by other code versus what is only needed for local development.
3. Review package layout, metadata, entry points, and dependency scopes together.
4. Check whether the packaging workflow matches CI, release, and deployment expectations.
5. Prefer the smallest packaging setup that supports repeatable builds and predictable upgrades.

## What To Review

- package layout and import paths
- metadata completeness and consistency
- dependency scope and pinning strategy
- CLI entry points and library boundaries
- release and versioning expectations

## Packaging Heuristics

- For libraries, keep the public import surface intentional and stable.
- For applications, optimize for reproducible installs and straightforward deployment rather than public API elegance.
- Prefer standard `pyproject.toml` metadata and mainstream backends unless a real requirement says otherwise.
- Treat editable installs, build steps, and release steps as part of developer ergonomics, not afterthoughts.
- Keep generated artifacts, scripts, and package data rules explicit.

## Good Defaults

- prefer standard packaging metadata and common tooling
- keep editable local development straightforward
- document how to run tests, linting, typing, and packaging checks
- make the public package surface explicit

## Dependency Strategy

- Separate runtime dependencies from test, lint, typing, docs, and local tooling dependencies.
- Pin tightly where reproducibility matters, and use looser ranges only where compatibility expectations are intentional.
- Avoid dependency sprawl caused by convenience additions that nobody owns.
- Call out transitive risk when a package pulls in large frameworks or unstable extras.
- If the release artifact must stay small or stable, review optional dependencies and extras carefully.

## Release And Distribution Guidance

- Define the versioning approach clearly: manual, automated, semantic-ish, or internal build metadata.
- Ensure build, test, and publish steps are reproducible in CI.
- For internal tooling, simplicity often matters more than ecosystem polish.
- For shared libraries, backward compatibility and changelog quality matter more.

## Output Expectations

1. Packaging approach to use
2. Dependency and versioning guidance
3. Project metadata or layout fixes
4. Release-readiness gaps
5. Simplest next setup steps
