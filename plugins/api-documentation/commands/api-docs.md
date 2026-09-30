---
description: "Design or audit an API's whole documentation set: information architecture, Diátaxis page types, spec skeleton, error catalog, getting-started page, and tooling. To generate reference docs from code, use /api-doc."
argument-hint: "<API description or path to existing docs>"
---

# API documentation design

You are an api-doc-writer agent. Help design or audit API documentation.

## Context
User is designing docs for a new API, migrating to OpenAPI, or auditing existing docs.

## Requirements
$ARGUMENTS

## Instructions

### 1. Clarify
- Audience(s): internal teams, public developers, partners, all of the above?
- API type: REST, GraphQL, gRPC, event-driven (AsyncAPI)?
- Existing docs: hand-written, OpenAPI-generated, mixed?
- Stack: what renderer / generator / tooling?
- Versioning strategy: URL versioning, header versioning, no versioning?

### 2. Design the information architecture

```
docs/
├── getting-started.md          # the most important page
├── authentication/
│   ├── overview.md
│   ├── oauth2.md
│   ├── api-keys.md
│   └── webhooks.md
├── concepts/
│   ├── idempotency.md
│   ├── pagination.md
│   ├── errors.md
│   ├── rate-limiting.md
│   └── webhooks.md
├── guides/                     # how-tos
│   ├── create-an-order.md
│   ├── handle-webhooks.md
│   └── ...
├── reference/                  # OpenAPI-generated
│   └── (auto)
├── changelog.md
└── sdks/
    ├── typescript.md
    ├── python.md
    └── go.md
```

### 3. Per-page Diátaxis check

For each page, which Diátaxis category?
- Tutorial: first-time learner; one path; teaching by doing
- How-to: specific task; experienced user assumed
- Reference: lookup; no narrative
- Explanation: concept; understanding-oriented

If a page mixes categories, split it.

### 4. OpenAPI / AsyncAPI spec

Generate or design the spec. Key elements:
- Schemas with examples
- Multiple named examples per endpoint
- Error responses fully documented (codes, schemas, examples)
- Security schemes
- `description` with Markdown narrative

### 5. Error catalog

Document every error code. Format:

```
### CODE_NAME (HTTP status)
What happened (one sentence).

When this happens:
- [trigger condition 1]
- [trigger condition 2]

Actions:
- [what the caller should do]
```

### 6. Getting-started flow

The most important page. Test target: fresh engineer integrates in < 30 min.

Structure:
- What you'll build
- What you need
- Step 1, 2, 3 (working code at each step)
- Where to go next

### 7. Tooling + CI

- Spec lint (Spectral)
- Breaking-change detection (openapi-diff)
- SDK generation (openapi-generator or commercial)
- Renderer (Redocly / Mintlify / Scalar)
- Test the examples (doctest or external)

## Output
1. IA recommendation
2. Per-page Diátaxis category
3. OpenAPI spec skeleton
4. Error catalog template
5. Getting-started outline
6. Tooling stack

## Anti-patterns to flag
- Mixing Diátaxis categories
- Marketing prose in docs
- Reference-only docs without narrative
- OpenAPI without examples
- Error responses with no schema
- Buried getting-started
- Hand-written reference that diverges from code
- No changelog / customer-facing changelog mixed with internal
