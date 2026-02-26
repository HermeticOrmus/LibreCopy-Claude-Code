# Developer Guides Plugin

> Write getting-started guides, tutorials, how-tos, and integration documentation following the Diátaxis framework. Produce guides that developers can actually follow to completion.

## Purpose

Creates developer-facing documentation that maps to user needs via the Diátaxis framework: tutorials for learning, how-tos for task completion, references for lookup, and explanations for understanding. Emphasizes runnable code examples, expected output blocks, and prerequisite tables. Supports Docusaurus, MkDocs, Mintlify, and GitBook.

## Agents

| Agent | Role |
|-------|------|
| `devguide-writer` | Getting started guides, tutorials, how-tos, integration docs, Diátaxis compliance review |

## Commands

| Command | Description |
|---------|-------------|
| `/doc-guide create` | Generate a new guide from type and description |
| `/doc-guide review` | Review for Diátaxis compliance and content type mixing |
| `/doc-guide test` | Verify guide commands and links work |
| `/doc-guide publish` | Build and publish to target platform |

## Skills

| Skill | Description |
|-------|-------------|
| `developer-guide-patterns` | Developer journey mapping, getting started anatomy, contributing guide structure |
| `devguide-patterns` | Diátaxis in practice, code example best practices, prerequisite tables, expected output |

## Quick Start

```bash
# Create a getting started guide
/doc-guide create --type getting-started --project "Python HTTP client"

# Create a how-to guide
/doc-guide create --type how-to --task "configure OAuth with GitHub"

# Review existing guide for type mixing
/doc-guide review docs/getting-started.md --check-type-mixing

# Test guide commands
/doc-guide test docs/getting-started.md --validate-links
```

## When to Use

- Writing the first developer documentation for a new library or API
- Migrating existing unstructured guides into Diátaxis-compliant content
- Reviewing a guide that users say is confusing or incomplete
- Creating an integration guide for a third-party service
- Setting up a docs site with Docusaurus or MkDocs

## Tooling Reference

| Tool | Purpose |
|------|---------|
| [Docusaurus 3](https://docusaurus.io/) | React-based docs site, versioning, MDX |
| [MkDocs Material](https://squidfunk.github.io/mkdocs-material/) | Python docs, rich admonitions |
| [Mintlify](https://mintlify.com/) | API-first docs, OpenAPI integration |
| [StackBlitz](https://stackblitz.com/) | Embedded interactive examples |
| [Killercoda](https://killercoda.com/) | Browser-based terminal for CLI tutorials |
| [Diátaxis](https://diataxis.fr/) | Framework reference by Daniele Procida |
