---
description: "Generate API reference docs (OpenAPI 3.1 plus Markdown) from the routes and types in the code, or validate, publish, or diff an OpenAPI spec."
argument-hint: "[generate|validate|publish|diff] [--source path] [--output path]"
---

# /api-doc

> Generate API documentation from source code, route definitions, or existing specs.

It also validates, publishes, and diffs OpenAPI specs.

## Trigger

`/api-doc` -- invoked when a user needs API reference documentation generated or updated.

`/api-doc <action> [options]`

With no action, `/api-doc` runs `generate`: the full discovery, extraction, generation, validation, and output process below.

## Actions

### `generate`
Generate OpenAPI spec from existing code or produce a spec skeleton.

```bash
/api-doc generate --source ./src/routes --output ./docs/openapi.yaml
/api-doc generate --from-postman ./collection.json --output ./openapi.yaml
/api-doc generate --skeleton --title "Payments API" --version 1.0.0
```

### `validate`
Lint the spec against OpenAPI rules and custom Spectral ruleset.

```bash
/api-doc validate ./docs/openapi.yaml
/api-doc validate ./docs/openapi.yaml --ruleset .spectral.yaml --format pretty
```

### `publish`
Build rendered docs (Redoc or Swagger UI) for deployment.

```bash
/api-doc publish ./docs/openapi.yaml --renderer redoc --output ./dist/docs
/api-doc publish ./docs/openapi.yaml --renderer scalar --base-url /api/docs
```

### `diff`
Compare two spec versions and produce a changelog of breaking vs non-breaking changes.

```bash
/api-doc diff v1.0.0 v1.1.0 ./docs/openapi.yaml
/api-doc diff ./docs/openapi-old.yaml ./docs/openapi-new.yaml --format markdown
```

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--source <path>` | No | Path to route files, controllers, or existing OpenAPI spec |
| `--format <type>` | No | Output format: `openapi`, `markdown`, `both` (default: `both`) |
| `--endpoints <paths>` | No | Specific endpoints to document (space-separated) |
| `--version <semver>` | No | API version to use in spec (default: read from package.json) |
| `--output <path>` | No | Output file path (default: `./docs/api/`) |
| `--auth <type>` | No | Authentication type: `bearer`, `apikey`, `oauth2`, `none` |

If no flags are provided, the command scans the project root for common API frameworks (Express, Fastify, Hono, FastAPI, Gin, Axum) and auto-detects routes.

## Options for validate, publish, and diff

| Option | Description |
|--------|-------------|
| `--source <path>` | Source code directory to analyze |
| `--output <path>` | Output file or directory |
| `--renderer <name>` | redoc, swagger-ui, scalar (default: redoc) |
| `--ruleset <path>` | Custom Spectral ruleset file |
| `--format <type>` | Output format: yaml, json, markdown, html |
| `--base-url <url>` | Base URL prefix for published docs |

## Process

1. **Discovery Phase**
   - Scan project for API framework (check dependencies, imports, file structure)
   - Identify route registration patterns (decorators, router methods, handler functions)
   - Locate request/response type definitions (interfaces, schemas, models)
   - Find existing OpenAPI specs to update rather than recreate

2. **Extraction Phase**
   - Parse each route: method, path, path parameters, query parameters
   - Extract request body schemas from validation (Zod, Joi, Pydantic, etc.)
   - Determine response shapes from return types or explicit response builders
   - Identify middleware (auth, rate limiting, CORS) affecting each endpoint
   - Map error responses from error handling middleware

3. **Generation Phase**
   - Build OpenAPI 3.1 spec with all discovered endpoints
   - Generate component schemas from extracted types
   - Add security schemes based on auth middleware
   - Create realistic example values for all schemas
   - Write human-readable descriptions for each operation

4. **Validation Phase**
   - Lint generated OpenAPI spec against spectral rules
   - Verify all $ref references resolve correctly
   - Check that every path has at least one response defined
   - Ensure examples match their schemas

5. **Output Phase**
   - Write OpenAPI YAML to specified output path
   - Generate markdown reference if format includes markdown
   - Report summary: endpoints documented, schemas created, warnings

## Output

### Files Created

```
docs/api/
  openapi.yaml          # OpenAPI 3.1 specification
  reference.md          # Human-readable API reference
  schemas/              # Individual schema files (if large API)
```

### Console Summary

```
API Documentation Generated
  Endpoints: 24 documented
  Schemas: 15 component schemas
  Auth: Bearer (JWT) on 22/24 endpoints
  Warnings: 2 endpoints missing response descriptions
  Output: docs/api/openapi.yaml, docs/api/reference.md
```

### Markdown Reference Format

Each endpoint renders as:

```markdown
## GET /users/{id}

Retrieve a user by their unique identifier.

**Authentication**: Required (Bearer token)

### Parameters

| Name | In | Type | Required | Description |
|------|------|------|----------|-------------|
| `id` | path | string | Yes | User's unique identifier |
| `include` | query | string | No | Comma-separated related resources to include |

### Responses

| Status | Description |
|--------|-------------|
| `200` | User found |
| `404` | User not found |
| `401` | Unauthorized |

### Example

Request:
\`\`\`bash
curl -X GET https://api.example.com/v1/users/usr_abc123 \
  -H "Authorization: Bearer $TOKEN"
\`\`\`

Response (200):
\`\`\`json
{
  "id": "usr_abc123",
  "email": "user@example.com",
  "name": "Jane Developer",
  "created_at": "2025-01-15T10:30:00Z"
}
\`\`\`
```
## Output examples: validate and diff

### `validate` output
```
Validating ./docs/openapi.yaml against OpenAPI 3.1...

ERRORS (2) - must fix:
  [paths./users.post.responses] Missing 422 response for operation with requestBody
  [components.schemas.Order.properties.status] enum values undocumented (no description)

WARNINGS (3) - should fix:
  [paths./users.get] Missing operationId
  [paths./products/{id}.get.parameters] Path param 'id' has no example
  [info] No contact.url defined

SUGGESTIONS (1):
  Consider adding x-codeSamples to /users.post for curl + JS examples

Result: INVALID - fix 2 errors before publishing
```

### `diff` output (markdown)
```markdown
## API Changes: v1.0.0 → v1.1.0

### Breaking Changes
- `DELETE /users/{id}` removed (was deprecated in v1.0.0)
- `GET /orders` response: `meta.total` renamed to `meta.total_count`

### New Endpoints
- `GET /users/{id}/sessions` - List active sessions for a user
- `DELETE /users/{id}/sessions/{session_id}` - Revoke a session

### Non-Breaking Changes
- `POST /orders` now accepts optional `metadata` object
- All endpoints: added `X-Request-Id` to response headers schema
```

## Template: OpenAPI info block

```yaml
openapi: 3.1.0
info:
  title: Acme Payments API
  version: 2.1.0
  description: |
    Process payments, manage subscriptions, and retrieve transaction history.

    ## Authentication
    All endpoints require a Bearer token obtained via `POST /auth/token`.

    ## Rate Limits
    1000 requests/minute per API key. Rate limit headers returned on every response.

    ## Versioning
    Breaking changes increment the major version. The URL prefix `/v2/` will remain
    stable for the lifetime of this major version.
  contact:
    name: API Support
    url: https://developers.acme.com/support
    email: api@acme.com
  license:
    name: Apache 2.0
    url: https://www.apache.org/licenses/LICENSE-2.0
servers:
  - url: https://api.acme.com/v2
    description: Production
  - url: https://api.sandbox.acme.com/v2
    description: Sandbox (no real charges)
```
