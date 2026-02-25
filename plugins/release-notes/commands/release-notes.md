# /release-notes

> Generate release notes for a specific version from git history and changelog.

## Trigger

`/release-notes` -- invoked when preparing a software release for announcement.

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--version <semver>` | Yes | Version being released |
| `--since <ref>` | No | Previous version to diff from (default: previous tag) |
| `--audience <type>` | No | Target audience: `developer`, `end-user`, `admin`, `all` (default: `all`) |
| `--include-migration` | No | Include migration guide for breaking changes |
| `--format <type>` | No | Output: `github`, `blog`, `email`, `in-app` (default: `github`) |
| `--output <path>` | No | Output file path |

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
