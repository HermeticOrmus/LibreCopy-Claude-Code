# /write-proposal

Draft, review, finalize, and track technical proposals and RFCs.

## Trigger

`/write-proposal <action> [options]`

## Actions

### `draft`
Generate a new proposal from problem description.

```bash
/write-proposal draft --type rfc --problem "Auth system is stateful, limits horizontal scaling"
/write-proposal draft --type tdd --feature "Add webhook signature verification"
/write-proposal draft --type one-pager --decision "Switch CI from CircleCI to GitHub Actions"
```

### `review`
Review an existing proposal for completeness and clarity.

```bash
/write-proposal review docs/rfcs/RFC-0023.md
/write-proposal review docs/rfcs/RFC-0023.md --check-alternatives --check-metrics
```

### `finalize`
Update proposal status and add decision rationale after review period.

```bash
/write-proposal finalize docs/rfcs/RFC-0023.md --status accepted --decision "Chosen approach A"
/write-proposal finalize docs/rfcs/RFC-0023.md --status rejected --reason "Security team blocked"
```

### `track`
List all proposals with their status.

```bash
/write-proposal track --dir docs/rfcs/
/write-proposal track --status under-review
/write-proposal track --status accepted --since 2025-01-01
```

## Options

| Option | Description |
|--------|-------------|
| `--type <type>` | rfc, tdd, prd, one-pager |
| `--problem <text>` | Problem description to frame the proposal |
| `--feature <text>` | Feature name (for TDD) |
| `--status <status>` | proposed, under-review, accepted, rejected, implemented |
| `--dir <path>` | Directory containing proposal files |
| `--check-alternatives` | Verify alternatives section exists and has depth |

## Internal RFC Template

```markdown
# RFC-NNNN: [Descriptive Title]

| Field | Value |
|-------|-------|
| **Status** | Proposed |
| **Created** | YYYY-MM-DD |
| **Author** | [Name] ([email]) |
| **Reviewers** | [Names and roles] |
| **Review Deadline** | YYYY-MM-DD |
| **Related** | [Links to related RFCs, issues, ADRs] |

## Summary

[2-3 sentences: the problem, the proposed solution, and the expected benefit.
This is the only section all reviewers will read - make it count.]

## Problem Statement

Currently, [current state that creates the problem]. This results in:

- [Concrete impact 1 - quantify if possible]
- [Concrete impact 2]

The problem is becoming more severe because [why this needs solving now].

## Proposed Solution

[Describe the proposed approach at the level of "what" not "how".
Save implementation details for the Implementation Plan section.]

### Design Principles

The solution should:
- [Principle 1: e.g., "not require downtime during migration"]
- [Principle 2]

## Alternatives Considered

| Option | Summary | Pros | Cons | Verdict |
|--------|---------|------|------|---------|
| **Proposed** | [1-line description] | [key benefit] | [key cost] | **Chosen** |
| Option B | [1-line description] | [key benefit] | [key cost] | Rejected: [reason] |
| Option C | [1-line description] | [key benefit] | [key cost] | Rejected: [reason] |
| Status quo | Continue current approach | No migration | [why insufficient] | Rejected |

## Implementation Plan

### Phase 1: [Description] (Est: [time])
- [ ] [Concrete task]
- [ ] [Concrete task]

### Phase 2: [Description] (Est: [time])
- [ ] [Concrete task]

### Rollout Strategy
[How will this be deployed? Incremental? Feature flag? Big bang?]

### Rollback Plan
[How do we undo this if it goes wrong? What is the recovery time?]

## Success Metrics

| Metric | Current | Target | Measure By |
|--------|---------|--------|-----------|
| [Metric name] | [Current value] | [Target value] | [How to measure] |

## Security and Privacy Considerations

[What are the security implications? What data is affected?]

## Operational Considerations

[What is the operational burden? On-call impact? Monitoring changes?]

## Open Questions

- [ ] [Question that needs stakeholder input]
- [ ] [Question that needs investigation]

## References

- [Links to relevant RFCs, blog posts, external documentation]

---
*Review by [date]. Comment or approve below.*
```

## Review Checklist

```markdown
# RFC Review Checklist

Before approving, verify:

**Problem statement**
- [ ] Problem is clearly defined (not a solution in disguise)
- [ ] Impact is concrete and specific (ideally quantified)
- [ ] Urgency is explained (why now?)

**Proposed solution**
- [ ] Solution is described at appropriate abstraction level
- [ ] Technical approach is sound
- [ ] Design principles are clear

**Alternatives**
- [ ] At least 2 alternatives considered (including status quo)
- [ ] Rejection reasons are substantive, not superficial
- [ ] The chosen option's cons are acknowledged

**Success metrics**
- [ ] Metrics are measurable, not vague
- [ ] Targets are realistic given constraints
- [ ] Measurement method is defined

**Risk and reversibility**
- [ ] Rollback plan exists
- [ ] Risks are identified and mitigated or accepted
- [ ] Security implications addressed

**Operational**
- [ ] On-call/ops burden assessed
- [ ] Monitoring/alerting changes planned
```
