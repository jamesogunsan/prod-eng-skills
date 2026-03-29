# Test Selection Guidelines

Use these prompts when choosing the next TDD test:

- What is the smallest user-visible behaviour still missing?
- Which case would give the highest confidence for the least code?
- Is this really one behaviour, or have multiple cases been bundled together?
- Can the test name describe one clear rule or expectation?
- Would a failing result point to one obvious next code change?

## Good Next Tests

- A single happy path for a new behaviour
- One boundary condition that changes the result materially
- One failure path with clear expected handling
- One regression case for a known bug

## Avoid Next

- Large integration-style setups when the behaviour can be isolated
- Several assertions about unrelated rules in one test
- Tests that mirror internal method calls rather than outcomes
- Edge cases before the core behaviour is protected
