---
description: "Generate release notes for a version from git history and the changelog, write a migration guide, audit existing notes, or summarize changes between two versions."
argument-hint: "[generate|migrate|audit|diff] --version <semver> [--audience developer|end-user|admin|all]"
---

# /release-notes

> Generate release notes for a specific version from git history and changelog.

Generate audience-targeted release notes and migration guides for software releases.

## Trigger

`/release-notes` -- invoked when preparing a software release for announcement.

`/release-notes <action> [options]`

With no action, `/release-notes` runs `generate`, following the Process below.

## Actions

### `generate`
Generate release notes for a version from CHANGELOG.md or git log.

```bash
/release-notes generate --version v2.0.0 --since v1.9.0
/release-notes generate --version v2.0.0 --audience end-user
/release-notes generate --version v2.0.0 --format github-release
/release-notes generate --version v2.0.0 --include-migration
```

### `migrate`
Generate a standalone migration guide for a breaking change.

```bash
/release-notes migrate --from v1.x --to v2.0 --breaking "auth API"
/release-notes migrate --changelog CHANGELOG.md --version v2.0.0
```

### `audit`
Check existing release notes for quality issues.

```bash
/release-notes audit CHANGELOG.md
/release-notes audit --dir releases/ --check-migration --check-links
```

### `diff`
Summarize what changed between two versions from git log.

```bash
/release-notes diff v1.9.0 v2.0.0
/release-notes diff v1.9.0 HEAD --conventional-commits
```

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--version <semver>` | Yes | Version being released |
| `--since <ref>` | No | Previous version to diff from (default: previous tag) |
| `--audience <type>` | No | Target audience: `developer`, `end-user`, `admin`, `all` (default: `all`) |
| `--include-migration` | No | Include migration guide for breaking changes |
| `--format <type>` | No | Output: `github`, `blog`, `email`, `in-app` (default: `github`) |
| `--output <path>` | No | Output file path |

## Options for the actions

| Option | Description |
|--------|-------------|
| `--version <tag>` | Release version to document (e.g., v2.0.0) |
| `--since <tag>` | Start of range (previous version tag) |
| `--audience <type>` | end-user, developer, devops, internal |
| `--format <type>` | github-release, changelog, blog, in-app |
| `--include-migration` | Include migration guide for breaking changes |
| `--conventional-commits` | Parse commits using Conventional Commits spec |

## Process

1. **Change Collection**
   - Parse git log between --since and HEAD
   - Read CHANGELOG.md for curated entries
   - Identify breaking changes, new features, fixes, security patches
   - Collect PR descriptions for additional context

2. **Audience Segmentation**
   - Categorize each change by affected audience
   - Prioritize changes by user impact
   - Group related changes under feature headings

3. **Content Generation**
   - Write highlight section for top 2-3 changes
   - Document breaking changes with migration snippets
   - List features, improvements, fixes, security updates
   - Generate migration guide if breaking changes exist and flag is set

4. **Format and Publish**
   - Format for the specified output channel
   - Include comparison links and related resources
   - Validate markdown rendering

## Output

Release notes file and console summary:

```
Release Notes Generated
  Version: v2.0.0
  Breaking Changes: 4
  New Features: 6
  Bug Fixes: 8
  Security: 2
  Migration Guide: Included
  Output: releases/v2.0.0.md
```
## GitHub Release Template

```markdown
## What's New in v{version}

### Highlights

[2-3 sentences describing the most significant changes in plain language]

### New Features

- **Feature Name**: One sentence on what users can now do.
  [Read the docs →](https://docs.example.com/feature)

### Bug Fixes

- Fixed [what was broken]. ([#123](https://github.com/owner/repo/issues/123))
- Fixed [what was broken] when [specific condition].

### Breaking Changes

> **Action required** if you use [affected feature name]

**What changed**: [Technical description]

**Why**: [Motivation for the change]

**Before:**
```language
// old code
```

**After:**
```language
// new code
```

Run `npx @example/migrate` to automatically update your codebase.

### Performance

- Reduced [metric] from [old] to [new] on [operation].

### Full Changelog

[v{previous}...v{version}](https://github.com/{owner}/{repo}/compare/v{previous}...v{version})
```

## Migration Guide Template

```markdown
# Migrating from v{old} to v{new}

## Overview

v{new} includes [N] breaking changes. Most projects can migrate in under
[time estimate]. An automated migration script handles [X of N] changes.

## Automated Migration

```bash
npx @{package}/migrate@{new}
```

The migration script handles:
- [ ] [Change 1]
- [ ] [Change 2]

Review the changes with `git diff` before committing.

## Manual Steps

### 1. [Breaking Change Name]

**Before (v{old}):**
```language
old code example
```

**After (v{new}):**
```language
new code example
```

**Why**: [Reason for the breaking change]

### 2. [Next Breaking Change]

[Pattern repeats for each breaking change]

## Need Help?

- [GitHub Discussions](link)
- [Migration FAQ](link)
```

## Audit Output

```
Release Notes Audit: v2.0.0

BREAKING CHANGES:
  [✓] Breaking changes section present
  [✓] Migration path documented for each breaking change
  [✗] Missing: automated migration script reference

CONTENT:
  [✓] Added/Changed/Fixed/Security sections present
  [✓] Issue/PR links in bug fixes
  [✗] Missing: user-benefit language (Found 3 developer-only entries)
  [✓] Version comparison link at bottom

MIGRATION GUIDE:
  [✓] Before/after code examples
  [✗] Missing: time estimate for migration
  [✓] Links to related documentation

RESULT: 3 issues. Priority: Add migration script + translate developer entries.
```
