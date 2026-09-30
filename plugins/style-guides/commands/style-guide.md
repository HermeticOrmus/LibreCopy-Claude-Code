---
description: "Create a writing style guide for a project or team, validate docs against it, generate a Vale configuration from it, or diff two versions."
argument-hint: "[create|validate|lint-config|diff] [--base google|microsoft] [--scope name]"
---

# /style-guide

> Create a writing style guide for a project, team, or organization.

Create, validate, and enforce writing style guides for technical teams.

## Trigger

`/style-guide` -- invoked when establishing or updating writing standards for documentation.

`/style-guide <action> [options]`

With no action, `/style-guide` runs `create`, following the Process below.

## Actions

### `create`
Generate a new style guide for a project or organization.

```bash
/style-guide create --base google --scope api-docs
/style-guide create --base microsoft --scope end-user --voice professional
/style-guide create --scope all --domain fintech
/style-guide create --type terminology --domain healthcare
```

### `validate`
Check documentation against a style guide.

```bash
/style-guide validate docs/ --rules .vale.ini
/style-guide validate README.md --check-voice --check-terminology
/style-guide validate docs/ --check-reading-level --audience developer
```

### `lint-config`
Generate Vale configuration for a style guide.

```bash
/style-guide lint-config --from style-guide.md --output .vale/styles/
/style-guide lint-config --rules terminology.yml --type substitution
```

### `diff`
Compare two style guides or show what has changed.

```bash
/style-guide diff style-guide-v1.md style-guide-v2.md
/style-guide diff --base google --custom .vale/styles/Custom/
```

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--scope <level>` | No | Scope: `project`, `organization`, `api-docs`, `user-docs` (default: `project`) |
| `--base <guide>` | No | Base style guide to extend: `google`, `microsoft`, `stripe`, `none` (default: `google`) |
| `--voice <style>` | No | Voice: `professional`, `friendly`, `technical`, `casual` (default: `professional`) |
| `--type <section>` | No | Generate specific section: `terminology`, `formatting`, `voice`, `full` (default: `full`) |
| `--output <path>` | No | Output path (default: `docs/style-guide.md`) |

## Options for the actions

| Option | Description |
|--------|-------------|
| `--base <guide>` | Base style guide to extend: google, microsoft, apple, stripe |
| `--scope <scope>` | all, api-docs, end-user, internal, blog |
| `--voice <type>` | professional, casual, academic, conversational |
| `--domain <name>` | Domain for specialized terminology: fintech, healthcare, legal |
| `--check-reading-level` | Validate against target reading level |
| `--audience <type>` | end-user, developer, business -- affects reading level targets |

## Process

1. **Baseline Selection**
   - Load base style guide rules (Google, Microsoft, etc.)
   - Identify rules to customize for this project's audience and voice
   - Scan existing documentation for current conventions (whether documented or not)

2. **Rule Definition**
   - Define voice and tone with examples for each context
   - Establish grammar conventions (active voice, tense, person)
   - Set formatting standards (headings, lists, code, tables)
   - Build terminology glossary from project-specific terms
   - Create inclusion and accessibility guidelines

3. **Example Generation**
   - Write correct/incorrect examples for each rule
   - Use examples from the actual project documentation where possible

4. **Tooling Configuration**
   - Generate Vale configuration for automated checking
   - Create custom Vale rules for project-specific terminology

## Output

A style guide document with Vale configuration:

```
Style Guide Created
  Scope: Project
  Base: Google Developer Style Guide
  Sections: 6 (Voice, Grammar, Formatting, Terminology, Code, Accessibility)
  Rules: 34
  Vale Rules: 12 custom rules
  Output: docs/style-guide.md, .vale/styles/Project/
```
## Style Guide Template

```markdown
# [Project/Org] Writing Style Guide

> Based on the [Google Developer Style Guide](https://developers.google.com/style).
> This guide covers only where we differ from or extend the base guide.
> For topics not covered here, follow the base guide.

**Version**: 1.0
**Owner**: [Team]
**Last updated**: YYYY-MM-DD

---

## Voice and Tone

### Voice (constant)

[3-5 adjectives describing how we write, with one example sentence each]

Example: "We are **direct**. We get to the point without preamble."
Example: "We are **technical**. We do not oversimplify for non-technical audiences."
Example: "We are **respectful**. We treat readers as capable professionals."

### Tone by Context

| Context | Tone | Example |
|---------|------|---------|
| Tutorial | Encouraging, patient | "You've set up authentication. Next, let's add authorization." |
| Error message | Empathetic, action-oriented | "Your session expired. Sign in to continue." |
| API reference | Neutral, precise | "Returns a 404 if the resource does not exist." |
| Security advisory | Serious, urgent | "Update immediately. This vulnerability allows..." |

---

## Grammar and Usage

### Person

**Use**: Second person ("you", "your")
**Avoid**: Third person ("the user", "the developer")

Do: "You can configure this with the `--verbose` flag."
Don't: "The user can configure this with the `--verbose` flag."

**Why**: Second person is direct and matches how readers experience the docs.

### Tense

**Use**: Present tense
**Avoid**: Future tense for current behavior

Do: "The function returns the parsed value."
Don't: "The function will return the parsed value."

### Voice

**Use**: Active voice
**Avoid**: Passive voice (except when the actor is unknown or unimportant)

Do: "The server rejects invalid tokens."
Don't: "Invalid tokens are rejected by the server."

### Contractions

**Use**: Contractions in tutorials and conceptual docs
**Avoid**: Contractions in API reference and technical specs

Do (tutorial): "You don't need to configure this manually."
Don't (reference): "The client doesn't retry on 4xx errors." → "The client does not retry on 4xx errors."

---

## Terminology

> See [terminology.yml](./terminology.yml) for the machine-readable version.

### Preferred Terms

| Use | Avoid | Context |
|-----|-------|---------|
| sign in | login, log in | User-facing, UI labels |
| email address | email, e-mail | When referring to the address |
| allowlist | whitelist | Access control terminology |
| blocklist | blacklist | Access control terminology |
| two-factor authentication (2FA) | MFA, 2-factor | First mention |
| [product name] | the product | All contexts |

---

## Formatting

### Code

- Use inline code for: file names, variable names, command names, flag names, values
- Use code blocks for: commands to run, code examples, config file contents
- Always include a language hint on code blocks: `bash`, `json`, `typescript`

### Headings

- Use sentence case: "Getting started with authentication" not "Getting Started With Authentication"
- Do not use gerunds as headings: "Authentication" not "Authenticating"
- API reference headings: use the method name as-is: `POST /users`

### Numbers

- Use numerals for: measurements, versions, code values
- Spell out for: small numbers in prose (one through nine)
- Exception: always use numerals in UI instructions: "Click the 3 dots menu"

---

## Inclusive Language

| Avoid | Use Instead |
|-------|------------|
| guys | everyone, folks, team |
| blacklist / whitelist | blocklist / allowlist |
| master / slave | primary / replica, leader / follower |
| sanity check | quick check, confidence check |
| dummy value | example value, placeholder value |

---

## Vale Configuration

```ini
# .vale.ini
StylesPath = .vale/styles
MinAlertLevel = warning

[*.{md,mdx}]
BasedOnStyles = Vale, Google, [ProjectName]
```

Generated rule files live in `.vale/styles/[ProjectName]/`.
Run `vale sync` to install base styles.
Run `vale docs/` to check documentation.
```
