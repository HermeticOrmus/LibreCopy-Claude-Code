# Release Notes Plugin

> Generate audience-aware release notes and upgrade/migration guides for software releases.

## Purpose

Creates release communication that bridges the gap between what changed technically and what users need to know. Handles both the "what's new" announcement and the "how to upgrade" migration guide.

## Agents

| Agent | Role |
|-------|------|
| `release-note-writer` | Creates audience-segmented release notes (developers, end users, admins) |
| `migration-guide-writer` | Produces upgrade and migration documentation for breaking changes |

## Commands

| Command | Description |
|---------|-------------|
| `/release-notes` | Generate release notes for a version |

## Skills

| Skill | Description |
|-------|-------------|
| `release-note-formats` | Release note structures for different audiences and channels |

## Usage

```
/release-notes --version v2.0.0 --since v1.9.0
/release-notes --version v2.0.0 --audience end-user
/release-notes --version v2.0.0 --include-migration
```
