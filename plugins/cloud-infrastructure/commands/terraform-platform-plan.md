---
description: "Plan Terraform or OpenTofu foundations for a cloud platform using local infrastructure agents"
argument-hint: "<platform or workload> [--provider aws|azure|gcp|oci|multi] [--target network|kubernetes|app-platform|shared-services]"
---

# Terraform Platform Plan

Use this command when the user wants a Terraform or OpenTofu foundation, reusable modules, remote state design, IaC standards, or a delivery workflow for cloud infrastructure.

## Command Rules

1. Use only local agents from this plugin.
2. Keep the output focused on reusable Terraform and platform foundations, not one-off resource snippets.
3. Prefer module design, state strategy, testing, and deployment workflow guidance over raw code dumps.
4. Align recommendations with the target cloud provider and operating model.
5. If Kubernetes or delivery automation is part of the request, include the matching local agent review.

## Suggested Workflow

### 1. Define the platform target

- Parse `$ARGUMENTS` into provider, workload, and target area.
- Identify whether the user needs:
  - foundational networking
  - Kubernetes platform modules
  - shared services
  - a full multi-environment landing zone

### 2. Run the IaC design pass

Use the Task tool:

```text
subagent_type: "terraform-agent"
description: "Design Terraform platform plan for $ARGUMENTS"
prompt: |
  Design a Terraform or OpenTofu platform plan for: $ARGUMENTS.

  Produce a practical plan covering:
  1. Recommended module boundaries
  2. State and backend strategy
  3. Environment structure and promotion flow
  4. Testing and validation approach
  5. Security, policy, and drift-control recommendations
  6. Suggested repository layout

  Reuse patterns from `skills/terraform-module-library/`.

  Write the final result as a concise markdown plan.
```

### 3. Add architecture and delivery reviews when needed

If the request includes platform topology, landing zones, or provider selection:

```text
subagent_type: "cloud-agent"
```

If the request includes Kubernetes foundations, cluster bootstrapping, GitOps, or multi-cluster design:

```text
subagent_type: "kubernetes-agent"
```

If the request includes CI/CD, promotion workflows, or GitOps automation:

```text
subagent_type: "deployment-agent"
```

### 4. Incorporate supporting skills

- `skills/terraform-module-library/` for module conventions and examples
- `skills/multi-cloud-architecture/` for provider abstraction and cross-cloud decisions
- `skills/cost-optimization/` for tagging, chargeback, and sizing guardrails
- `skills/hybrid-cloud-networking/` if the platform includes on-premises connectivity

### 5. Return a platform plan

Structure the answer as:

1. Target platform summary
2. Recommended Terraform or OpenTofu structure
3. State, security, and policy approach
4. Delivery workflow and quality gates
5. Rollout sequence and next steps

## Expected Output

The final result should help a team stand up a maintainable IaC foundation quickly, with clear module boundaries, environment patterns, and operational guardrails.
