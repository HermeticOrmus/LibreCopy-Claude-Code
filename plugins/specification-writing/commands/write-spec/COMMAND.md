# /write-spec

Write technical specifications, requirements documents, and interface contracts.

## Trigger

`/write-spec <action> [options]`

## Actions

### `draft`
Generate a new specification from a feature description or problem statement.

```bash
/write-spec draft --type functional --feature "User authentication"
/write-spec draft --type interface --from payment-service --to order-service
/write-spec draft --type rfc --problem "Session auth prevents horizontal scaling"
/write-spec draft --type state-machine --entity Order --states pending,paid,fulfilled,cancelled
```

### `review`
Analyze an existing specification for completeness, testability, and ambiguity.

```bash
/write-spec review docs/specs/auth-spec.md
/write-spec review docs/specs/auth-spec.md --check-testability --check-completeness
```

### `derive`
Generate artifacts from an existing specification.

```bash
/write-spec derive test-cases docs/specs/auth-spec.md
/write-spec derive acceptance-criteria docs/specs/auth-spec.md
/write-spec derive openapi docs/specs/payment-api-spec.md
```

### `validate`
Check a specification against quality criteria.

```bash
/write-spec validate docs/specs/auth-spec.md
/write-spec validate docs/specs/ --check-smart --check-open-questions
```

## Options

| Option | Description |
|--------|-------------|
| `--type <type>` | functional, technical, interface, api, rfc, state-machine, srs |
| `--feature <text>` | Feature or component being specified |
| `--problem <text>` | Problem statement (for RFC type) |
| `--from <service>` | Source service (for interface specs) |
| `--to <service>` | Target service (for interface specs) |
| `--check-testability` | Flag requirements that cannot be tested |
| `--check-completeness` | Flag missing sections |

## Functional Specification Template

```markdown
# [Feature Name] Specification

| Field | Value |
|-------|-------|
| **Status** | Draft / Review / Approved |
| **Author** | [Name] |
| **Reviewers** | [Names] |
| **Version** | 1.0 |
| **Date** | YYYY-MM-DD |

## Context

[Why are we building this? What user need or business goal does it address?
Link to product brief, user research, or OKR.]

## Scope

**In scope**: [What this spec covers]
**Out of scope**: [What is explicitly NOT included -- prevents scope creep]

## User Stories

| As a | I want to | So that |
|------|-----------|---------|
| [user type] | [action] | [benefit] |

## Functional Requirements

### FR-001: [Requirement Name]

**Requirement**: [System shall] [do something] [measurable condition].

**Acceptance Criteria**:
```
Given [initial state]
When [action is taken]
Then [expected outcome]
```

**Priority**: Must-have / Should-have / Nice-to-have
**Notes**: [Edge cases, dependencies, open questions]

---

### FR-002: [Next Requirement]

[Pattern repeats]

## Non-Functional Requirements

| Requirement | Metric | Target | Measurement Method |
|-------------|--------|--------|-------------------|
| Response time | p99 latency | ≤ 200ms | Load test at peak RPS |
| Availability | Uptime | 99.9% | 30-day rolling average |
| Error rate | 5xx responses | < 0.1% | Production monitoring |

## Error Cases

| Scenario | Expected Behavior | Error Code |
|----------|------------------|------------|
| [What goes wrong] | [What the system does] | [HTTP/error code] |

## Open Questions

- [ ] **[Owner]**: [Question that must be resolved before implementation]
  Context: [Why this matters]
  Decision needed by: [Date]

## Appendix: Glossary

| Term | Definition |
|------|-----------|
| [Term] | [Definition as used in this spec] |
```

## Interface Specification Template

```markdown
# Interface Spec: [Service A] → [Service B]

## Overview

**Purpose**: [What this interface does / why it exists]
**Direction**: [Service A] calls [Service B]
**Protocol**: REST / gRPC / message queue / event

## Endpoint

`POST /path/to/endpoint`

**Authentication**: [Bearer token, service account, mTLS]
**Authorization**: Caller must have [permission]

## Request

```json
{
  "field": "value",   // type, required/optional, constraints
  "amount": 4999,     // integer cents, required, must be > 0
  "currency": "USD"   // ISO 4217, required
}
```

## Response: Success

**Status**: 200 OK / 201 Created / 202 Accepted

```json
{
  "id": "resource_id",
  "status": "confirmed"
}
```

## Response: Error Cases

| Status | Error Code | When |
|--------|-----------|------|
| 400 | INVALID_AMOUNT | amount ≤ 0 or non-integer |
| 404 | ORDER_NOT_FOUND | orderId does not exist |
| 409 | ALREADY_CONFIRMED | order is already in confirmed state |
| 422 | CURRENCY_MISMATCH | currency does not match order currency |

## Retry Contract

| Caller obligation | Behavior |
|------------------|---------|
| On 5xx | Retry with exponential backoff, max 3 attempts |
| On 4xx | Do not retry. Log and alert. |
| On timeout | Treat as 5xx. Retry. |
| On 409 | Idempotent success. Do not retry. |

## Idempotency

Calls are idempotent by [orderId / Idempotency-Key header].
Repeated calls with the same key return the same response.
```

## Review Output

```
Spec Review: auth-spec.md

REQUIREMENTS QUALITY:
  [✓] FR-001: Testable (clear acceptance criteria)
  [✗] FR-003: Untestable - "system should be fast" has no measurable threshold
  [✗] FR-007: Ambiguous - "recent" not defined (last 24h? last 7d? last login?)

COMPLETENESS:
  [✓] User stories present
  [✗] Missing: Error cases section
  [✗] Missing: Non-functional requirements
  [✓] Scope explicitly defined

OPEN QUESTIONS:
  [✗] 3 open questions have no assigned owner
  [✗] 1 open question is past its decision deadline

RESULT: 5 issues. Priority: Define measurable threshold for FR-003.
```
