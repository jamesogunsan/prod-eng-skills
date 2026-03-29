# Shell Scripting

This plugin bundles local shell-scripting agents and reusable skills for defensive automation, script portability, and safer command-line tooling.

## Contents

- `agents/`: local agents for Bash and POSIX shell guidance
- `commands/`: review and hardening workflows for Bash and POSIX shell tasks
- `skills/`: reusable skill packs for defensive shell patterns and ShellCheck-oriented workflows

## Focus Areas

- Defensive shell scripting for production automation
- Safe input handling, quoting, and temporary resource management
- Bash-specific workflows and modern scripting practices
- POSIX-compatible scripting for portability across environments

## Use These Repo Skills In OpenCode

From the repository root, install a skill from this repo with `npx openskills install <skill-path>`.

Examples:

```bash
npx openskills install ./plugins/shell-scripting/skills/bash-defensive-patterns
npx openskills install ./plugins/shell-scripting/skills/shellcheck-configuration
```
