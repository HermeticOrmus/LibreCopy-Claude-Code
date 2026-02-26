# Specification Writing Plugin

> Write technical specifications, requirements documents, and interface contracts that two engineers can implement independently and produce compatible systems.

## Purpose

A specification is only valuable if it removes ambiguity, not adds it. This plugin produces specifications that are testable (every requirement has an acceptance criterion), complete (error cases and non-requirements explicitly stated), and unambiguous (SMART requirements, state machines for stateful systems, full interface contracts for system boundaries).

Covers functional specs, interface contracts, RFC format, state machine documentation, and requirements review for testability.

## Agents

| Agent | Role |
|-------|------|
| `spec-writer` | Functional specs, interface contracts, RFCs, state machines, requirements review |

## Commands

| Command | Description |
|---------|-------------|
| `/write-spec draft` | Generate a specification from a feature description |
| `/write-spec review` | Analyze spec for completeness, testability, and ambiguity |
| `/write-spec derive` | Generate test cases or acceptance criteria from a spec |
| `/write-spec validate` | Check spec against SMART criteria and completeness |

## Skills

| Skill | Description |
|-------|-------------|
| `spec-writing-patterns` | Testability test, Gherkin criteria, interface contracts, state machines, anti-patterns |

## Quick Start

```bash
# Write a functional specification for a feature
/write-spec draft --type functional --feature "User authentication with MFA"

# Specify an interface between two services
/write-spec draft --type interface --from payment-service --to order-service

# Draft an RFC for a team decision
/write-spec draft --type rfc --problem "Session auth prevents horizontal scaling"

# Review spec for quality issues
/write-spec review docs/specs/auth-spec.md --check-testability --check-completeness

# Generate test cases from a spec
/write-spec derive test-cases docs/specs/auth-spec.md
```

## Specification Quality Criteria

Every spec this plugin generates satisfies:

- [ ] All requirements use "shall" (mandatory) or "should" (recommended), never vague language
- [ ] Every requirement has a testable acceptance criterion (Gherkin format)
- [ ] Non-functional requirements have quantified targets (not "fast" but "≤ 200ms p99")
- [ ] Scope section explicitly lists what is out of scope
- [ ] All stateful features have an explicit state machine with prohibited transitions
- [ ] Interface contracts specify both sides' obligations (retry, idempotency, error handling)
- [ ] Error cases are specified (not just the happy path)
- [ ] Open questions have owners and deadlines

## Requirement Types

| Type | Format | Use When |
|------|--------|----------|
| Functional | "The system shall [behavior] when [condition]" | Feature behavior |
| Non-functional | Metric + target + measurement method | Performance, reliability, security |
| Interface | Full request/response contract + error cases | System integration points |
| State | State machine with explicit transitions | Anything with status/lifecycle |
| Acceptance | Gherkin Given/When/Then | QA-driven development |
