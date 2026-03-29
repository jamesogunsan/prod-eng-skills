# Python Test Design Checklist

## Test Selection

- What user-visible behavior or regression is this test protecting?
- Is this really a unit test, or should it be an integration or scenario test?
- What is the smallest set of happy path, edge case, and failure case coverage needed first?

## Isolation

- Are real databases, networks, clocks, queues, or files leaking into this test unnecessarily?
- Is the chosen mock boundary a real dependency boundary?
- Would a factory or lighter fixture make the test clearer?

## Assertions

- Do assertions check behavior rather than incidental implementation details?
- Would harmless refactoring break this test for the wrong reasons?
- Is the test name specific enough to explain the intended behavior?

## Maintenance

- Is the setup shorter than the behavior under test?
- Is the test fast enough to run frequently?
- If the test fails, will the failure message point to the real problem quickly?
