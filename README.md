> If you’ve stumbled upon this repository while searching for a collection of open source skills use https://www.skill.fish/skill

# Production engineering skills

This repo is a shared library of production engineering agents, skills, commands, and supporting references for Claude Code and OpenCode.

The goal is to give developers stronger defaults, better guardrails, and reusable workflows for common production engineering tasks.

## What is in this repo

- reusable plugins under `plugins/`
- platform-facing skills, agents, and commands for Claude Code and OpenCode
- focused guidance for areas like performance, observability, incidents, shell scripting, infrastructure, security, testing, and git workflows

## Setup

This repo now uses the root `Makefile` for setup and skill installation.

Current support:
- macOS only
- Homebrew required

Typical first-time setup:

```bash
make help
make setup
source ~/.zshrc
make add-skills-opencode
make add-skills-claude
```

Install one skill only:

```bash
make add-skill-opencode SKILL=plugins/logging/skills/python-async-logging
make add-skill-claude SKILL=plugins/logging/skills/python-async-logging
make remove-skill-opencode SKILL=plugins/logging/skills/python-async-logging
make remove-skill-claude SKILL=plugins/logging/skills/python-async-logging
```

Preview commands without running them:

```bash
make -n setup
make -n teardown
make -n add-skills-opencode
make -n remove-skills-opencode
make -n add-skills-claude
make -n remove-skills-claude
```

For full setup details, see [`SETUP.md`](./SETUP.md).

Note:
- Claude skill installs are namespaced as `<plugin>--<skill-dir>` to avoid collisions
- Claude installs target the global Claude skills directory at `~/.claude/skills`
- OpenCode skill installs now use global scope via `npx openskills install --global`
- Use `SKILL=<path-or-url>` with `add-skill-opencode` for one-off OpenCode installs
- Use `SKILL=<path-or-name>` with `remove-skill-opencode` for one-off OpenCode removals
- Use `SKILL=<local-path>` with `add-skill-claude` for one-off Claude installs
- Use `SKILL=<local-path-or-namespaced-name>` with `remove-skill-claude` for one-off Claude removals

## Repository layout

```text
.
|- AGENTS.md
|- Makefile
|- README.md
|- SETUP.md
`- plugins/
   |- application-performance/
   |- cloud-infrastructure/
   |- database-cloud-optimization/
   |- database-design/
   |- git-pr-workflows/
   |- incidents/
   |- logging/
   |- observability/
   |- security-compliance/
   |- shell-scripting/
   |- skill-development/
   |- tdd-workflows/
   `- unit-testing/
```

## Plugin structure

Most plugins follow this shape:

```text
plugins/<plugin-name>/
|- README.md
|- agents/
|- commands/
`- skills/
```

- `agents/` contains focused advisor prompts
- `commands/` contains orchestrated workflows
- `skills/` contains reusable guidance and local references

## Recommended workflow

1. Run `make setup`
2. Install repo skills into the tooling you use
3. Open the plugin most relevant to your task
4. Use plugin `README.md` files to find the right agent, command, or skill

## Troubleshooting

- if `make setup` fails, confirm `brew` is installed and available
- if `make add-skills-opencode` fails, install Node.js so `npx` is available
- if this repo still has a local `.claude/skills/` folder from older installs, you can delete it and rely on `~/.claude/skills` instead
- if shell changes do not appear, run `source ~/.zshrc` or open a new terminal
