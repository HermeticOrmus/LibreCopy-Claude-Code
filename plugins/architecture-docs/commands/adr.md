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
