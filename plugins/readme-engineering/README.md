# README Engineering Plugin

> Generate, validate, and optimize README files that convert repository visitors into users and contributors within 5 seconds.

## Purpose

A README is the single highest-leverage document in a repository. This plugin applies the Standard README specification, Shields.io badge API, and the README pyramid (one-liner → badges → quick start → full docs) to produce READMEs that pass the 5-second test: a developer knows what the project does before scrolling.

Covers README generation for libraries, CLIs, services, and monorepos; badge selection by project type; validation against the Standard README spec; and README quality audits.

## Agents

| Agent | Role |
|-------|------|
| `readme-engineer` | README generation, badge configuration, validation, and quality audits |

## Commands

| Command | Description |
|---------|-------------|
| `/build-readme generate` | Generate a complete README for the current project |
| `/build-readme badges` | Generate Shields.io badge markdown for a project |
| `/build-readme validate` | Check README against Standard README spec and best practices |
| `/build-readme preview` | Show what the README looks like rendered |

## Skills

| Skill | Description |
|-------|-------------|
| `readme-patterns` | 5-second test, README pyramid, badge selection, copy-paste test, anti-patterns |
| `readme-templates` | Complete README templates for library, CLI, service, and monorepo project types |

## Quick Start

```bash
# Generate a README for a TypeScript library
/build-readme generate --type library --pkg-manager npm,yarn,pnpm

# Add badges to an existing README
/build-readme badges --ci github-actions --coverage codecov --registry npm --pkg my-package

# Validate your README against the Standard README spec
/build-readme validate README.md --spec standard-readme --check-links

# Audit README quality
/build-readme validate README.md --check-badges --verbose
```

## README Quality Checklist

Every README this plugin generates passes:

- [ ] One-sentence description in format: "[Name] is a [category] that [value proposition]"
- [ ] CI, version, and license badges present and linked
- [ ] Install section covers all supported package managers
- [ ] Quick Start is under 20 lines and passes the copy-paste test (works in a fresh project)
- [ ] Prerequisites listed before installation, not after
- [ ] Code blocks have language hints for syntax highlighting
- [ ] No stale screenshots (or a documented process to keep them current)
- [ ] Table of Contents only present if README exceeds ~1500 words

## Shields.io Badge Reference

```markdown
<!-- GitHub Actions CI -->
![CI](https://github.com/{owner}/{repo}/actions/workflows/ci.yml/badge.svg)

<!-- npm version -->
![npm](https://img.shields.io/npm/v/{package})

<!-- Codecov coverage -->
![Coverage](https://codecov.io/gh/{owner}/{repo}/branch/main/graph/badge.svg)

<!-- License from GitHub -->
![License](https://img.shields.io/github/license/{owner}/{repo})

<!-- npm weekly downloads -->
![Downloads](https://img.shields.io/npm/dm/{package})
```

## References
- [Standard README Specification](https://github.com/RichardLitt/standard-readme)
- [Shields.io](https://shields.io/)
- [GitHub social preview docs](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/customizing-your-repositorys-social-media-preview)
