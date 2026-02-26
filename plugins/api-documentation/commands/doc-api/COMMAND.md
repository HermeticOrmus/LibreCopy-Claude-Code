# /doc-api

Generate, validate, publish, and diff API documentation from OpenAPI specs.

## Trigger

`/doc-api <action> [options]`

## Actions

### `generate`
Generate OpenAPI spec from existing code or produce a spec skeleton.

```bash
/doc-api generate --source ./src/routes --output ./docs/openapi.yaml
/doc-api generate --from-postman ./collection.json --output ./openapi.yaml
/doc-api generate --skeleton --title "Payments API" --version 1.0.0
```

### `validate`
Lint the spec against OpenAPI rules and custom Spectral ruleset.

```bash
/doc-api validate ./docs/openapi.yaml
/doc-api validate ./docs/openapi.yaml --ruleset .spectral.yaml --format pretty
```

### `publish`
Build rendered docs (Redoc or Swagger UI) for deployment.

```bash
/doc-api publish ./docs/openapi.yaml --renderer redoc --output ./dist/docs
/doc-api publish ./docs/openapi.yaml --renderer scalar --base-url /api/docs
```

### `diff`
Compare two spec versions and produce a changelog of breaking vs non-breaking changes.

```bash
/doc-api diff v1.0.0 v1.1.0 ./docs/openapi.yaml
/doc-api diff ./docs/openapi-old.yaml ./docs/openapi-new.yaml --format markdown
```

## Options

| Option | Description |
|--------|-------------|
| `--source <path>` | Source code directory to analyze |
| `--output <path>` | Output file or directory |
| `--renderer <name>` | redoc, swagger-ui, scalar (default: redoc) |
| `--ruleset <path>` | Custom Spectral ruleset file |
| `--format <type>` | Output format: yaml, json, markdown, html |
| `--base-url <url>` | Base URL prefix for published docs |

## Output Examples

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
