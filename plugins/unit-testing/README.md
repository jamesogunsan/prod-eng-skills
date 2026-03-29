# Unit Testing

This plugin bundles agents, commands, and reusable guidance for unit test design, failure analysis, coverage improvement, and test maintenance across common application stacks.

## Contents

- `agents/`: local agents for unit test generation and test failure debugging
- `commands/`: orchestrated workflows for planning and generating unit tests
- `skills/`: reusable guidance for test design, mocks, fixtures, and coverage decisions

## Focus Areas

- Unit test planning for new or legacy code
- Coverage improvement without low-value test bloat
- Failure analysis for flaky or broken tests
- Mock, fixture, and dependency isolation decisions
- Practical test structure for Python, JavaScript, TypeScript, and similar stacks

## Use These Repo Skills In OpenCode

From the repository root, install a skill from this repo with `npx openskills install <skill-path>`.

Examples:

```bash
npx openskills install ./plugins/unit-testing/skills/unit-test-design
```
