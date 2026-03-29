# Flaky Test Playbook

## Common Causes

- shared mutable state
- ordering assumptions
- real clock or sleep dependence
- randomness without seeding
- network or filesystem leakage
- concurrency and race conditions

## Triage Order

1. Reproduce locally with repeated runs.
2. Check whether the failure is in product code, test code, or environment.
3. Remove timing assumptions and shared state first.
4. Replace real side effects with deterministic seams where appropriate.
5. Tighten assertions to the intended contract.

## Hardening Moves

- use temp directories and isolated databases
- seed randomness explicitly
- freeze or inject time
- avoid cross-test fixture mutation
- add logging or diagnostics only where it helps localize the race
