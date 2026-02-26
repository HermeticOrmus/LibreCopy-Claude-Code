# Documentation Testing Plugin

> Automate documentation quality checks: link validation, code example execution, Vale prose linting, markdownlint, and freshness detection.

## Purpose

Applies software testing principles to documentation. The documentation testing pyramid: unit tests (style + formatting, every PR), integration tests (external links, weekly), E2E tests (can a user complete the guide, quarterly). Integrates with GitHub Actions, pre-commit hooks, and CI pipelines.

## Agents

| Agent | Role |
|-------|------|
| `doc-tester` | Link checking setup, Vale/markdownlint configuration, code example validation, CI integration |

## Commands

| Command | Description |
|---------|-------------|
| `/test-docs links` | Check all links for broken URLs, missing anchors, redirects |
| `/test-docs examples` | Extract and execute code examples from Markdown |
| `/test-docs style` | Run Vale prose linting and markdownlint formatting checks |
| `/test-docs freshness` | Detect stale content by age and version references |

## Skills

| Skill | Description |
|-------|-------------|
| `doc-testing-patterns` | Testing pyramid, doctest patterns, Vale rules, link checker config, markdownlint rules |

## Quick Start

```bash
# Check links in docs directory
/test-docs links ./docs

# Run Vale style checks
/test-docs style ./docs --vale-config .vale.ini

# Validate Python code examples
/test-docs examples ./docs --lang python

# Find stale content
/test-docs freshness ./docs --threshold-days 180
```

## When to Use

- Setting up documentation CI for the first time
- Integrating docs checks into pre-commit hooks
- After a major API change, to find outdated code examples
- Quarterly maintenance: find stale articles before users do
- Enforcing consistent terminology across a large docs set

## Tooling Reference

| Tool | Language | Purpose |
|------|----------|---------|
| [Vale](https://vale.sh/) | Go | Prose style linting with custom rules |
| [lychee](https://lychee.cli.rs/) | Rust | Fast link checker, GitHub Actions support |
| [markdownlint](https://github.com/DavidAnson/markdownlint) | Node.js | Markdown formatting rules |
| [markdown-link-check](https://github.com/tcort/markdown-link-check) | Node.js | Simple link checker |
| [pytest --doctest-modules](https://docs.pytest.org/en/stable/how-to/doctest.html) | Python | Run Python doctest examples |
| [cram](https://bitheap.org/cram/) | Python | Shell session transcript testing |
