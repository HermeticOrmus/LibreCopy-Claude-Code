# /content-plan

Audit documentation, design information architecture, create content roadmaps, and measure docs performance.

## Trigger

`/content-plan <action> [options]`

## Actions

### `audit`
Perform ROT analysis and gap analysis on existing documentation.

```bash
/content-plan audit --dir ./docs --output audit-results.md
/content-plan audit --url https://docs.example.com --sitemap sitemap.xml
/content-plan audit --dir ./docs --filter outdated  # Only show stale content
```

### `structure`
Design or review information architecture and navigation.

```bash
/content-plan structure --inventory audit-results.md
/content-plan structure --describe "Developer tool with 3 user types: end users, admins, API consumers"
/content-plan structure --review ./docs/navigation.yaml
```

### `roadmap`
Create a prioritized content roadmap from audit findings.

```bash
/content-plan roadmap --from audit-results.md --quarters 2
/content-plan roadmap --gaps "missing migration guide, no troubleshooting section" --priority high
```

### `measure`
Generate a measurement plan for documentation health.

```bash
/content-plan measure --platform docusaurus --analytics ga4
/content-plan measure --report --period 30d  # Summarize last 30 days
```

## Options

| Option | Description |
|--------|-------------|
| `--dir <path>` | Documentation directory to audit |
| `--url <url>` | Published docs URL to audit |
| `--output <path>` | Output file for results |
| `--filter <type>` | Filter: outdated, redundant, trivial, gaps |
| `--priority <level>` | high, medium, low (for roadmap) |
| `--quarters <n>` | Planning horizon for roadmap |

## Content Audit Template (Markdown)

```markdown
# Documentation Audit - [Project Name]

**Audit Date**: 2025-04-01
**Auditor**: [Name]
**Scope**: /docs directory (47 articles)

## Summary

| Status | Count |
|--------|-------|
| Current and accurate | 28 |
| Outdated (>12 months) | 12 |
| Redundant/duplicate | 4 |
| Trivial/low value | 3 |

## ROT Analysis

### Redundant
- `docs/install.md` and `docs/getting-started.md` cover the same installation steps
- `docs/faq.md` and `docs/troubleshooting.md` have 40% overlapping questions

### Outdated
- `docs/authentication.md` - references v1 API (current: v3)
- `docs/deployment/aws.md` - references EC2 launch wizard UI (deprecated 2023)

### Trivial
- `docs/roadmap.md` - last updated 2021, no longer maintained

## Gap Analysis

User journey stage gaps identified:
- No migration guide from v1 to v2
- No troubleshooting guide for the CLI tool
- No explanation content for the rate limiting system (only reference, no concepts)

## Priority Matrix

| Content | Priority | Effort | Action |
|---------|----------|--------|--------|
| Update authentication.md | High | Medium | Rewrite for v3 API |
| Create v1→v2 migration guide | High | High | Create new |
| Merge install.md + getting-started.md | Medium | Low | Consolidate |
| Archive roadmap.md | Low | Low | Remove |
```

## Information Architecture Template

```markdown
# Information Architecture Design

## User Types
1. **New users** - Need: guided path from zero to working app
2. **Daily users** - Need: fast reference, searchable
3. **API consumers** - Need: complete reference, examples, error catalog

## Navigation Structure

```
/ (home)
├── /get-started/          - Tutorial: Install → Hello World → First feature
│   ├── quickstart          - 5-minute path (no explanation)
│   └── full-guide          - Complete onboarding with context
├── /guides/               - How-tos organized by task (not feature)
│   ├── authentication/
│   ├── data-export/
│   └── migrations/
├── /reference/            - API reference, config reference, CLI reference
│   ├── api/                - Generated from OpenAPI spec
│   ├── config/
│   └── cli/
├── /concepts/             - Explanations: architecture, data model, rate limits
└── /changelog/            - Version history, migration guides
```

## Version Strategy
- Docs versioned with major releases only (v1, v2, v3)
- Per-version branch in Git, deployed to /v1/, /v2/, /v3/
- Active support: current + previous major version
- EOL versions: banner warning + link to migration guide
```
