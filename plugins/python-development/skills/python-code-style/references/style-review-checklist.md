# Python Style Review Checklist

Use this checklist to review Python code for readability, consistency, and maintenance quality.

## Readability

- Are names explicit about domain meaning?
- Can a new engineer explain the control flow after one read?
- Are complex expressions broken into obvious steps?
- Are comments explaining real context instead of obvious code?

## Naming

- Do functions, variables, and modules use lowercase underscore naming?
- Do classes and exceptions use CapWords?
- Are internal-only names clearly marked with a leading underscore where useful?
- Are there redundant prefixes or suffixes caused by poor import style?

## Imports And Layout

- Are imports grouped by standard library, third-party, and local code?
- Are wildcard imports avoided?
- Are local imports justified rather than accidental?
- Do imports reveal circular dependency pressure?

## Pythonic Usage

- Are truthiness checks, `is None`, comprehensions, and context managers used appropriately?
- Is the code avoiding brittle string slicing, manual counters, and type equality checks?
- Is list-comprehension logic still readable, or should it become a loop/helper?

## Review Output

Report:

1. highest-impact readability problems
2. naming and module-layout issues
3. Pythonic improvements worth making now
4. comment or docstring gaps
5. low-value churn to avoid
