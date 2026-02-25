# Changelog Management Plugin

> Generate and maintain changelogs following Keep a Changelog format and create user-friendly release notes.

## Purpose

Transforms git history, commit messages, and pull requests into structured changelogs and human-readable release narratives. Maintains CHANGELOG.md as the canonical record of what changed, when, and why.

## Agents

| Agent | Role |
|-------|------|
| `changelog-writer` | Generates Keep a Changelog-formatted entries from git history |
| `release-narrator` | Transforms technical changes into user-friendly release narratives |

## Commands

| Command | Description |
|---------|-------------|
| `/changelog` | Generate a changelog entry for a release or set of changes |

## Skills

| Skill | Description |
|-------|-------------|
| `changelog-patterns` | Changelog formatting standards and categorization patterns |

## Usage

```
/changelog --since v1.2.0 --version v1.3.0
/changelog --unreleased
/changelog --format keepachangelog
```
