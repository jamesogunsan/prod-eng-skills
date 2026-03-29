# Risky Operations Checklist

- Check whether the script can delete, overwrite, deploy, restart, or move data.
- Confirm paths are validated before destructive commands run.
- Use `--` where option confusion is possible.
- Avoid building shell commands with untrusted input.
- Add logging before and after high-impact operations.
- Make repeated runs safe where possible.
- Define what rollback or cleanup means if a step fails halfway through.
- Prefer preview output or dry-run mode for scripts used by other operators.
