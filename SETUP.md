# Setup device

> This setup flow uses `make` and Homebrew on macOS. If `make` is missing, install Apple's Command Line Tools with `xcode-select --install`. If Homebrew is missing, install it from `https://brew.sh/`.

This project uses the repository `Makefile` for local setup.

Current support:
- macOS only
- Homebrew required

## What gets installed

`make setup` installs these tools:
- `skaffold`
- `k6`
- `k9s`
- `htop`
- `grafanactl`
- `uv`
- `ghostty` via Homebrew cask
- `opencode`
- `openskills`
- `openspec`

It also adds these shell lines to `~/.zshrc` if they are not already present:
- Visual Studio Code CLI path export
- `export OPENSPEC_TELEMETRY=0`
- `export DO_NOT_TRACK=1`

## Before you start

1. Install Homebrew if you do not already have it: `https://brew.sh/`
2. Open a terminal in the repository root:

```bash
cd /Users/jamesogunsanwo/Documents/personal/learning/prod-eng-skills
```

## Available setup commands

Show available targets:

```bash
make help
```

Preview commands without running them:

```bash
make -n setup
make -n teardown
make -n add-skills-opencode
make -n remove-skills-opencode
make -n add-skills-claude
make -n remove-skills-claude
make -n add-skill-opencode SKILL=plugins/logging/skills/python-async-logging
make -n add-skill-claude SKILL=plugins/logging/skills/python-async-logging
make -n remove-skill-opencode SKILL=plugins/logging/skills/python-async-logging
make -n remove-skill-claude SKILL=plugins/logging/skills/python-async-logging
```

Install local dependencies:

```bash
make setup
```

Remove local dependencies:

```bash
make teardown
```

## Skill installation

List all repo skills:

```bash
make list-skills
```

Install all repo skills into OpenCode:

```bash
make add-skills-opencode
```

Remove all repo skills from OpenCode:

```bash
make remove-skills-opencode
```

Install one skill into OpenCode:

```bash
make add-skill-opencode SKILL=plugins/logging/skills/python-async-logging
```

Remove one OpenCode skill:

```bash
make remove-skill-opencode SKILL=plugins/logging/skills/python-async-logging
```

Install all repo skills into global Claude:

```bash
make add-skills-claude
```

Install one local skill into global Claude:

```bash
make add-skill-claude SKILL=plugins/logging/skills/python-async-logging
```

Remove all repo skills from global Claude:

```bash
make remove-skills-claude
```

Remove one Claude skill from global Claude:

```bash
make remove-skill-claude SKILL=plugins/logging/skills/python-async-logging
```

Note:
- Claude installs are copied into `~/.claude/skills`
- Claude skill folders are namespaced as `<plugin>--<skill-dir>` to avoid collisions
- Repo-local `.claude/skills/` is not needed when you use the global Claude install targets
- OpenCode installs use `npx openskills install --global <skill-path>` under the hood
- OpenCode removals use `npx openskills remove <skill-name>` under the hood
- For one-off OpenCode actions, pass `SKILL=<path-or-url>` to install and `SKILL=<path-or-name>` to remove
- For one-off Claude actions, pass `SKILL=<path>` to install and `SKILL=<path-or-namespaced-name>` to remove

## Typical first-time setup

```bash
make help
make setup
make add-skills-opencode
make add-skills-claude
```

## Troubleshooting

- If `make setup` fails, confirm `brew` is installed and available in your shell
- If `make add-skills-opencode` fails, install Node.js so `npx` is available
- If this repo still has a local `.claude/skills/` folder from older installs, you can delete it and rely on `~/.claude/skills` instead
- If you updated `~/.zshrc`, reload your shell with `source ~/.zshrc` or open a new terminal
