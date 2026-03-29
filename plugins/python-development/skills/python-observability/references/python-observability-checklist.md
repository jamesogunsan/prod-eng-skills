# Python Observability Checklist

## Logs

- Are logs structured and queryable?
- Do request, job, or trace identifiers exist?
- Are errors logged once with actionable context?

## Metrics

- Do metrics cover rate, errors, duration, backlog, and saturation?
- Are queue age, retries, and dependency failures visible where relevant?

## Traces And Correlation

- Can operators follow work across service or job boundaries?
- Are deploy or version identifiers visible during incident review?
