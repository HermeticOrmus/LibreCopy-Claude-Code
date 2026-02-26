# /doc-errors

Build and maintain an error catalog, generate error documentation, and audit existing error messages.

## Trigger

`/doc-errors <action> [options]`

## Actions

### `catalog`
Generate or update the error catalog document.

```bash
/doc-errors catalog --output docs/errors.md
/doc-errors catalog --from-source ./src --scan-errors
/doc-errors catalog --format openapi --output components/errors.yaml
```

### `generate`
Generate RFC 7807-compliant error response objects and documentation.

```bash
/doc-errors generate --code CARD_DECLINED --status 402
/doc-errors generate --from-http 422 --field-errors
/doc-errors generate --batch ./errors.yaml
```

### `test`
Validate existing error responses against RFC 7807 and team conventions.

```bash
/doc-errors test --response '{"error": "Not found"}' --standard rfc7807
/doc-errors test --api-url https://api.example.com --endpoint /users/nonexistent
```

### `localize`
Extract error message strings for localization.

```bash
/doc-errors localize --source ./src --output ./i18n/errors.json
/doc-errors localize --validate ./i18n/errors.es.json --against ./i18n/errors.json
```

## Options

| Option | Description |
|--------|-------------|
| `--output <path>` | Output file path |
| `--from-source <path>` | Scan source code for error definitions |
| `--format <type>` | markdown, json, openapi, yaml |
| `--status <code>` | HTTP status code |
| `--standard <name>` | rfc7807, rfc9457, graphql |
| `--field-errors` | Include per-field validation error structure |

## RFC 7807 Problem Details Template

```json
{
  "type": "https://api.example.com/errors/{error-slug}",
  "title": "[Short human-readable summary, same for all occurrences]",
  "status": 422,
  "detail": "[Human-readable explanation specific to this occurrence]",
  "instance": "/[resource-path]/[resource-id]",
  "error_id": "[Unique ID for this occurrence, traceable in logs]",
  "help_url": "https://docs.example.com/errors/{error-slug}"
}
```

**Field meanings**:
- `type`: URI that identifies the problem type (links to docs page about this error)
- `title`: Same for all occurrences of this type (use for programmatic display)
- `detail`: Different per occurrence (includes context: which field, which value)
- `instance`: URI identifying this specific occurrence (the request URL or resource)
- `error_id`: Random ID for log correlation (not guessable, not sequential)

## Validation Error Extension

```json
{
  "type": "https://api.example.com/errors/validation-failed",
  "title": "Validation Failed",
  "status": 422,
  "detail": "The request contains invalid fields.",
  "errors": [
    {
      "field": "email",
      "code": "INVALID_FORMAT",
      "message": "Must be a valid email address (e.g., user@example.com)"
    },
    {
      "field": "birth_date",
      "code": "UNDERAGE",
      "message": "You must be at least 18 years old to register"
    }
  ]
}
```

## Error Catalog Template (Markdown)

```markdown
# Error Reference

All errors follow [RFC 7807 Problem Details](https://datatracker.ietf.org/doc/html/rfc7807).
Use the `error_id` field to correlate errors with your support team.

## Authentication Errors (401, 403)

### AUTH_TOKEN_EXPIRED
**HTTP Status**: 401
**When it occurs**: The Bearer token in the Authorization header has expired.
**User message**: "Your session has expired. Please sign in again."
**Resolution**: Obtain a new token via `POST /auth/token` with your refresh token.

### AUTH_INSUFFICIENT_SCOPE
**HTTP Status**: 403
**When it occurs**: The token is valid but lacks the required scope for this operation.
**User message**: "You don't have permission to perform this action."
**Developer detail**: Required scope is in the `required_scope` field of the response.

## Validation Errors (422)

### VALIDATION_REQUIRED_FIELD
**HTTP Status**: 422
**When it occurs**: A required field is missing from the request body.
**User message**: "The field '[field]' is required."
**Resolution**: Include the missing field in your request.
```

## HTTP Status Code Decision Guide

```
400 Bad Request       → Request is malformed (invalid JSON, wrong content type)
401 Unauthorized      → Missing or invalid authentication credentials
402 Payment Required  → Payment failed, account suspended due to billing
403 Forbidden         → Authenticated but not authorized for this resource/action
404 Not Found         → Resource does not exist or user cannot see it
409 Conflict          → State conflict (duplicate creation, version mismatch)
410 Gone              → Resource existed but has been permanently deleted
422 Unprocessable     → Request is valid JSON but fails business validation
429 Too Many Requests → Rate limit exceeded
500 Internal Server   → Unexpected error (should be rare and investigated)
503 Service Unavail   → Temporary downtime, include Retry-After header
```
