# Incidents

This plugin bundles agents, commands, and reusable guidance for production incident triage, service restoration, stakeholder communication, and post-incident follow-up.

## Contents

- `agents/`: local incident response support for triage, mitigation, and root cause analysis
- `commands/`: orchestrated incident-response workflows
- `skills/`: reusable checklists and postmortem guidance for incident handling

## Focus Areas

- Live incident triage and severity classification
- Safe mitigation, rollback, failover, and containment planning
- Evidence-driven root cause analysis across services and dependencies
- Clear stakeholder communication during active incidents
- Blameless postmortems, runbook updates, and prevention work

## Use These Repo Skills In OpenCode

From the repository root, install a skill from this repo with `npx openskills install <skill-path>`.

Examples:

```bash
npx openskills install ./plugins/incidents/skills/incident-response
```
