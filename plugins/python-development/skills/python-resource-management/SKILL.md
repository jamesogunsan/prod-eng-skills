---
name: python-resource-management
description: Improve Python resource handling with guidance on files, sockets, database handles, context managers, cleanup, and safe lifecycle boundaries. Use for reliability reviews and production hardening.
---

# Python Resource Management

Use this skill when code opens, allocates, or acquires resources that must be released safely.

## Load References

- Read `references/resource-lifecycle-checklist.md` for a broad review of resource acquisition and cleanup behavior.
- Read `references/context-manager-and-cleanup-patterns.md` when the main question is about `with`, teardown semantics, or failure-path cleanup.

## Core Principles

- prefer `with` statements and context managers for local resources
- make acquisition and release boundaries obvious
- keep cleanup reliable even during exceptions
- avoid leaking file handles, connections, locks, and subprocess resources

## Core Workflow

1. Identify what resources are acquired: files, sockets, DB sessions, clients, locks, threads, subprocesses, or temp state.
2. Check who owns acquisition and who owns release.
3. Review normal, exception, timeout, retry, and shutdown paths separately.
4. Narrow resource lifetime to the smallest useful scope.
5. Add cleanup validation where leaks or half-closed state would hurt production behavior.

## Review Guidance

- check whether resources are always closed or released
- check whether context managers hide too much behavior
- check whether retry or timeout logic leaves resources hanging
- check whether background jobs and services clean up during shutdown

## Ownership Heuristics

- The layer that creates a resource should usually own its cleanup contract.
- Long-lived shared clients should have explicit startup and shutdown wiring.
- Short-lived resources should stay inside a local context boundary.
- Avoid passing open handles deep through the codebase when higher-level data is enough.
- If cleanup depends on call ordering or discipline alone, the design is fragile.

## Common High-Value Improvements

- replace manual open-close flows with `with`
- narrow the scope of resource lifetimes
- separate resource setup from business logic
- add cleanup tests for failure paths

## Failure And Shutdown Concerns

- Timeouts and retries should not strand half-open connections or file state.
- Cancellation and exceptions should preserve cleanup guarantees.
- Worker and service shutdown should stop new acquisition before draining existing work.
- Temporary files, locks, and child processes need explicit teardown under abnormal exits.

## Context Manager Guidance

- Prefer context managers when acquisition and release are tightly paired.
- Keep context managers honest about side effects; avoid hiding expensive remote setup behind a tiny wrapper name.
- If a context manager performs retries or fallback internally, document that behavior clearly.

## Output Expectations

1. Resources at risk
2. Cleanup and lifecycle issues
3. Better context-manager usage
4. Shutdown or recovery concerns
5. Immediate safety fixes
