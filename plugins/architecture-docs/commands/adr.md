---
description: "Write a numbered MADR-format Architecture Decision Record from a decision and its context, or list existing ADRs with their status."
argument-hint: "--title \"<decision>\" [--status proposed|accepted|deprecated|superseded] [--supersedes N] | --list"
---

# /adr

> Create an Architecture Decision Record documenting a technical decision with context, options, and consequences.

## Trigger

`/adr` -- invoked when a significant architectural or technical decision needs to be documented.

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--title <text>` | Yes | Decision title (e.g., "Use PostgreSQL as primary datastore") |
| `--status <state>` | No | Status: `proposed`, `accepted`, `deprecated`, `superseded` (default: `proposed`) |
| `--supersedes <number>` | No | ADR number this decision supersedes |
| `--output <path>` | No | Output directory (default: `docs/adr/`) |

To see the existing records instead, pass `--list`: it shows every ADR with its status.

## Examples

```bash
/adr --title "Adopt GraphQL for client API" --status proposed
/adr --title "Replace MongoDB with PostgreSQL" --supersedes ADR-0003
/adr --list                # Show all ADRs with status
```

## Process

1. **Numbering**
   - Scan existing ADRs in the output directory
   - Assign the next sequential number
   - Format as zero-padded 4 digits: `ADR-0007`

2. **Context Elicitation**
   - Prompt for or analyze the problem context
   - Identify decision drivers (quality attributes, constraints, team skills)
   - Research the codebase for related decisions and patterns

3. **Options Analysis**
   - Identify 2-3 viable options
   - List pros and cons for each
   - Note which decision drivers each option satisfies

4. **Decision Documentation**
   - Write the full MADR-format ADR
   - State the chosen option with justification
   - Document positive, negative, and neutral consequences
   - Link to related ADRs

5. **Index Update**
   - Update `docs/adr/README.md` index with the new ADR

## Output

An ADR file at `docs/adr/ADR-{NUMBER}-{slug}.md`:

```
ADR Created
  Number: ADR-0007
  Title: Use PostgreSQL as Primary Datastore
  Status: Proposed
  Options: 3 evaluated
  Output: docs/adr/ADR-0007-use-postgresql.md
```
## Template: ADR (MADR Format)

```markdown
# ADR-0015: Use CQRS for Reporting Queries

- **Status**: Proposed
- **Date**: 2025-04-01
- **Deciders**: Engineering leads, Product team
- **Supersedes**: N/A

## Context and Problem Statement

Report queries on the `orders` table are causing 5-8 second response times
during peak traffic. The same table handles write-heavy order processing.
We need to serve complex aggregation queries without degrading write throughput.

## Decision Drivers

- P95 report load time must be < 2 seconds
- Write throughput must not decrease below current 500 orders/min
- Solution must be maintainable by a 3-person backend team
- No additional operational complexity for the on-call rotation

## Considered Options

1. Read replicas with query routing
2. CQRS with a separate read model (proposed)
3. Materialized views in PostgreSQL
4. Move reporting to a data warehouse (Redshift/BigQuery)

## Decision Outcome

**Chosen option: CQRS with separate read model**

In the context of reporting query performance degradation, facing the conflict
between read and write workloads on a shared table, we decided for CQRS with
a separate read model, to achieve query isolation and sub-2s report times,
accepting the operational overhead of maintaining event projection workers.

### Consequences

**Positive:**
- Report queries run against a dedicated, optimized read model
- Write path is unaffected by reporting load
- Read model schema can be optimized for specific report shapes

**Negative:**
- Eventual consistency: reports lag writes by ~500ms
- New operational concern: event projection workers must be monitored
- Additional infrastructure: read model store (PostgreSQL read replica or separate DB)

## Options Analysis

| Option | Write Impact | Read Performance | Complexity | Cost |
|--------|-------------|-----------------|------------|------|
| Read replicas | None | Medium | Low | Low |
| CQRS read model | None | High | High | Medium |
| Materialized views | Low | High | Medium | None |
| Data warehouse | None | Very High | High | High |

## Related Decisions

- ADR-0008: Use PostgreSQL as primary datastore
- ADR-0011: Event-driven architecture for order state changes

## Notes

Revisit if the team grows beyond 8 engineers, at which point a dedicated
data engineering function may justify a full data warehouse approach.
```
