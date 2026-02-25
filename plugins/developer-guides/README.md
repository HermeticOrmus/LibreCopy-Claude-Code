# Developer Guides Plugin

> Create getting-started guides, contributing documentation, and third-party integration guides for developer audiences.

## Purpose

Produces the documentation that helps developers adopt, contribute to, and integrate with your project. Covers the full developer journey from "How do I set up the dev environment?" to "How do I integrate this with my existing system?"

## Agents

| Agent | Role |
|-------|------|
| `devguide-writer` | Creates getting started, contributing, and development environment guides |
| `integration-documenter` | Documents third-party integrations, webhooks, and extension points |

## Commands

| Command | Description |
|---------|-------------|
| `/devguide` | Generate a developer guide for the current project |

## Skills

| Skill | Description |
|-------|-------------|
| `developer-guide-patterns` | Patterns for developer onboarding and integration documentation |

## Usage

```
/devguide --type contributing
/devguide --type getting-started
/devguide --type integration --service stripe
```
