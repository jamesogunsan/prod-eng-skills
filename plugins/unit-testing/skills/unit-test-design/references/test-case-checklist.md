# Test Case Checklist

Use this checklist to turn code or requirements into a focused unit test plan.

## Core Behaviors

- What is the expected happy path?
- What inputs, outputs, or side effects define success?
- What public contract should remain stable after refactors?

## Edge Cases

- Empty, null, or missing inputs
- Minimum and maximum boundary values
- Duplicate, reordered, or partially valid input sets
- Unexpected but plausible data shapes

## Failure Cases

- Validation errors
- Dependency failures and timeouts
- Permission or state violations
- Retriable versus terminal errors

## State and Side Effects

- State mutation before and after execution
- Events, logs, callbacks, or persistence side effects
- Idempotency and repeat execution behavior

## Maintenance Check

- Can the test be understood quickly from the name and assertions?
- Does the test verify behavior instead of private implementation?
- Is this really a unit test, or should it move to a broader layer?
