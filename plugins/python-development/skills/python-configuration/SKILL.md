---
name: python-configuration
description: Design Python configuration handling with guidance on environment variables, defaults, validation, secrets, and runtime safety. Use for services, CLIs, jobs, and libraries that need clear config boundaries.
---

# Python Configuration

Use this skill to keep configuration explicit, validated, and safe to operate.

## Load References

- Read `references/configuration-review-checklist.md` for a broad config review.
- Read `references/secrets-and-runtime-boundaries.md` when the request touches secrets, multi-environment behavior, or deploy-time safety.

## Core Principles

- configuration should be easy to discover and validate
- secrets should be separated from ordinary settings
- defaults should be safe, not surprising
- environment-specific behavior should be explicit rather than hidden in code paths

## Core Workflow

1. Identify what must be configured at build time, startup time, and runtime.
2. Separate required settings, optional settings, and secrets.
3. Centralize parsing and validation so failures happen early and clearly.
4. Check how local development, tests, CI, and production each provide configuration.
5. Recommend the narrowest config surface that supports the real deployment model.

## What To Prefer

- one clear configuration entry point
- typed or validated config objects when complexity grows
- environment variables for deployment-time settings
- clear fallback logic and startup-time validation
- explicit documentation for required settings

## Operational Heuristics

- Required settings should fail fast at startup.
- Defaults should be safe for the least dangerous environment.
- Secrets should come from secret stores or controlled environment injection, not casual checked-in files.
- Feature flags and tuning knobs should have clear owners and retirement plans.
- If a setting changes behavior materially, the code should make that branch easy to find.

## What To Avoid

- scattering config reads across the codebase
- silent fallback to unsafe defaults
- mixing secrets with non-sensitive defaults in the same casual flow
- runtime guessing when a required setting is missing

## Output Expectations

1. Configuration shape and ownership
2. Validation and defaulting strategy
3. Secret-handling guidance
4. Operational risks in the current setup
5. Recommended cleanup steps
