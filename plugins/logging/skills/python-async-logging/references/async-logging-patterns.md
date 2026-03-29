# Async Logging Patterns

Use these patterns when Python logging must stay useful under production load.

## Preferred Patterns

- Configure logging centrally in the application rather than inside shared libraries.
- Use named loggers in code with `logging.getLogger(__name__)` instead of writing directly to the root logger.
- Prefer structured JSON output for production sinks and simpler text output only where humans need fast local readability.
- Use `QueueHandler` or another background-friendly pattern when synchronous writes would add avoidable latency.
- Capture exceptions and stack data in a structured way rather than flattening them into ad hoc strings.

## Formatter Guidance

- Include fields such as timestamp, level, logger, message, trace ID, span ID, and key request context where available.
- Keep field names stable so dashboards and log pipelines do not break on every release.
- Use UTC timestamps and machine-friendly formats by default.
- Avoid very high-cardinality fields unless they are essential for diagnosis.

## Rollout Guidance

- Change one sink or format boundary at a time when migrating to JSON.
- Validate parser compatibility before replacing existing operational outputs.
- Confirm queue-backed logging still flushes during shutdown and error paths.
- Watch disk growth, sink latency, and dropped-log behaviour during rollout.
