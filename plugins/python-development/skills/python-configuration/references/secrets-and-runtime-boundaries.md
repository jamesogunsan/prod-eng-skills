# Secrets And Runtime Boundaries

## Secrets

- inject secrets through environment or secret-management systems
- avoid hard-coding or committing secret values
- limit where secrets are read and passed

## Runtime Boundaries

- distinguish build-time, startup-time, and runtime config
- validate startup-time settings before accepting traffic or work
- avoid hidden dynamic config behavior unless there is a strong operational reason
