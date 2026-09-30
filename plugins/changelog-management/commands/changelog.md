---
description: "Generate Keep a Changelog entries from git history, validate CHANGELOG.md, cut a release section, or backfill entries for past versions."
argument-hint: "[generate|validate|release|backfill] [--since ref] [--version semver]"
---

# /changelog

> Generate a changelog entry from git history for a specific version or unreleased changes.

Generate, validate, cut releases, and backfill changelog entries.

## Trigger

`/changelog` -- invoked when preparing a release or documenting accumulated changes.

`/changelog <action> [options]`

With no action, `/changelog` runs `generate`, following the Process below.

## Actions

### `generate`
Generate changelog entries from git history since a given tag.

```bash
/changelog generate --since v1.4.2 --version v1.5.0
/changelog generate --since v1.4.2 --unreleased
/changelog generate --since v1.4.2 --format keepachangelog --output CHANGELOG.md
```

### `validate`
Check CHANGELOG.md for format compliance and completeness.

```bash
/changelog validate CHANGELOG.md
/changelog validate CHANGELOG.md --strict  # Fail on any vague entries
```

### `release`
Cut a release: rename Unreleased section, bump version, update comparison links.

```bash
/changelog release --version 1.5.0 --date 2025-04-01
/changelog release --auto  # Determine version from change types present
```

### `backfill`
Generate changelog entries for historical releases that have none.

```bash
/changelog backfill --from v1.0.0 --to v1.4.2
/changelog backfill --tag v1.3.0  # Single version
```

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--since <ref>` | No | Git ref to start from (tag, commit, branch). Default: last tag |
| `--version <semver>` | No | Version label for the entry. Default: `Unreleased` |
| `--format <type>` | No | Output format: `keepachangelog`, `narrative`, `both` (default: `keepachangelog`) |
| `--output <path>` | No | File to write/prepend to (default: `./CHANGELOG.md`) |
| `--breaking` | No | Flag to highlight breaking changes prominently |

## Options for the actions

| Option | Description |
|--------|-------------|
| `--since <tag>` | Generate from this git tag forward |
| `--version <semver>` | Target version for the release |
| `--unreleased` | Output to Unreleased section only |
| `--format <type>` | keepachangelog, conventionalcommits, github (default: keepachangelog) |
| `--output <file>` | Write to file (default: stdout) |
| `--strict` | Fail on vague entries |
| `--auto` | Auto-determine version from commit types |

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
## Template: .cliff.toml (git-cliff configuration)

```toml
[changelog]
header = """
# Changelog

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit format.

"""
body = """
{% if version %}\
## [{{ version | trim_start_matches(pat="v") }}] - {{ timestamp | date(format="%Y-%m-%d") }}
{% else %}\
## [Unreleased]
{% endif %}\
{% for group, commits in commits | group_by(attribute="group") %}
### {{ group | upper_first }}
{% for commit in commits %}
- {% if commit.breaking %}**BREAKING:** {% endif %}{{ commit.message | upper_first }} ([#{{ commit.id | truncate(length=7, end="") }}]({{ commit.id }}))
{% endfor %}
{% endfor %}
"""
footer = ""
trim = true

[git]
conventional_commits = true
filter_unconventional = true
split_commits = false
commit_parsers = [
  { message = "^feat", group = "Added" },
  { message = "^fix", group = "Fixed" },
  { message = "^perf", group = "Changed" },
  { message = "^refactor", skip = true },
  { message = "^chore", skip = true },
  { message = "^ci", skip = true },
  { message = "^test", skip = true },
  { message = "^docs", skip = true },
  { message = "^security", group = "Security" },
]
protect_breaking_commits = true
filter_commits = true
tag_pattern = "v[0-9]*"
sort_commits = "oldest"
```

## Template: Release Drafter (.github/release-drafter.yml)

```yaml
name-template: 'v$RESOLVED_VERSION'
tag-template: 'v$RESOLVED_VERSION'
categories:
  - title: 'New Features'
    labels: ['feature', 'enhancement']
  - title: 'Bug Fixes'
    labels: ['fix', 'bugfix', 'bug']
  - title: 'Security'
    labels: ['security']
  - title: 'Dependencies'
    labels: ['dependencies', 'chore']
exclude-labels:
  - 'skip-changelog'
  - 'documentation'
version-resolver:
  major:
    labels: ['breaking-change']
  minor:
    labels: ['feature', 'enhancement']
  patch:
    labels: ['fix', 'bugfix', 'bug', 'security', 'dependencies']
  default: patch
template: |
  ## What's Changed

  $CHANGES

  **Full Changelog**: https://github.com/$OWNER/$REPOSITORY/compare/$PREVIOUS_TAG...v$RESOLVED_VERSION
```

## Validate Output Example

```
Validating CHANGELOG.md...

ERRORS (1):
  [v1.3.0] Missing ISO 8601 date (format: YYYY-MM-DD)

WARNINGS (3):
  [v1.2.1 > Fixed] "Various bug fixes" is too vague - describe specific bugs
  [v1.2.0 > Changed] Entry missing PR/issue reference
  [Bottom links] v1.1.0 comparison link is missing

PASS (18):
  All version headings present
  Unreleased section exists
  Category order correct (Added/Changed/Deprecated/Removed/Fixed/Security)
  ...

Result: 1 error, 3 warnings
```
