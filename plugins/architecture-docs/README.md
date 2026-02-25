# Architecture Docs Plugin

> Create Architecture Decision Records (ADRs) and system architecture documentation with diagrams and narratives.

## Purpose

Documents the "why" behind architectural choices and the "what" of system design. ADRs capture decisions with their context and consequences. Architecture docs describe how systems are structured and how components interact.

## Agents

| Agent | Role |
|-------|------|
| `adr-writer` | Creates Architecture Decision Records following the MADR template |
| `diagram-narrator` | Writes system architecture documentation with component descriptions and data flow narratives |

## Commands

| Command | Description |
|---------|-------------|
| `/adr` | Create an Architecture Decision Record |
| `/arch-doc` | Generate system architecture documentation |

## Skills

| Skill | Description |
|-------|-------------|
| `adr-templates` | ADR formats, status lifecycle, and architectural documentation patterns |

## Usage

```
/adr --title "Use PostgreSQL for primary datastore"
/adr --title "Adopt event-driven architecture" --status accepted
/arch-doc --scope full-system
/arch-doc --scope service --name auth-service
```
