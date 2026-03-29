---
name: python-testing-patterns
description: Design and review Python tests with guidance on unit tests, functional tests, naming, factories, isolation, mocks, and coverage tradeoffs. Use when planning tests, debugging flaky suites, or improving confidence.
---

# Python Testing Patterns

Use this skill to shape Python tests that are fast, isolated, descriptive, and worth maintaining.

## Load References

- Read `references/test-design-checklist.md` when planning new coverage.
- Read `references/flaky-test-playbook.md` when the request involves non-determinism, intermittent failures, timing issues, or brittle CI behavior.

## Core Principles

- Test ruthlessly, but do not confuse more tests with better tests.
- Prefer readable scenario-focused tests over clever test abstractions.
- Isolate tests from real databases, networks, clocks, and external services unless broader integration is the goal.
- Strive for strong coverage of meaningful behavior, not coverage theater.

## Core Workflow

1. Identify the public behavior, contract, or regression that needs protection.
2. Decide the correct test level before writing examples: unit, integration, contract, or end-to-end.
3. Cover the smallest set of high-value happy path, edge case, and failure case behaviors first.
4. Choose the lightest isolation strategy that still keeps the test deterministic.
5. Review suite brittleness, speed, and maintenance cost before expanding breadth.

## Unit Test Guidance

- focus each test on one small behavior
- use long, descriptive test names
- prefer factories over heavy shared fixtures when object setup is the main need
- keep tests fast and deterministic
- if a test is unfinished, fail loudly with a placeholder instead of silently passing

## Choosing The Right Test Level

- Use unit tests for pure logic, branching, transformations, validation, and small contract checks.
- Use integration tests for database boundaries, filesystem work, serialization, framework glue, and repository adapters.
- Use functional or scenario tests for workflows that matter to a user or operator across several components.
- Call out code that is hard to unit test because it mixes orchestration, I/O, and business rules.

## Functional Test Guidance

- write tests as user or operator scenarios
- sketch the story with short comments before filling in the assertions when helpful
- verify visible outcomes, not just internal implementation details
- reserve slower end-to-end paths for behavior that unit tests cannot prove

## Common Patterns

- create fixtures that clarify intent instead of hiding too much setup
- mock only true external boundaries
- prefer one clear assertion block over many loosely related assertions
- separate flaky environment issues from real product defects
- call out code that is hard to test because it mixes too many responsibilities

## Fixture, Factory, And Mock Strategy

- Prefer factories when object creation is noisy but the resulting values still matter to the test reader.
- Prefer fixtures for stable shared environment setup, not for hiding business intent.
- Mock at network, clock, queue, filesystem, and third-party boundaries; do not mock your own core logic by default.
- Verify outcomes and essential interactions, not every internal call sequence.
- When a mock is complex enough to understand only by reading setup code, the test probably needs a better seam.

## Coverage Guidance

- aim high, but do not obsess over a single percentage
- prioritize business-critical logic, edge cases, and failure handling
- treat missing tests around bug fixes as immediate follow-up work

## Flaky Test Diagnosis

- Look first for shared mutable state, order dependence, real time, randomness, network leakage, and concurrency assumptions.
- Distinguish product bugs from test bugs before widening assertions or adding retries.
- Prefer deterministic clocks, seeded randomness, and isolated temp resources.
- Treat intermittent tests as urgent maintenance debt because they damage trust in the whole suite.

## Review Triggers For Refactoring

- tests require too much setup to express one behavior
- assertions depend on incidental formatting or internal implementation details
- fixtures mutate shared state across tests
- many tests fail when harmless refactors occur
- business rules are duplicated across test helpers instead of expressed once in product code

## Output Expectations

When producing recommendations, organize them into:

1. Behaviors that need protection
2. Highest-value unit tests
3. Functional or broader tests to keep separate
4. Mock and fixture strategy
5. Flakiness or maintenance risks
