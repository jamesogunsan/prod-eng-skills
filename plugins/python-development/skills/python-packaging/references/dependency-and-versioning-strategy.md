# Dependency And Versioning Strategy

## Dependencies

- keep runtime dependencies narrow
- avoid convenience packages with large transitive trees unless the payoff is clear
- pin tightly when reproducibility matters

## Versions

- choose a versioning policy the team will actually maintain
- document compatibility expectations for shared libraries
- align release tagging, changelogs, and CI artifacts
