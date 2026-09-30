# Architecture Docs Plugin

> Document system architecture using the C4 Model, arc42 template, and Architecture Decision Records (ADRs). Generate Mermaid and Structurizr diagrams alongside written narrative.

## Purpose

Captures the "why" of architectural decisions (ADRs) and the "what" of system structure (C4 diagrams, arc42 docs). Produces documentation that survives team turnover by explaining constraints and trade-offs, not just the final design.

## Agents

| Agent | Role |
|-------|------|
| `diagram-narrator` | C4 diagrams, arc42 sections, Mermaid/Structurizr DSL generation, component and data-flow narratives |
| `adr-writer` | ADRs (MADR format), options analysis, consequences, supersession |

## Commands

| Command | Description |
|---------|-------------|
| `/arch-doc` | Write architecture documentation for a system, service, or component |
| `/arch-doc diagram` | Generate C4 diagram at specified level (context/container/component) |
| `/adr` | Create or list Architecture Decision Records |
| `/arch-doc export` | Export docs to HTML or Confluence |
| `/arch-doc review` | Review docs for staleness and coverage gaps |

## Skills

| Skill | Description |
|-------|-------------|
| `adr-templates` | ADR formats (Nygard, MADR), status lifecycle, when to write one |
| `arch-doc-patterns` | C4 naming conventions, audience-level mapping, Mermaid syntax, arc42 section priorities |

## Quick Start

```bash
# Create a new ADR
/adr --title "Adopt event sourcing for order state"

# Generate C4 container diagram in Mermaid
/arch-doc diagram --level container --format mermaid --output ./docs/arch/containers.md

# Review existing architecture docs for gaps
/arch-doc review ./docs/arch/

# List all ADRs with status
/adr --list
```

## When to Use

- A significant technology choice is about to be made (database, framework, communication pattern)
- A new team member asks "why do we use X instead of Y?"
- A service boundary or data ownership question needs to be resolved
- The system has grown and no longer matches the existing diagrams
- Pre-mortem for a proposed architectural change

## Tooling Reference

| Tool | Purpose |
|------|---------|
| [C4 Model](https://c4model.com/) | Four-level diagram notation by Simon Brown |
| [Structurizr](https://structurizr.com/) | DSL-based C4 diagram server |
| [MADR](https://adr.github.io/madr/) | Markdown ADR format with options analysis |
| [arc42](https://arc42.org/) | 12-section architecture documentation template |
| [Mermaid](https://mermaid.js.org/) | Diagram-as-code, renders in GitHub/GitLab |
| [adr-tools](https://github.com/npryce/adr-tools) | CLI for managing ADR files |
