# User Documentation Plugin

> Create end-user documentation, help center articles, and FAQ pages for non-technical audiences.

## Purpose

Produces documentation for the people who use your product, not the people who build it. Translates technical functionality into task-oriented guides that help users accomplish their goals without needing to understand implementation details.

## Agents

| Agent | Role |
|-------|------|
| `user-guide-writer` | Creates end-user documentation with task-oriented structure |
| `faq-builder` | Generates FAQ pages from support tickets, user research, and product knowledge |

## Commands

| Command | Description |
|---------|-------------|
| `/user-doc` | Generate user-facing documentation for a feature or workflow |

## Skills

| Skill | Description |
|-------|-------------|
| `user-doc-patterns` | Patterns for writing clear, accessible end-user documentation |

## Usage

```
/user-doc --feature "team management" --audience end-user
/user-doc --feature "billing" --type faq
/user-doc --feature "data export" --type walkthrough
```
