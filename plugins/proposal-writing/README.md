# Proposal Writing Plugin

> Write internal RFCs, Technical Design Documents, and one-pagers that build alignment before work begins. Structured templates for problem-first proposals with concrete alternatives and measurable success criteria.

## Purpose

Produces technical proposals that get approved rather than blocked. Focuses on problem-first structure, substantive alternatives analysis, success metrics defined before implementation, and a review process that surfaces real objections. Covers the full lifecycle from draft through approval to post-implementation status update.

## Agents

| Agent | Role |
|-------|------|
| `proposal-writer` | RFC drafting, TDD/PRD writing, one-pager proposals, review facilitation, status tracking |

## Commands

| Command | Description |
|---------|-------------|
| `/write-proposal draft` | Generate new proposal from problem description |
| `/write-proposal review` | Review for completeness, alternatives depth, metric definition |
| `/write-proposal finalize` | Update status and record decision rationale |
| `/write-proposal track` | List all proposals with their current status |

## Skills

| Skill | Description |
|-------|-------------|
| `proposal-patterns` | Problem-first structure, alternatives quality bar, success metrics, anti-patterns |

## Quick Start

```bash
# Draft an RFC for a major change
/write-proposal draft --type rfc --problem "Session auth blocks horizontal scaling"

# Review existing RFC for completeness
/write-proposal review docs/rfcs/RFC-0023.md --check-alternatives

# Record the final decision
/write-proposal finalize docs/rfcs/RFC-0023.md --status accepted

# List all open RFCs
/write-proposal track --dir docs/rfcs/ --status under-review
```

## Document Type Guide

| Type | Use When | Length |
|------|----------|--------|
| RFC | Major architectural or process change | 2-5 pages |
| TDD | Implementation design for approved feature | 3-8 pages |
| PRD | Product requirements before engineering design | 2-4 pages |
| One-pager | Small decisions, process tweaks, FYI proposals | 1 page |

## RFC Examples in the Wild
- [Rust RFC process and repository](https://github.com/rust-lang/rfcs) - well-structured community RFCs
- [Python PEPs](https://peps.python.org/) - formal specification/proposal format
- [TC39 proposals](https://github.com/tc39/proposals) - JavaScript language proposals
