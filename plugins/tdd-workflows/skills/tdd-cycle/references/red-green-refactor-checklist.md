# Red-Green-Refactor Checklist

## Red

- Pick one behaviour only
- Write a test that fails for the right reason
- Keep setup minimal and assertions explicit
- Confirm the failure message is understandable

## Green

- Change only enough code to satisfy the failing test
- Avoid adding design abstractions early
- Re-run the relevant test and then the local suite
- Stop once the behaviour is passing

## Refactor

- Refactor only with a green suite
- Preserve behaviour and public contracts
- Improve one design issue at a time
- Re-run fast feedback tests after each cleanup step

## Continue

- Choose the next most valuable behaviour or edge case
- Keep the cycle small enough to explain clearly
- Prefer many short cycles over one large leap
