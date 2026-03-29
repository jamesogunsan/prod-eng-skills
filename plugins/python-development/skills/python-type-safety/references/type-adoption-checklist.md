# Type Adoption Checklist

## Start Here

- public functions and methods
- shared domain models
- config objects and parsed inputs
- serialization boundaries

## Review Questions

- Where do ambiguous shapes force defensive runtime checks everywhere?
- Which interfaces are stable enough to annotate now?
- Where is `Any` or unchecked dict usage hiding real contract problems?
