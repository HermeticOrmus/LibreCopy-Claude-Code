# /style-guide

Create, validate, and enforce writing style guides for technical teams.

## Trigger

`/style-guide <action> [options]`

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

## Options

| Option | Description |
|--------|-------------|
| `--base <guide>` | Base style guide to extend: google, microsoft, apple, stripe |
| `--scope <scope>` | all, api-docs, end-user, internal, blog |
| `--voice <type>` | professional, casual, academic, conversational |
| `--domain <name>` | Domain for specialized terminology: fintech, healthcare, legal |
| `--check-reading-level` | Validate against target reading level |
| `--audience <type>` | end-user, developer, business -- affects reading level targets |

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
