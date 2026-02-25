# API Documentation Plugin

> Generate comprehensive API documentation from code, including OpenAPI/Swagger specs and SDK client library documentation.

## Purpose

Transforms raw API endpoints, schemas, and code into structured, standards-compliant API documentation. Covers both machine-readable specs (OpenAPI 3.x) and human-readable SDK guides.

## Agents

| Agent | Role |
|-------|------|
| `api-doc-writer` | Generates OpenAPI/Swagger specifications and REST API reference docs |
| `sdk-doc-generator` | Creates client library documentation with code examples across languages |

## Commands

| Command | Description |
|---------|-------------|
| `/api-doc` | Generate API documentation from source code or route definitions |

## Skills

| Skill | Description |
|-------|-------------|
| `openapi-patterns` | OpenAPI 3.x specification patterns, schema design, and documentation conventions |

## Usage

```
/api-doc --format openapi --source ./src/routes
/api-doc --format markdown --endpoints /users /products /orders
```

## When to Use

- Starting a new API project and need spec-first documentation
- Retroactively documenting an existing API
- Generating SDK documentation for multiple client languages
- Ensuring API docs stay in sync with implementation
