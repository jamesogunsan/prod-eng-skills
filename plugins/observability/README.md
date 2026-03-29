# Observability

This plugin bundles agents, commands, and skills for telemetry design, production monitoring, alerting, tracing, Prometheus and Grafana workflows, SLO design, network visibility, and performance-focused observability reviews.

## Contents

- `agents/`: local agents for observability, performance, networking, and database bottleneck analysis
- `commands/`: orchestrated workflows for observability reviews, monitoring setup, and SLO planning
- `skills/`: reusable guidance for telemetry architecture, instrumentation priorities, alerting, tracing, dashboards, Prometheus, and SLOs

## Focus Areas

- OpenTelemetry-first monitoring, logging, and tracing design
- Prometheus collection strategy, recording rules, and alert design
- Grafana dashboard structure for operators, service owners, and reliability reviews
- SLI and SLO definition, error budget thinking, and alert quality improvement
- Performance bottleneck analysis tied to dashboards, traces, and service telemetry
- Network and edge visibility for latency, routing, CDN, and service mesh issues
- Database observability for slow queries, saturation, and workload-driven tuning

## Use These Repo Skills In OpenCode

From the repository root, install a skill from this repo with `npx openskills install <skill-path>`.

Examples:

```bash
npx openskills install ./plugins/observability/skills/observability-design
npx openskills install ./plugins/observability/skills/prometheus-configuration
```
