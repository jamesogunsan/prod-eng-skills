---
name: python-code-style
description: Improve Python readability with practical guidance on naming, imports, docstrings, comments, line length, explicit control flow, and common Pythonic idioms. Use for code review, refactors, and style decisions.
---

# Python Code Style

Use this skill when reviewing or writing Python that should be readable, explicit, and consistent under real maintenance pressure.

## Load References

- Read `references/style-review-checklist.md` when doing a general code review or refactor.
- Read `references/docstrings-and-comments.md` when the request is about API clarity, inline documentation, or public module quality.

## Core Principles

- Follow the spirit of PEP 20: beautiful, explicit, simple, and readable code wins.
- Follow PEP 8 when sensible, but keep local consistency and readability higher than mechanical rule-following.
- Prefer small clear functions over comments that explain confusing code.
- Fix poor naming, structure, or style issues as soon as they are discovered.

## Core Workflow

1. Identify whether the code is public API, internal implementation, test code, or one-off scripting.
2. Check whether the current style is locally consistent before proposing broad rewrites.
3. Fix the highest-value readability issues first: naming, control flow, imports, and hidden side effects.
4. Improve documentation only where the code cannot become obvious through structure alone.
5. Recommend tooling only after the style target is clear.

## What To Prefer

- `lower_case_with_underscores` for variables, functions, methods, modules, and packages
- `CapWords` for classes and exceptions
- `_single_leading_underscore` for internal names
- `__double_leading_underscore` only when name mangling is actually needed
- `ALL_CAPS_WITH_UNDERSCORES` for constants
- grouped imports at the top of the file: standard library, third-party, local
- parentheses for line continuation instead of backslashes
- one statement per line unless a compact comprehension is clearly more readable

## Naming Heuristics

- Prefer names that expose domain meaning, not implementation trivia.
- Avoid one-letter names except in tiny local loops where intent is immediately obvious.
- Avoid redundant module prefixes after importing a module namespace.
- Prefer reverse notation when grouping related values, such as `orders_pending` and `orders_complete`.
- Reserve dunder-style names for Python-defined semantics only.

## Control Flow And Expression Guidance

- Prefer explicit early returns over deeply nested `if` blocks.
- Prefer truthiness checks for normal boolean or emptiness decisions, but use `is None` when that distinction matters.
- Use comprehensions and generator expressions when the transformation stays readable in one pass.
- Break long expressions across lines with parentheses, and simplify them if wrapping still hides intent.
- Avoid compressing multiple unrelated decisions into one clever expression.

## What To Avoid

- one-letter names like `l`, `O`, or `I`
- wildcard imports
- redundant prefixes like `AudioCore` after importing `audio`
- boolean comparisons like `if flag == True`
- comments that restate obvious code
- overly clever expressions that hide intent

## Common Pythonic Patterns

- prefer truthiness checks for booleans and empties, but use `is None` and `is not None` when checking for `None`
- prefer comprehensions or generator expressions over manual append loops when they stay readable
- use `with open(...)` and other context managers for resources
- use `enumerate()` instead of manual index counters
- use `startswith()` and `endswith()` instead of brittle string slicing
- use `isinstance()` instead of direct `type(...) is ...` checks

## Imports And Module Layout

- Keep imports at the top unless a local import is intentionally used to break a cycle or reduce optional dependency cost.
- Group imports into standard library, third-party, and local application imports.
- Prefer importing modules or stable namespaces over scattering symbol imports through the file.
- Treat wildcard imports as a last resort for carefully controlled API re-export cases only.
- If import style is compensating for circular dependencies, call out the structural problem directly.

## Documentation And Comments

- follow PEP 257 docstring conventions
- use one-line docstrings for obvious public functions
- use multiline docstrings when arguments, returns, side effects, or usage need explanation
- document public modules, classes, and functions
- document `__init__` behavior in the class docstring or constructor docstring
- prefer extracting helper functions over leaving dense explanatory comments

## Tooling Guidance

- Use formatters and linters to reduce low-value style debates, not to replace code review judgment.
- Treat auto-formatting as the baseline, then review whether the result is still understandable.
- Recommend type checking or stricter linting where style issues are symptoms of unclear contracts.
- Do not propose churn-heavy style rewrites in stable code without a readability payoff.

## Output Expectations

When reviewing code, organize guidance into:

1. Readability and naming issues
2. Import, structure, and formatting issues
3. Pythonic improvements
4. Docstring or comment changes needed
5. The smallest high-value fixes to make first
