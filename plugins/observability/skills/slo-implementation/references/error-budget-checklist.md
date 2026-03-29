# Error Budget Checklist

## SLI Selection

- Measure outcomes users actually feel
- Avoid objectives that depend on noisy or incomplete telemetry
- Separate availability, latency, and correctness when needed

## Target Setting

- Base targets on user expectations, service criticality, and current capability
- Avoid 100 percent targets that remove useful trade-off discussions
- Revisit targets when the service tier or customer expectations change

## Burn-Rate Alerting

- Use multiple windows to catch fast burns and slow burns
- Page only when budget consumption needs human action
- Include service context, likely impact, and response guidance

## Operating Model

- Define what happens when budget is healthy, stressed, or exhausted
- Review error-budget consumption in weekly or monthly reliability reviews
- Tie release decisions and reliability work to objective health
