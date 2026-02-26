# Knowledge Bases Plugin

> Design knowledge base taxonomy, optimize article findability, manage content lifecycle, and measure deflection rates. Covers Confluence, Notion, GitBook, Zendesk, and Readme.io.

## Purpose

Produces knowledge bases that users can actually find answers in. Addresses the most common KB failure mode: content exists but users cannot find it. Covers taxonomy design, controlled vocabulary, article templates, search optimization, lifecycle management, and deflection metrics.

## Agents

| Agent | Role |
|-------|------|
| `kb-architect` | Taxonomy design, search optimization, content migration planning, article lifecycle, metrics |

## Commands

| Command | Description |
|---------|-------------|
| `/build-kb structure` | Design KB taxonomy and navigation for given user types |
| `/build-kb migrate` | Plan content migration between platforms |
| `/build-kb optimize` | Audit search performance and article findability |
| `/build-kb measure` | Generate measurement plan and analyze health metrics |

## Skills

| Skill | Description |
|-------|-------------|
| `kb-patterns` | Article title patterns, taxonomy, article lifecycle, search optimization, anti-patterns |

## Quick Start

```bash
# Design KB structure for a product
/build-kb structure --describe "SaaS tool with end users, admins, and developers"

# Audit search performance
/build-kb optimize --zero-results-report ./search-analytics.csv

# Plan migration from Zendesk to Confluence
/build-kb migrate --from zendesk --to confluence --audit first

# Set up measurement framework
/build-kb measure --platform zendesk --output measurement-plan.md
```

## When to Use

- Building a knowledge base from scratch (taxonomy before content)
- Existing KB has low search success rate (users don't find what they need)
- Migrating from one platform to another (plan before moving)
- Quarterly KB health review (audit staleness, measure deflection)
- Setting up article review cadences

## Platform Comparison

| Platform | Best For | Limitations |
|----------|---------|-------------|
| Zendesk Guide | Customer support deflection | Weak developer docs support |
| Confluence | Internal team knowledge | Complex permissions, slow UI |
| Notion | Flexible team wiki | Limited search, no version control |
| GitBook | Developer-facing docs | Less suitable for end-user support |
| Readme.io | Developer hub + API docs | Expensive at scale |
| Outline | Open-source team wiki | Self-hosted infrastructure needed |
