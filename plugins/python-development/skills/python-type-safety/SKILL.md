---
name: python-type-safety
description: Improve Python type clarity with guidance on annotations, API contracts, interfaces, and practical type-checking boundaries. Use for refactors, library APIs, and maintainability reviews.
---

# Python Type Safety

Use this skill to improve code clarity and contracts through practical typing.

## Load References

- Read `references/type-adoption-checklist.md` for a gradual typing rollout.
- Read `references/api-contract-patterns.md` when reviewing public interfaces, shared models, or boundary contracts.

## Core Principles

- add types where they improve readability, maintenance, and refactoring safety
- use type hints to clarify contracts, not to show off complexity
- annotate public interfaces first
- keep runtime behavior simple even when static types grow more precise

## Core Workflow

1. Identify the highest-value contracts: public APIs, domain models, config objects, and boundary adapters.
2. Review where ambiguous data shapes or `Any`-style flows hide real risks.
3. Add types where they reduce guessing for callers and maintainers.
4. Choose gradual rollout over all-at-once annotation churn.
5. Pair annotations with type checking and targeted refactors when the model is unclear.

## What To Prefer

- straightforward function annotations on public functions and methods
- typed config, return values, and shared domain objects where helpful
- gradual adoption in mature codebases
- clarity over maximal type-system cleverness

## High-Value Targets

- inputs and return values for public functions
- domain objects shared across modules
- config and settings structures
- repository and service interfaces
- serialization and deserialization boundaries

## What To Avoid

- over-abstract generic types that make ordinary code harder to read
- forcing annotations into unstable internal code before the interfaces settle
- using typing to cover unclear ownership or data-shape problems

## Review Heuristics

- If a function returns multiple shapes depending on flags, the contract is probably underspecified.
- If callers repeatedly cast or guard values, the upstream type boundary is too weak.
- Prefer explicit `None` handling and sum-type style modeling over vague optional behavior.
- Use protocols or interfaces when behavior matters more than concrete inheritance.
- If a type alias hides more than it explains, simplify it.

## Tooling Guidance

- Treat the type checker as design feedback, not just a gate.
- Raise strictness where interfaces are stable and high-value.
- Allow looser typing temporarily in churn-heavy code, but note the debt clearly.

## Output Expectations

1. Contracts that need clearer typing
2. Public interfaces to annotate first
3. Unsafe or ambiguous data flows
4. Practical typing improvements
5. Suggested type-checking rollout order
