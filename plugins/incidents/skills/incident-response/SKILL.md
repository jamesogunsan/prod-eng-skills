---
name: incident-response
description: Guide incident triage, mitigation, stakeholder communication, and blameless postmortem work for production outages and degraded services. Use when handling active incidents, investigating alerts, deciding on rollback or containment, or drafting follow-up actions.
---

# Incident Response

Use this skill to structure incident handling from first triage through follow-up actions.

## Load References

- Read `references/incident-triage-checklist.md` for severity assessment, evidence collection, and mitigation sequencing.
- Read `references/postmortem-template.md` when the user needs a blameless incident review, timeline, or prevention plan.

## Core Workflow

1. Establish impact, severity, blast radius, and time sensitivity.
2. Separate known facts from assumptions and unknowns.
3. Recommend the smallest safe mitigation set before deeper analysis.
4. Build ranked hypotheses and identify the evidence needed to test each one.
5. Communicate clearly to engineers and non-technical stakeholders.
6. Convert incident lessons into alerts, runbooks, tests, and ownership follow-up.

## What To Prioritize

- Customer impact and data risk
- Reversible actions over risky broad changes
- Current evidence over intuition
- Clear ownership and next checkpoints
- Prevention actions tied to the failure mode

## Output Expectations

When producing recommendations, organize them into:

1. Incident summary and severity
2. Immediate mitigation actions
3. Evidence and investigation plan
4. Communication guidance
5. Root cause and contributing factors when known
6. Follow-up actions, owners, and priorities
