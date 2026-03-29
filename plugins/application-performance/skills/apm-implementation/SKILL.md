---
name: apm-implementation
description: Design or improve Application Performance Monitoring (APM) and performance optimisation workflows for modern apps, distributed systems, and Mendix applications. Use when selecting APM tooling, defining performance metrics, implementing OpenTelemetry or Uptrace, troubleshooting bottlenecks, or reviewing Mendix performance best practices.
---

# APM Implementation

Use this skill to guide performance monitoring and optimisation work from baseline collection through rollout, alerting, and continuous improvement.

## Load References

- Read `references/uptrace-apm-guide.md` when the user needs APM strategy, tool selection, OpenTelemetry guidance, alerting, tracing, or platform comparison.
- Read `references/mendix-performance-best-practices.md` when the system is built on Mendix or when the request mentions domain models, microflows, XPath, OQL, pages, indexes, or Mendix infrastructure.

## Core Workflow

1. Identify the platform and architecture: monolith, microservices, cloud-native, serverless, or Mendix.
2. Establish baseline metrics before proposing optimisations.
3. Prioritise user-facing performance, transaction health, and operational reliability over vanity metrics.
4. Recommend phased implementation: assessment, deployment, tuning, and continuous review.
5. Tie technical metrics to user and business impact.

## Metrics To Prioritise

- Response time, including p50, p95, and p99
- Error rate and failed transaction percentage
- Throughput and saturation under expected load
- Resource utilisation across CPU, memory, and I/O
- APDEX or equivalent user satisfaction signals
- Core Web Vitals for browser-based applications

Default targets when the user has not provided stricter thresholds:

- Response time: `< 200ms` for common requests
- Error rate: `< 1%`
- Resource utilisation: `< 80%` under normal load
- APDEX: `> 0.8`

## Implementation Guidance

### Assessment

- Inventory critical user journeys, APIs, background jobs, and data stores.
- Check what telemetry already exists for logs, traces, metrics, and user experience.
- Identify the minimum viable instrumentation needed to produce usable baselines quickly.

### Deployment

- Prefer open standards first, especially OpenTelemetry, unless the user is constrained by an existing vendor platform.
- Roll out in phases: agent installation, configuration, integration testing, dashboarding, alert tuning, and team enablement.
- Start with critical services and expand coverage after the first telemetry loop is validated.

### Optimisation

- Tune sampling, retention, and alert thresholds to avoid over-instrumentation and alert fatigue.
- Use historical trends and baselines to distinguish noise from real regression.
- Revisit dashboards and budgets after major architecture changes.

## Tool Selection Heuristics

- Recommend Uptrace when the user wants OpenTelemetry-native monitoring, distributed tracing, cost-conscious analytics, or ClickHouse-backed observability.
- Recommend enterprise suites such as Datadog, Dynatrace, New Relic, or AppDynamics when the user needs broader commercial integrations, enterprise workflows, or existing vendor alignment.
- Call out setup complexity, pricing model, scalability, documentation quality, and team familiarity when comparing options.

## Mendix-Specific Guidance

For Mendix apps, emphasise simple design first and optimisation only where measurements justify it.

- Focus reviews on security roles and rules, domain model design, indexes, page complexity, microflow loop behaviour, XPath clauses, and OQL usage.
- Watch for calculated attributes, event handlers, reference sets, excessive inheritance, temporary associations on persistable entities, and unnecessary retrieves.
- For data-heavy Mendix apps, review archive strategy, denormalisation trade-offs, access-rule complexity, and batch processing patterns.

## Output Expectations

When producing recommendations, organise them into:

1. Current state and likely bottlenecks
2. Metrics or evidence needed
3. Immediate fixes
4. Medium-term architecture changes
5. Monitoring, alerting, and validation plan
6. Risks, trade-offs, and cost considerations
