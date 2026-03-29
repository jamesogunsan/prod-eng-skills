# TDD Workflows

This plugin bundles agents, commands, and reusable guidance for test-driven development planning, red-green-refactor execution, and safe refactoring loops.

## Contents

- `agents/`: local agents for TDD planning and refactor-safe implementation guidance
- `commands/`: orchestrated workflows for full TDD cycles and individual red, green, and refactor stages
- `skills/`: reusable TDD guidance, checklists, and stage-specific reference material

## Focus Areas

- Turning requirements into the smallest useful failing test
- Choosing the minimum implementation needed to go green
- Refactoring safely while preserving test confidence
- Keeping tests behaviour-focused and resistant to brittle implementation coupling
- Making TDD practical for interview tasks, kata work, and production code changes

## Use These Repo Skills In OpenCode

From the repository root, install a skill from this repo with `npx openskills install <skill-path>`.

Examples:

```bash
npx openskills install ./plugins/tdd-workflows/skills/tdd-cycle
```
