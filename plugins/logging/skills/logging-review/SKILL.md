---
name: logging-review
description: Review application logging and trace correlation for operability, structured output, root logger discipline, and safe rollout. Use when auditing Python logging, diagnosing noisy or missing logs, or checking trace-linked observability design.
---

# Logging Review

Use this skill to review whether a logging setup is consistent, useful, and production-safe.

## Load References

- Read `references/logging-review-checklist.md` for the main audit structure.
- Read `references/propagation-gotchas.md` when the request involves missing trace context, gateways, or split traces.

## Core Workflow

1. Identify the application boundary, operators, and main support workflows.
2. Review logger ownership, handler placement, propagation, and sink structure.
3. Check whether structured fields support diagnosis instead of creating noise.
4. Separate logging-quality issues from trace-propagation or instrumentation issues.
5. Recommend the smallest safe correction before suggesting a broader redesign.

## What To Prioritise

- Correct root logger configuration and named logger usage
- Structured fields that make triage and correlation easier
- Safe exception capture and context preservation
- Practical guardrails for secrets, tokens, and excessive log volume
- Rollout safety for config, format, or sink changes

## Output Expectations

Organise recommendations into:

1. Current state and main weaknesses
2. High-risk findings
3. Recommended fixes in priority order
4. Trace or propagation concerns where relevant
5. Validation and rollout guidance
