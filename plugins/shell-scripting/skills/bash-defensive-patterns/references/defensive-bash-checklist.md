# Defensive Bash Checklist

- Enable strict mode only when the script is written to tolerate it.
- Quote variable expansions unless you explicitly want splitting or globbing.
- Validate required environment variables and external commands early.
- Use `mktemp` plus cleanup traps for temporary paths.
- Treat `rm`, `mv`, `find`, `xargs`, and wildcard expansion as high-risk operations.
- Add dry-run support when a script can modify or delete important state.
- Prefer arrays over unsafe string splitting in Bash.
- Return useful exit codes and operator-facing error messages.
- Run `shellcheck` and a focused happy-path plus failure-path test before operational use.
