# CI Linting Checklist

- Run `shellcheck` on every changed shell script in CI.
- Match lint mode to the intended shell and shebang.
- Keep suppressions close to the affected code and explain why they are needed.
- Pair linting with `shfmt` and at least one execution-level validation step.
- Fail CI on real safety and correctness findings rather than warning fatigue.
- Revisit broad suppressions during code review.
