# ShellCheck Warning Triage Guide

- Fix warnings that indicate quoting, splitting, globbing, or exit-code bugs first.
- Treat suppression as the exception, not the default response.
- Prefer code changes over disabling a rule when the warning points to ambiguity.
- Document intentional suppressions for portability constraints or tool limitations.
- Re-check whether a warning disappears once the script declares the correct shell.
