# Docstrings And Comments

Use this guide when reviewing Python documentation quality inside code.

## Docstrings

- Public modules, classes, and functions should have docstrings when their intent is not fully obvious from signature and name.
- One-line docstrings work for simple public helpers.
- Multi-line docstrings should include a summary first, then any important arguments, returns, side effects, exceptions, or usage context.
- Use action wording such as `Return`, `Build`, `Validate`, or `Load`.

## Comments

- Prefer code structure over explanatory comments when possible.
- Keep comments for business rules, non-obvious constraints, protocol quirks, and operational context.
- Delete stale comments aggressively.
- Inline comments should be rare and should add signal, not narration.

## Refactor Trigger

If a block needs several lines of explanation just to be understood, consider extracting a helper or renaming the steps before adding more prose.
