# Skill Development

This plugin bundles reusable skills and helper agent guidance for creating, refining, testing, and packaging skills for Claude and OpenCode.

## Contents

- `skills/`: installable skill-development workflows, references, scripts, and helper agents

## Focus Areas

- Creating new skills from concrete user workflows and examples
- Improving existing skills with clearer triggering, leaner instructions, and stronger references
- Running skill evals, benchmark comparisons, and feedback-driven iteration loops
- Packaging skills cleanly for reuse in Claude and OpenCode environments

## Use These Repo Skills In OpenCode

From the repository root, install a skill from this repo with `npx openskills install <skill-path>`.

Examples:

```bash
npx openskills install ./plugins/skill-development/skills/opencode-skill-creator
npx openskills install ./plugins/skill-development/skills/claude-skill-creator
```
