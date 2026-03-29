# Mocking and Fixture Guidelines

Use these guidelines to keep unit tests deterministic without hiding the behavior being tested.

## Mock Only True Boundaries

- External services, APIs, queues, filesystems, clocks, randomness, and process environment
- Expensive or nondeterministic collaborators
- Dependencies whose real behavior is already covered elsewhere

## Avoid Over-Mocking

- Do not mock simple value objects or pure functions unnecessarily
- Do not assert every internal call if the user-visible outcome is what matters
- Avoid mocks that mirror implementation structure too closely

## Fixture Design

- Keep fixtures small and explicit
- Prefer local setup when reuse would hide intent
- Reuse fixtures only when the shared shape is stable and obvious
- Make default fixtures valid, then override only what the case needs

## Stabilizing Tests

- Freeze time instead of sleeping
- Seed randomness instead of hoping for repeatability
- Reset shared state between tests
- Avoid order-dependent data or leaked global mutations

## Good Review Questions

- Does the mock represent a real boundary?
- Would this test still be useful after an internal refactor?
- Is the fixture clearer than inlining the setup?
- Are we hiding an architectural testing problem that should be fixed in the production code?
