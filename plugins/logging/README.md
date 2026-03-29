# Logging

This plugin bundles agents, commands, and skills for production logging, trace correlation, Python async logging setup, review workflows, and practical observability guardrails.

## Contents

- `agents/`: local agents for structured logging design, trace propagation, and logging architecture reviews
- `commands/`: local workflows for reviewing logging setups and planning Python async logging implementations
- `skills/`: reusable guidance for Python logging design, trace-linked context, review checklists, and propagation pitfalls

## Focus Areas

- Structured logging that is useful in production incident response
- Non-blocking Python logging patterns with queue-based handlers
- Trace-linked logs and distributed context propagation
- Root logger configuration and component-level logger usage
- Safe rollout of logging, tracing, and alerting changes without noisy regressions

## Use These Repo Skills In OpenCode

From the repository root, install a skill from this repo with `npx openskills install <skill-path>`.

Examples:

```bash
npx openskills install ./plugins/logging/skills/python-async-logging
npx openskills install ./plugins/logging/skills/logging-review
```
