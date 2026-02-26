# /test-docs

Check links, validate code examples, enforce style rules, and detect stale content.

## Trigger

`/test-docs <action> [options]`

## Actions

### `links`
Check all links in documentation for broken URLs, missing anchors, and redirects.

```bash
/test-docs links ./docs --config .lychee.toml
/test-docs links ./docs --changed-only  # Only check links in git-changed files
/test-docs links ./docs --format markdown --output link-report.md
```

### `examples`
Extract and validate code examples from Markdown files.

```bash
/test-docs examples ./docs --lang python --runner pytest
/test-docs examples ./docs --lang bash --runner bats
/test-docs examples ./docs --lang all --report
```

### `style`
Run Vale prose linting and markdownlint formatting checks.

```bash
/test-docs style ./docs --vale-config .vale.ini
/test-docs style ./docs --markdownlint-config .markdownlint.yaml
/test-docs style ./docs --fix  # Auto-fix markdownlint issues
```

### `freshness`
Detect potentially stale content based on last-modified dates and version references.

```bash
/test-docs freshness ./docs --threshold-days 180
/test-docs freshness ./docs --check-version-refs --current-version "3.0"
```

## Options

| Option | Description |
|--------|-------------|
| `--config <path>` | Config file for the underlying tool |
| `--format <type>` | output format: console, markdown, json |
| `--output <path>` | Write report to file |
| `--changed-only` | Only check files changed in current branch |
| `--threshold-days <n>` | Staleness threshold in days (for freshness) |
| `--fix` | Auto-fix issues where possible |
| `--lang <lang>` | Code language filter for examples |

## Configuration Files

### lychee.toml (link checker)
```toml
# .lychee.toml
[network]
timeout = 10
retry_wait_time = 2
max_retries = 3

[response_codes]
# Treat these status codes as success (some sites return 429 for bots)
accept = [200, 201, 206, 429]

[exclusions]
# Skip URLs that block bots or are always localhost
exclude = [
  "http://localhost",
  "http://127.0.0.1",
  "https://twitter.com",
  "https://x.com",
  "https://linkedin.com",
]
exclude_path = [
  "CHANGELOG.md",  # External links in changelog are often stale; track separately
]
```

### .vale.ini (prose linter)
```ini
StylesPath = .vale/styles
MinAlertLevel = suggestion

[formats]
md = markdown
mdx = markdown

[*.md]
BasedOnStyles = Google, Vale, write-good
Google.Headings = YES
Google.FirstPerson = NO
write-good.Passive = suggestion
Vale.Spelling = YES

# Project-specific terminology rules
custom.ProductName = YES
custom.Terminology = YES
```

### Custom Vale rule (terminology)
```yaml
# .vale/styles/custom/ProductName.yml
extends: substitution
message: "Use '%s' instead of '%s'"
level: error
action:
  name: replace
swap:
  (?i)the acme api: Acme API
  (?i)acme's api: Acme API
  (?i)our api: Acme API
```

### .markdownlint.yaml
```yaml
default: true
MD013:
  line_length: 120       # Allow longer lines for code-heavy docs
  code_blocks: false     # Don't enforce line length in code blocks
  tables: false          # Don't enforce line length in tables
MD033: false             # Allow inline HTML (needed for admonitions)
MD041: true              # First heading must be H1
MD051: true              # Link fragments must resolve
MD052: true              # Reference links must be defined
```

## GitHub Actions Integration

```yaml
# .github/workflows/docs-check.yml
name: Documentation Check

on:
  pull_request:
    paths:
      - 'docs/**'
      - '**.md'

jobs:
  check-links:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: lycheeverse/lychee-action@v1
        with:
          args: --config .lychee.toml docs/
          fail: true

  check-style:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: errata-ai/vale-action@reviewdog
        with:
          files: docs/
          reporter: github-pr-review

  check-markdown:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npx markdownlint-cli2 "docs/**/*.md"
```
