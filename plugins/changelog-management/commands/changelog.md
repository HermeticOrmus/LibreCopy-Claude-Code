# /changelog

> Generate a changelog entry from git history for a specific version or unreleased changes.

## Trigger

`/changelog` -- invoked when preparing a release or documenting accumulated changes.

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--since <ref>` | No | Git ref to start from (tag, commit, branch). Default: last tag |
| `--version <semver>` | No | Version label for the entry. Default: `Unreleased` |
| `--format <type>` | No | Output format: `keepachangelog`, `narrative`, `both` (default: `keepachangelog`) |
| `--output <path>` | No | File to write/prepend to (default: `./CHANGELOG.md`) |
| `--breaking` | No | Flag to highlight breaking changes prominently |

## Process

1. **History Collection**
   - Run `git log --since-ref..HEAD` to collect commits
   - Parse conventional commit prefixes (feat, fix, chore, etc.)
   - Fetch PR titles and descriptions if available via GitHub API
   - Identify breaking changes from `BREAKING CHANGE:` footers or `!` suffix

2. **Categorization**
   - Sort changes into Keep a Changelog categories: Added, Changed, Deprecated, Removed, Fixed, Security
   - Filter out internal changes (chore, test, ci) unless they affect users
   - Group related commits (multiple commits for one feature become one entry)
   - Identify the highest-impact changes for narrative lead

3. **Entry Generation**
   - Write human-readable descriptions for each change
   - Add PR/commit links in parentheses
   - Format version heading with ISO 8601 date
   - Generate comparison URL for the version diff

4. **File Integration**
   - Read existing CHANGELOG.md
   - Insert new entry after `## [Unreleased]` or at the top
   - Update comparison links at the bottom of the file
   - If creating a new file, include the Keep a Changelog header

## Output

A changelog entry prepended to CHANGELOG.md, or printed to stdout if `--output -` is specified.

```
Changelog Updated
  Version: 1.3.0 (2025-03-15)
  Entries: 8 (3 Added, 1 Changed, 1 Deprecated, 2 Fixed, 1 Security)
  Breaking: 1 breaking change noted
  Output: CHANGELOG.md updated
```
