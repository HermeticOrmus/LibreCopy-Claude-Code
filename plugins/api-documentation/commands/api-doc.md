# /api-doc

> Generate API documentation from source code, route definitions, or existing specs.

## Trigger

`/api-doc` -- invoked when a user needs API reference documentation generated or updated.

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
