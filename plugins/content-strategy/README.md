# Content Strategy Plugin

> Plan, audit, and structure technical documentation. Apply Diátaxis content types, ROT analysis, and information architecture principles to developer docs.

## Purpose

Provides strategic tooling for documentation systems: content auditing to identify what needs updating or archiving, information architecture design to organize content around user goals, and measurement frameworks for tracking documentation health. Covers both docs-as-code systems (Docusaurus, MkDocs) and hosted platforms (GitBook, Mintlify).

## Agents

| Agent | Role |
|-------|------|
| `content-strategist` | Content auditing (ROT analysis), IA design, Diátaxis mapping, versioning strategy, metrics planning |

## Commands

| Command | Description |
|---------|-------------|
| `/content-plan audit` | ROT analysis and gap analysis of existing docs |
| `/content-plan structure` | Design or review information architecture |
| `/content-plan roadmap` | Create prioritized content roadmap from audit findings |
| `/content-plan measure` | Generate documentation measurement plan |

## Skills

| Skill | Description |
|-------|-------------|
| `content-strategy-patterns` | Diátaxis quadrants, ROT analysis, navigation principles, versioning strategies, metrics |

## Quick Start

```bash
# Audit existing documentation
/content-plan audit --dir ./docs --output audit-results.md

# Design navigation for a new docs site
/content-plan structure --describe "API tool with developers and admins as users"

# Create a content roadmap
/content-plan roadmap --from audit-results.md --quarters 2

# Set up measurement for a Docusaurus site
/content-plan measure --platform docusaurus --analytics ga4
```

## When to Use

- Starting a new documentation site and need to design the information architecture
- Existing docs have grown organically and need a structural audit
- Pre-launch checklist: what content gaps exist before shipping?
- Quarterly review: which articles need updating, which should be archived?
- Migrating between documentation platforms
- Establishing docs health metrics for a team

## Tooling Reference

| Tool | Purpose |
|------|---------|
| [Docusaurus 3](https://docusaurus.io/) | React-based docs site with versioning |
| [MkDocs Material](https://squidfunk.github.io/mkdocs-material/) | Python-based, rich navigation |
| [Mintlify](https://mintlify.com/) | API-first docs hosting |
| [Backstage TechDocs](https://backstage.io/docs/features/techdocs/) | Internal developer portal |
| [Algolia DocSearch](https://docsearch.algolia.com/) | Search with analytics |
| [Vale](https://vale.sh/) | Prose linting for style consistency |
