---
name: python-design-patterns
description: Review Python design choices with guidance on composition, boundaries, helpers, factories, domain objects, and avoiding over-engineering. Use for architecture and refactor decisions.
---

# Python Design Patterns

Use this skill when the user needs cleaner Python design rather than just syntax fixes.

## Load References

- Read `references/design-review-checklist.md` for general design analysis.
- Read `references/python-pattern-selection-guide.md` when choosing between factories, adapters, services, value objects, or simpler alternatives.

## Core Principles

- explicit is better than implicit
- simple structures beat deep abstraction stacks
- composition is usually safer than clever inheritance trees
- helpers should clarify intent, not hide core behavior

## Core Workflow

1. Identify the actual design pain: change amplification, unclear ownership, poor testability, or framework leakage.
2. Separate domain logic, orchestration, and infrastructure concerns.
3. Prefer the smallest pattern that solves the real problem.
4. Review whether a design abstraction has more than one meaningful use case.
5. Recommend refactors that reduce coupling before introducing more layers.

## What To Review

- functions that do too much
- classes with unclear responsibility
- abstractions introduced before a real second use case exists
- utility modules that became dumping grounds
- boundaries between domain logic, infrastructure, and orchestration

## Pattern Selection Heuristics

- Use value objects when a data shape has domain meaning and invariants.
- Use services or orchestration functions for workflows that coordinate multiple dependencies.
- Use adapters to isolate external systems, frameworks, or third-party clients.
- Use factories when construction logic is noisy, validated, or environment-aware.
- Prefer a plain function over a class when there is no real state or lifecycle to own.

## Useful Patterns

- focused value objects and domain helpers
- factories for object setup in tests or controlled construction
- adapter layers around external systems
- clear service functions for orchestration

## Common Design Smells

- inheritance used mainly to share incidental code
- classes with many optional constructor dependencies
- one module owning both policy and transport details
- boolean flags that radically change behavior inside the same function
- frameworks dictating core business structure rather than sitting at the edge

## Refactor Guidance

- pull pure domain rules away from I/O first
- shrink modules before splitting them into many abstractions
- stabilize interfaces before introducing reusable layers
- keep the number of concepts low enough that new contributors can reason locally

## Output Expectations

1. Design smells
2. Simpler structure to prefer
3. Safe refactor direction
4. Trade-offs of the proposed change
5. Validation steps after refactoring
