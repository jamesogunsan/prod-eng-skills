# Module Boundary Smells

- circular imports or late imports used as a permanent workaround
- `utils` modules with many unrelated helpers
- one package mixing API handlers, database access, and domain logic
- test code needing deep patching to reach business behavior
- public modules that re-export internal details by accident
- package names that encode org charts rather than software responsibilities
