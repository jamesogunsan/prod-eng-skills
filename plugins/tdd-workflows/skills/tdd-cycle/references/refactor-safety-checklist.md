# Refactor Safety Checklist

- Confirm the relevant tests are green before changing structure
- Add characterisation tests first if behaviour coverage is weak
- Separate naming cleanup, extraction, and logic moves into small steps
- Do not mix new behaviour with cleanup in the same refactor step
- Re-run the fastest relevant tests after each change
- Re-run the broader local suite before finishing
- Be ready to revert the last small step if the design gets worse
