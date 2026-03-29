# API Contract Patterns

## Strong Contracts

- explicit inputs and return types
- well-defined optionality
- domain objects instead of loose unvalidated dicts where complexity justifies it

## Good Boundaries

- translate untyped external data into typed internal models early
- keep internal contracts clearer than external payloads
- use protocols when behavior matters more than implementation inheritance
