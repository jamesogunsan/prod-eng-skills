# Logging Review Checklist

Use this checklist when reviewing logging architecture and configuration.

## Architecture Checks

- Check whether handlers are configured centrally rather than scattered across many component loggers.
- Check whether application code uses named loggers instead of calling the root logger directly.
- Check whether structured output is present for production sinks.
- Check whether log levels, rotation, and sink choices match operational needs.

## Quality Checks

- Check whether logs answer useful operational questions rather than repeating internal noise.
- Check whether exception and stack data are captured clearly.
- Check whether important request, job, tenant, or trace context is present where needed.
- Check whether secrets, tokens, or personal data could leak into logs.

## Output Format

Report findings as:

1. Overall status
2. Critical and high-risk issues
3. Structured logging assessment
4. Context and correlation assessment
5. What is already working well
