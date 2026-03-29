## Project Overview
- This workspace is a plugin library of reusable engineering skills, commands, agents, and reference assets.
- Most content lives under `plugins/`, grouped by domain such as `application-performance`, `cloud-infrastructure`, `observability`, and `security-compliance`.
- The repo is intended to work cleanly with both Claude Code and OpenCode.

## Working Conventions
- Read existing plugin content before editing so new material matches the surrounding structure and tone.
- Prefer updating an existing plugin, skill, command, or agent over creating a new top-level pattern.
- Keep files plain Markdown, YAML templates, or small helper scripts unless the target plugin already uses another format.
- Use ASCII by default and add comments only when they clarify non-obvious logic in scripts or templates.
- Keep platform-specific guidance thin and aligned across Claude Code and OpenCode when both are supported.

## Repository Structure
- `plugins/<domain>/skills/` contains reusable skill definitions, usually with `SKILL.md`, optional `references/`, and optional `assets/`.
- `plugins/<domain>/commands/` contains task-oriented command docs.
- `plugins/<domain>/agents/` contains specialized agent prompt files.
- Some plugins include helper scripts and packaged assets; keep new files near the related plugin rather than at the repo root.
- Root docs like `README.md`, `SETUP.md`, and `Makefile` define the current setup and usage flow for the repo.

## Quality Checks
- For Markdown changes, verify headings, examples, and relative paths stay consistent with neighboring files.
- For Python or shell script changes, run the narrowest relevant validation or script help command available before finishing.
- Do not add dependencies unless necessary; prefer existing patterns and utilities already present in the workspace.

## Safety
- Never commit secrets, credentials, or `.env` files.
- Avoid destructive git commands unless explicitly requested.
