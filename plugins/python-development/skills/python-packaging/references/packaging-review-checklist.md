# Packaging Review Checklist

## Metadata And Structure

- Is the `pyproject.toml` metadata complete and intentional?
- Is the package layout obvious and import-safe?
- Are entry points and package data explicit?

## Dependency Scope

- Are runtime and dev-only dependencies separated?
- Are optional dependencies and extras justified?
- Is the pinning strategy clear?

## Release Readiness

- Can CI build and validate the artifact reproducibly?
- Is versioning policy understood?
- Are publish or internal release steps documented and testable?
