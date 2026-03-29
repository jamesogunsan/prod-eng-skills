---
description: "Review a cloud or hybrid infrastructure design using the local cloud-infrastructure agents"
argument-hint: "<system or platform> [--scope single-cloud|multi-cloud|hybrid] [--focus architecture|networking|kubernetes|mesh|cost]"
---

# Cloud Architecture Review

Use this command when the user wants an infrastructure design review, migration plan, hybrid-cloud recommendation, Kubernetes platform assessment, or a cross-cloud trade-off analysis.

## Command Rules

1. Stay inside the review scope described by `$ARGUMENTS`.
2. Use only local agents from `plugins/cloud-infrastructure/agents/`.
3. Prefer the plugin skills for reusable background instead of re-explaining cloud concepts from scratch.
4. Present trade-offs clearly: cost, operability, security, resilience, and lock-in.
5. If the system includes Kubernetes, service mesh, or hybrid connectivity, bring in the matching local agent.

## Suggested Workflow

### 1. Frame the request

- Parse `$ARGUMENTS` into:
  - target system or platform
  - deployment scope: `single-cloud`, `multi-cloud`, or `hybrid`
  - review focus: `architecture`, `networking`, `kubernetes`, `mesh`, or `cost`
- Restate the problem in one short paragraph before launching agents.

### 2. Run the primary architecture review

Use the Task tool:

```text
subagent_type: "cloud-agent"
description: "Review cloud architecture for $ARGUMENTS"
prompt: |
  Review the cloud architecture request for: $ARGUMENTS.

  Produce a practical architecture recommendation with:
  1. Recommended target architecture
  2. Service choices and rationale
  3. Key trade-offs across cost, security, resilience, and operability
  4. Risks, constraints, and assumptions
  5. Phased implementation plan

  If the request implies multi-cloud or hybrid architecture, use the decision patterns from
  `skills/multi-cloud-architecture/` and `skills/hybrid-cloud-networking/`.

  Write the final output as a concise markdown review.
```

### 3. Run supporting agent reviews when relevant

For hybrid or cross-cloud connectivity topics:

```text
subagent_type: "hybrid-cloud-agent"
```

For DNS, load balancing, connectivity, VPN, FastConnect, ExpressRoute, or traffic flow topics:

```text
subagent_type: "network-agent"
```

For Kubernetes platform, GitOps, cluster topology, or multi-cluster topics:

```text
subagent_type: "kubernetes-agent"
```

For Istio, Linkerd, mTLS, or traffic policy topics:

```text
subagent_type: "service-mesh-agent"
```

For cost reduction or spend governance topics:

- Load `skills/cost-optimization/SKILL.md`
- Ask the primary reviewer to include concrete savings opportunities and governance actions.

### 4. Consolidate the result

Return a final review with these sections:

1. Recommended architecture
2. Why this approach fits
3. Major risks and mitigations
4. Optional alternatives
5. Next implementation steps

## Skill Routing

- `skills/multi-cloud-architecture/` for provider trade-offs and placement decisions
- `skills/hybrid-cloud-networking/` for on-premises and cloud connectivity design
- `skills/cost-optimization/` for FinOps and savings opportunities
- `skills/terraform-module-library/` when the user also wants reusable IaC foundations
- `skills/istio-traffic-management/`, `skills/linkerd-patterns/`, `skills/mtls-configuration/`, and `skills/service-mesh-observability/` for mesh-specific reviews

## Expected Output

The final response should be opinionated, implementation-ready, and explicit about trade-offs. Avoid generic cloud comparisons unless they directly affect the recommendation.
