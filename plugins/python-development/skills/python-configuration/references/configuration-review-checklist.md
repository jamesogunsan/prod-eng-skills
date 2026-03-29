# Configuration Review Checklist

## Structure

- Is there one clear config entry point?
- Are required and optional settings clearly separated?
- Are config reads centralized rather than scattered?

## Safety

- Do missing required settings fail fast?
- Are defaults safe for the environment?
- Are secrets kept out of code and casual local files?

## Operability

- Can an operator discover what settings matter?
- Is environment-specific behavior explicit?
- Are risky flags and tuning knobs documented with ownership?
