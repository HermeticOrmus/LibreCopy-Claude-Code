# CLI Help Text Plugin

> Write POSIX/GNU-compliant `--help` output, man pages, and CLI documentation. Generate BATS test cases for CLI behavior verification.

## Purpose

Produces professional command-line interface documentation: `--help` text that follows GNU conventions, man pages in nroff format, subcommand hierarchies, and exit code tables. The CLI's help text is often the entire documentation a developer uses - it deserves the same quality bar as API reference docs.

## Agents

| Agent | Role |
|-------|------|
| `cli-doc-specialist` | Help text generation, man page authoring, POSIX/GNU convention enforcement, BATS test generation |

## Commands

| Command | Description |
|---------|-------------|
| `/doc-cli generate` | Generate help text or man page from source code or description |
| `/doc-cli validate` | Check help text against POSIX/GNU conventions |
| `/doc-cli man-page` | Generate full man page skeleton |
| `/doc-cli test` | Generate BATS test cases for CLI behavior |

## Skills

| Skill | Description |
|-------|-------------|
| `cli-help-patterns` | POSIX usage line notation, alignment conventions, examples best practices, exit code documentation |

## Quick Start

```bash
# Generate help text from source
/doc-cli generate --from-source ./src/cli.py --format help-text

# Validate existing help text
/doc-cli validate "$(mycli --help)"

# Generate man page
/doc-cli man-page --name mycli --section 1

# Generate BATS tests
/doc-cli test --from-help "$(mycli --help)" --output ./test/mycli.bats
```

## When to Use

- Writing CLI documentation for a new tool
- Reviewing existing help text for POSIX compliance
- Generating man pages for distribution (Homebrew, apt, pacman)
- Creating automated tests for CLI behavior
- Auditing CLI help text for missing defaults, examples, or exit codes

## Tooling Reference

| Tool | Purpose |
|------|---------|
| [BATS-core](https://bats-core.readthedocs.io/) | Bash automated testing for CLI tools |
| [shellspec](https://shellspec.info/) | BDD-style shell testing |
| [cram](https://bitheap.org/cram/) | Functional testing from shell sessions |
| [clap](https://docs.rs/clap/) | Rust CLI framework with help generation |
| [cobra](https://cobra.dev/) | Go CLI framework |
| [Click](https://click.palletsprojects.com/) | Python CLI framework |
