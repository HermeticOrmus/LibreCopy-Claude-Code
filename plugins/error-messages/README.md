# Error Messages Plugin

> Design error message systems following RFC 7807 Problem Details. Build error catalogs, document error codes, and ensure errors tell users what happened, why, and what to do next.

## Purpose

Transforms vague error messages into clear, actionable, standards-compliant error responses. Covers RFC 7807/9457 Problem Details for HTTP APIs, error code hierarchy design, user-facing vs developer-facing error separation, validation error formatting, and localization-ready string design.

## Agents

| Agent | Role |
|-------|------|
| `error-message-writer` | RFC 7807 error responses, error code systems, per-field validation errors, audit of existing error messages |

## Commands

| Command | Description |
|---------|-------------|
| `/doc-errors catalog` | Generate or update the error catalog document |
| `/doc-errors generate` | Generate RFC 7807-compliant error response objects |
| `/doc-errors test` | Validate existing error responses against RFC 7807 |
| `/doc-errors localize` | Extract error strings for localization |

## Skills

| Skill | Description |
|-------|-------------|
| `error-message-patterns` | Three-part error anatomy, RFC 7807 structure, HTTP status code semantics, anti-patterns |

## Quick Start

```bash
# Review existing error responses
/doc-errors test --api-url https://api.example.com --endpoint /users/nonexistent

# Generate an RFC 7807 error response
/doc-errors generate --code CARD_DECLINED --status 402

# Build error catalog from source
/doc-errors catalog --from-source ./src --output docs/errors.md

# Extract strings for i18n
/doc-errors localize --source ./src --output ./i18n/errors.json
```

## When to Use

- Designing error responses for a new API before implementation
- Auditing existing API error messages for RFC 7807 compliance
- Building an error catalog page for developer documentation
- Reviewing error messages for information leakage (stack traces, SQL)
- Preparing error strings for localization

## Standards Reference

| Standard | Scope |
|----------|-------|
| [RFC 7807](https://datatracker.ietf.org/doc/html/rfc7807) | Problem Details for HTTP APIs |
| [RFC 9457](https://datatracker.ietf.org/doc/html/rfc9457) | Updates to RFC 7807 |
| [HTTP Status Codes](https://httpstatuses.io/) | Status code semantics |
| [gRPC Status Codes](https://grpc.io/docs/guides/status-codes/) | gRPC error taxonomy |
