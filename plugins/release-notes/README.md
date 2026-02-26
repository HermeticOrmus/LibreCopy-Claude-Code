# Release Notes Plugin

> Generate audience-appropriate release notes, migration guides, and breaking change documentation for software releases.

## Purpose

The same code change means different things to different people. An API signature change is a breaking change for SDK users, a deployment note for DevOps, and a new capability for end users. This plugin generates release communications for each audience from a single source of truth (CHANGELOG.md or git log), and produces migration guides that make breaking changes survivable.

## Agents

| Agent | Role |
|-------|------|
| `release-notes-writer` | Audience-targeted release notes, breaking change docs, migration guides |

## Commands

| Command | Description |
|---------|-------------|
| `/release-notes generate` | Generate release notes from CHANGELOG.md or git log |
| `/release-notes migrate` | Write a migration guide for breaking changes |
| `/release-notes audit` | Check release notes quality and completeness |
| `/release-notes diff` | Summarize git changes between two version tags |

## Skills

| Skill | Description |
|-------|-------------|
| `release-note-formats` | Templates for GitHub releases, changelogs, blog posts, in-app notifications |
| `release-note-patterns` | Audience-first writing, breaking change pattern, deprecation pattern, anti-patterns |

## Quick Start

```bash
# Generate a GitHub Release from CHANGELOG.md
/release-notes generate --version v2.0.0 --since v1.9.0 --format github-release

# Write migration guide for breaking changes
/release-notes migrate --from v1.x --to v2.0 --changelog CHANGELOG.md

# Generate end-user-facing notes (plain language, no code)
/release-notes generate --version v2.0.0 --audience end-user

# Audit existing release notes
/release-notes audit CHANGELOG.md --check-migration --check-links
```

## Audience Matrix

| Version Bump | End Users | API Developers | DevOps | Changelog |
|-------------|-----------|----------------|--------|-----------|
| Patch (0.0.x) | Optional | Bug list + PR links | If config changed | Required |
| Minor (0.x.0) | "What's New" | Feature list + examples | If infra changed | Required |
| Major (x.0.0) | "What's New" | Breaking changes + migration | Migration guide | Required |

## Breaking Change Rule

Every breaking change entry must have three elements:
1. What changed (technical description)
2. Why it changed (motivation)
3. How to migrate (copy-paste commands or code diffs)

A breaking change without a migration guide is not ready to ship.
