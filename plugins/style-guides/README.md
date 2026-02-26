# Style Guides Plugin

> Create writing style guides and terminology management systems that are enforceable, not just aspirational.

## Purpose

A style guide is only useful if writers actually follow it. This plugin produces style guides that extend established bases (Google Developer Style Guide, Microsoft Writing Style Guide) with team-specific rules, then generates Vale prose linter configurations to automate enforcement. Covers voice and tone, grammar rules, terminology glossaries, inclusive language, and reading level targets.

## Agents

| Agent | Role |
|-------|------|
| `style-guide-curator` | Style guide authoring, terminology management, Vale configuration |

## Commands

| Command | Description |
|---------|-------------|
| `/style-guide create` | Generate a new style guide for a project or organization |
| `/style-guide validate` | Check documentation against a style guide |
| `/style-guide lint-config` | Generate Vale configuration from a style guide |
| `/style-guide diff` | Compare two versions of a style guide |

## Skills

| Skill | Description |
|-------|-------------|
| `style-guide-frameworks` | Industry guide comparison, Vale config, reading level targets, voice vs. tone |
| `style-guide-patterns` | 10-rule principle, do/don't pairs, terminology governance, Vale rules |

## Quick Start

```bash
# Create a style guide extending Google's guide for API docs
/style-guide create --base google --scope api-docs

# Create a terminology glossary for a specific domain
/style-guide create --type terminology --domain fintech

# Generate Vale configuration from your style guide
/style-guide lint-config --from style-guide.md --output .vale/styles/Custom/

# Validate docs against the guide
/style-guide validate docs/ --rules .vale.ini
```

## Style Guide Checklist

Every style guide this plugin generates includes:

- [ ] Base guide explicitly named (Google, Microsoft, etc.) -- rules not duplicated from it
- [ ] Voice definition (3-5 adjectives with example sentences)
- [ ] Tone-by-context table (at minimum: tutorial, reference, error message)
- [ ] Core terminology table with "Use / Avoid / Why" columns
- [ ] Inclusive language rules with specific term substitutions
- [ ] Vale `.ini` configuration and rule files for automated enforcement
- [ ] Reading level targets by audience type
- [ ] Formatted as "do / don't" pairs with domain-specific examples

## Vale Quick Start

```bash
# Install Vale
brew install vale          # macOS
choco install vale         # Windows
snap install vale --edge   # Linux

# Sync base styles (Google, Microsoft)
vale sync

# Check docs
vale docs/

# Check a single file
vale README.md
```
