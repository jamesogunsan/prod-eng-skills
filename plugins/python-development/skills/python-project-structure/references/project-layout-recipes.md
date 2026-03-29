# Python Project Layout Recipes

## Library

- keep one primary package with a narrow public API
- expose stable imports intentionally
- keep infrastructure or CLI helpers outside the core public modules

## CLI Tool

- separate argument parsing, command dispatch, business logic, and external I/O
- keep the entry point thin
- make testable functions do the real work

## Service Or API

- separate transport layer, domain logic, and infrastructure adapters
- keep startup wiring and dependency construction near the edge
- isolate framework-specific code from core rules where possible

## Worker Or Job System

- separate task orchestration from the task business logic
- isolate retry and scheduling policy from the work implementation
- keep serialization and queue integration at the boundaries
