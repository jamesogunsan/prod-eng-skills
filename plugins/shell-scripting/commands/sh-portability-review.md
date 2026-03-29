---
description: "Review a shell script for POSIX portability and safer cross-environment behaviour"
argument-hint: "<script path or shell task> [--focus portability|safety|migration|balanced]"
---

# POSIX Shell Portability Review

Use the local POSIX shell agent to review a script for `sh` compatibility across mixed or constrained environments.

## Use Local Context

- Read the target script or the user's shell snippet carefully before making recommendations.
- Load `skills/shellcheck-configuration/SKILL.md`.
- If the script is operational or production-facing, also load `skills/bash-defensive-patterns/SKILL.md` for safety checks that still apply in `sh`.
- Use only local agents from `plugins/shell-scripting/agents/`.

## Ask The POSIX Shell Agent

Use the Task tool with:

```yaml
subagent_type: "posix-shell-agent"
description: "Review shell script portability and POSIX safety"
prompt: |
  Review this shell task for POSIX portability and operational safety: $ARGUMENTS

  Focus on:
  - Bash-only features that will break in POSIX sh
  - non-portable flags, GNU assumptions, and shell-specific behaviour
  - quoting, error handling, cleanup, and file safety
  - target-shell validation strategy using shells such as dash or ash
  - whether the script should remain in POSIX shell at all

  Return:
  1. Portability blockers and unsafe patterns
  2. Safe POSIX-compatible replacements
  3. Validation steps across target shells
  4. Migration notes or a concise compatible example where useful
```

## Output Structure

Organise the response into:

1. Portability risks
2. Safe replacements
3. Validation steps
4. Follow-up improvements
