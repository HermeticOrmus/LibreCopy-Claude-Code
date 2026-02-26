# Changelog Management Plugin

> Generate, validate, and maintain CHANGELOG.md following Keep a Changelog format. Automate release cutting from Conventional Commits with git-cliff, semantic-release, or Release Drafter.

## Purpose

Transforms git history and PR labels into structured, human-readable changelogs. Enforces the distinction between developer-facing commits (all of git log) and user-facing changelogs (what actually changed for people using the software). Supports both manual curation and full automation pipelines.

## Agents

| Agent | Role |
|-------|------|
| `changelog-curator` | Changelog generation from git history, Keep a Changelog formatting, release cutting, version bump decisions |

## Commands

| Command | Description |
|---------|-------------|
| `/changelog generate` | Generate entries from git history since a tag |
| `/changelog validate` | Check CHANGELOG.md for format compliance |
| `/changelog release` | Cut a release: rename Unreleased, update links |
| `/changelog backfill` | Generate entries for historical unrecorded releases |

## Skills

| Skill | Description |
|-------|-------------|
| `changelog-patterns` | Keep a Changelog categories, entry grammar, SemVer mapping, anti-patterns |

## Quick Start

```bash
# Generate unreleased entries from git history
/changelog generate --since v1.4.2 --unreleased

# Validate existing CHANGELOG.md
/changelog validate CHANGELOG.md

# Cut a release
/changelog release --version 1.5.0 --date 2025-04-01

# Check what version bump is required
/changelog generate --since v1.4.2 --auto
```

## When to Use

- Before a release: generate entries from commits since last tag
- During release: cut the Unreleased section to the new version
- In CI: validate CHANGELOG.md format on every PR
- Retroactively: backfill entries for projects with no changelog history
- Automation: set up git-cliff or Release Drafter for hands-off maintenance

## Tooling Reference

| Tool | Language | Best For |
|------|----------|---------|
| [git-cliff](https://git-cliff.org/) | Rust | Fast, configurable, Tera templates |
| [semantic-release](https://semantic-release.gitbook.io/) | Node.js | Full release automation pipeline |
| [Release Please](https://github.com/googleapis/release-please) | Go | Google-style, GitHub App |
| [Changesets](https://github.com/changesets/changesets) | Node.js | Monorepo, per-package changelogs |
| [changie](https://changie.dev/) | Go | YAML fragments, no merge conflicts |
| [Release Drafter](https://github.com/release-drafter/release-drafter) | GitHub App | Label-based, no commit convention needed |
