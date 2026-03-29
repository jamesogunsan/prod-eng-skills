# Python Design Review Checklist

## Responsibilities

- Does each function or class have one clear reason to change?
- Are orchestration, domain rules, and infrastructure concerns separated enough?

## Abstractions

- Does this abstraction solve a real repeated problem?
- Would a plain function or smaller helper be clearer?
- Is inheritance being used where composition would be simpler?

## Boundaries

- Are frameworks and third-party clients kept near the edges?
- Can core logic be tested without heavy patching?
