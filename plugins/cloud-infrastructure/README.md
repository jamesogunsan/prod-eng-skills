# Cloud Infrastructure

This plugin bundles reusable skills and agents for cloud architecture, Kubernetes platforms, service mesh design, hybrid networking, Terraform/OpenTofu workflows, and cloud cost optimization.

## Contents

- `agents/`: cloud, platform, networking, deployment, and infrastructure automation agents
- `commands/`: orchestrators for architecture reviews and Terraform platform planning
- `skills/`: reusable guidance for multi-cloud architecture, Terraform modules, service mesh patterns, mTLS, hybrid connectivity, and cost optimization

## Focus Areas

- Multi-cloud and hybrid cloud architecture across AWS, Azure, GCP, and OCI
- Kubernetes platform design, GitOps workflows, and service mesh rollout
- Terraform and OpenTofu module design, state management, and IaC governance
- Secure networking, mTLS, and cross-cloud connectivity
- Cloud cost optimization and resilient infrastructure patterns

## Use These Repo Skills In OpenCode

From the repository root, install a skill from this repo with `npx openskills install <skill-path>`.

Examples:

```bash
npx openskills install ./plugins/cloud-infrastructure/skills/multi-cloud-architecture
npx openskills install ./plugins/cloud-infrastructure/skills/terraform-module-library
```
