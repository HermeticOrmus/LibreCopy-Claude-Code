# API Documentation Plugin

> Author, validate, and publish API reference documentation. Covers OpenAPI 3.x/AsyncAPI specs, SDK docs, and code sample generation.

## Purpose

Produces standards-compliant API documentation from code, route definitions, or scratch. Treats the OpenAPI spec as a living contract between frontend, backend, and SDK consumers. Integrates with Redoc, Swagger UI, Scalar, Stoplight Studio, and Spectral for linting.

## Agents

| Agent | Role |
|-------|------|
| `api-doc-specialist` | OpenAPI 3.x/AsyncAPI spec authoring, validation, Redoc/Scalar publishing, SDK documentation, code sample generation |

## Commands

| Command | Description |
|---------|-------------|
| `/doc-api generate` | Generate OpenAPI spec from source code, Postman collection, or skeleton |
| `/doc-api validate` | Lint spec against OpenAPI rules + custom Spectral ruleset |
| `/doc-api publish` | Build rendered HTML docs for deployment (Redoc or Scalar) |
| `/doc-api diff` | Compare two spec versions, identify breaking vs non-breaking changes |

## Skills

| Skill | Description |
|-------|-------------|
| `openapi-patterns` | OpenAPI 3.1 spec structure, schema design, polymorphism, auth schemes, pagination |
| `api-doc-patterns` | Operation documentation, response coverage, x-codeSamples, anti-patterns |

## Quick Start

```bash
# Validate an existing spec
/doc-api validate ./docs/openapi.yaml --format pretty

# Generate spec skeleton for a new API
/doc-api generate --skeleton --title "Payments API" --version 1.0.0

# Build Redoc HTML docs
/doc-api publish ./docs/openapi.yaml --renderer redoc --output ./dist/docs

# Diff two versions before release
/doc-api diff ./docs/openapi-v1.yaml ./docs/openapi-v2.yaml --format markdown
```

## When to Use

- Spec-first API design before implementation begins
- Retroactively documenting an existing undocumented API
- Enforcing consistent documentation standards across a team
- Generating SDK documentation for multiple client languages
- Detecting breaking changes before a release
- Setting up automated validation in CI (Spectral + Redocly CLI)

## Tooling Reference

| Tool | Purpose |
|------|---------|
| [Redocly CLI](https://redocly.com/docs/cli/) | Lint, bundle, and build docs from OpenAPI |
| [Spectral](https://stoplight.io/open-source/spectral) | Custom linting rules for OpenAPI/AsyncAPI |
| [Scalar](https://scalar.com/) | Modern API reference UI with try-it-out |
| [Stoplight Studio](https://stoplight.io/studio) | GUI editor with git sync |
| [OpenAPI Generator](https://openapi-generator.tech/) | SDK generation from specs |
| [Schemathesis](https://schemathesis.readthedocs.io/) | Property-based API testing from specs |
