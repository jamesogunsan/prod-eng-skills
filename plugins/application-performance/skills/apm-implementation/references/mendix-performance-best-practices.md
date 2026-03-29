# Mendix Performance Best Practices

This reference collects practical performance do's and don'ts for Mendix applications.

## Introduction

Performance is a must-have quality for any app. Users will not tolerate slow experiences when alternatives exist.

Use simple solutions first. Avoid difficult constructs for performance reasons unless measurement shows they are necessary. Premature optimisation is risky, but so is ignoring known hotspots.

Performance should be balanced against other concerns such as security, maintainability, and architecture quality. Make motivated tradeoffs.

## Security

- Minimise the number of roles per user.
- Minimise the number of rules per entity.

## Domain Model

For a Mendix domain model, prefer a simple and sound design, then apply these checks:

- Create indexes on entities that will grow beyond 100 records and are searched by attributes other than Mendix references or IDs.
- Minimise calculated attributes because they run on every retrieve and on every row in list retrievals.
- Minimise event handlers and the work they do because they run on every relevant event, such as commit.
- Minimise reference set associations because they cause extra ID retrieval queries, especially in list views.
- Archive data when active and historical usage patterns differ significantly.
- Consider denormalisation when source data changes infrequently and repeated joins are expensive, but account for synchronisation logic.
- Avoid multiple inheritance levels and too many specializations on large persisted entities, especially when domain-model XPath security is involved.

When inheritance becomes expensive, consider these alternatives:

- Combine attributes into one entity and use an enumeration for specialization.
- Add separate specialization entities with a one-to-one relation.
- Add a non-persistable inheritance layer populated by business logic.

Avoid these anti-patterns:

- Temporary associations on persistable entities
- Multiple parallel associations between the same entities for access variants

For access variants such as owner, editor, and viewer, prefer an intermediary entity with an `AccessType` enumeration.

## Indexes

Indexes are essential for search and sort performance.

- Create as many indexes as are justified by query patterns.
- Cover search and sort clauses, ideally with one index.
- Do not create multiple indexes that start with the same attributes.
- Keep index width small; aim for fewer than three attributes and rarely exceed five.
- Start with the most selective attribute, while remembering that single-attribute searches can only use indexes that begin with that attribute.
- Indexes work best for equality searches, date and number ranges, and prefix or `startsWith` string searches.
- Even difficult clauses such as `contains` or `endsWith` can still benefit from index scans versus full table scans.

## Pages

- Keep pages simple and split them when possible.
- Minimise data sent to the client through chunking, filtering, and security.
- Avoid multiple identical data sources because they load the same objects repeatedly.
- Minimise conditional visibility.
- Give the user feedback when work takes more than a few seconds.
- Run asynchronous work in the background when the user does not need to wait for the result.

For dropdown filters based on associated entities, restrict options so only relevant associated objects are retrieved. This reduces expensive filtering on databases where missing criteria perform poorly.

## Microflows

Minimise work inside loops:

- Commit and delete in batches after loops when possible.
- Build `<Entity>_CommitList` or `<Entity>_DeleteList` collections before mass actions.
- Move retrieves outside loops and search within in-memory lists where appropriate.
- Push decision logic into queries before the loop when that reduces iterations.
- Use batches for large volumes to balance throughput and memory cleanup.
- Clear commit lists after batch commits.
- Pass objects and lists as parameters instead of retrieving them again unnecessarily.
- Use Mendix retrieve-plus-aggregate optimisation when counting lists.
- Prefer retrieve over association when you need the latest in-memory version of an object.
- Commit as late as possible to reduce lock duration.
- For scheduled events, commit in small chunks to avoid long locks.

## XPath

- Avoid unequal and `not` clauses where a positive formulation is possible.
- Combine paths to the same associated entity when query logic allows it.
- Make sure relevant attributes are indexed.
- Keep security rules simple; if one rule gives read-only access and another grants read-write access, let the broad read-only rule include all objects and the narrower rule add write access where needed.

Avoid unnecessarily exclusive access rules such as adding `[Editable = false()]` when `[Editable = true()]` already defines the narrower write rule.

## OQL

Most XPath best practices also apply to OQL.

- Remember that OQL does not automatically apply domain model security.
- Add explicit tenant or security filters where required.

## Web Services and XML

- Prefer SSHA256 over BCrypt except when hashing passwords.
- Avoid schema validation unless it is necessary because it slows processing.
- Avoid sub-transactions in microflows unless the isolation need justifies the performance cost.

## Infrastructure

- Scale infrastructure appropriately when the bottleneck is platform capacity.
- For on-premises Mendix deployments, place a proxying web server in front of Mendix to serve static content and compress responses.
