---
name: unit-test-design
description: Design or improve unit tests with practical guidance on test case selection, isolation boundaries, mocks, fixtures, and coverage tradeoffs. Use when generating unit tests, reviewing missing cases, debugging brittle tests, or improving test maintainability.
---

# Unit Test Design

Use this skill to guide unit testing work from test planning through coverage decisions, dependency isolation, and failure analysis.

## Load References

- Read `references/test-case-checklist.md` when you need a compact checklist for behavior, edge cases, and failure handling.
- Read `references/mocking-and-fixture-guidelines.md` when the work depends on mocks, test doubles, fixtures, clocks, randomness, or external dependency isolation.

## Core Workflow

1. Identify the public behavior, contract, or requirement that needs protection.
2. Separate what belongs in unit tests from what needs integration or end-to-end coverage.
3. Prioritize a small set of high-value cases before expanding breadth.
4. Choose the lightest isolation strategy that keeps tests deterministic.
5. Prefer clear setup and assertions over clever abstractions.
6. Review brittleness risks before recommending more coverage.

## What To Prioritize

- Input validation and boundary conditions
- Error handling and failure paths
- Transformations, calculations, and branching logic
- Dependency behavior that must be stubbed or mocked
- Regression-prone bugs and business-critical paths
- Readability and maintenance cost of the resulting suite

## Coverage Guidance

- Treat line coverage as a signal, not the goal.
- Prefer tests that protect business behavior, contracts, and likely regressions.
- Avoid asserting incidental implementation details unless they are part of the contract.
- Call out code that is hard to unit test because responsibilities are too mixed.

## Output Expectations

When producing recommendations, organize them into:

1. Behaviors and risks to cover
2. Highest-priority test cases
3. Mock and fixture strategy
4. Cases to leave for broader testing
5. Brittleness risks and follow-up improvements
