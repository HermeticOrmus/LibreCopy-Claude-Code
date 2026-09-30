---
description: "Write a developer guide (getting started, contributing, integration, or development setup), or create, review, test, or publish guides by Diátaxis type."
argument-hint: "[create|review|test|publish] [--type getting-started|contributing|integration|development]"
---

# /devguide

> Generate developer-facing documentation: getting started, contributing, or integration guides.

Create, review, test, and publish developer guides following the Diátaxis framework.

## Trigger

`/devguide` -- invoked when creating developer onboarding or contribution documentation.

`/devguide <action> [options]`

With no action, `/devguide` writes the guide named by `--type`, following the Process below.

## Actions

### `create`
Generate a new guide from a description or template.

```bash
/devguide create --type getting-started --project "Python HTTP client library"
/devguide create --type how-to --task "configure OAuth with Google"
/devguide create --type tutorial --outcome "build a REST API in 30 minutes"
/devguide create --type integration --service stripe
```

### `review`
Review an existing guide for Diátaxis compliance, clarity, and completeness.

```bash
/devguide review docs/getting-started.md
/devguide review docs/guides/ --check-type-mixing  # Flag mixed content types
```

### `test`
Verify a guide can be followed successfully (check commands, links, expected output).

```bash
/devguide test docs/getting-started.md --platform linux
/devguide test docs/getting-started.md --validate-links --check-commands
```

### `publish`
Build and deploy the guide to the target platform.

```bash
/devguide publish --platform docusaurus --section guides/
/devguide publish --platform mintlify
```

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--type <guide>` | No | Guide type: `getting-started`, `contributing`, `integration`, `development` (default: `getting-started`) |
| `--service <name>` | No | Third-party service name (for integration type) |
| `--output <path>` | No | Output path (default: varies by type) |
| `--monorepo` | No | Flag for monorepo-specific guidance |

## Options for the actions

| Option | Description |
|--------|-------------|
| `--type <type>` | getting-started, how-to, tutorial, integration, explanation |
| `--project <desc>` | Description of the project for context |
| `--task <desc>` | Task the guide accomplishes (for how-tos) |
| `--outcome <desc>` | What the user builds (for tutorials) |
| `--service <name>` | External service being integrated |
| `--platform <name>` | Target platform: docusaurus, mkdocs, mintlify |
| `--check-type-mixing` | Flag articles that mix Diátaxis content types |

## Process

1. **Project Analysis**
   - Read package.json/Cargo.toml for project metadata and scripts
   - Scan for Docker/devcontainer configuration
   - Identify test framework and commands
   - Check for existing CONTRIBUTING.md, CODE_OF_CONDUCT.md
   - Detect CI configuration for required checks

2. **Content Generation**
   - For getting-started: Map prerequisites, clone-to-running steps, project structure overview
   - For contributing: PR process, commit conventions, code review expectations, issue templates
   - For integration: Authentication, SDK setup, webhook handling, error scenarios
   - For development: Deep dive on architecture, testing strategy, debugging tips

3. **Validation**
   - Verify all commands in code blocks match actual package.json scripts
   - Check that file paths in project structure match reality
   - Ensure prerequisites list is complete (nothing assumed)

## Output

Markdown guide file written to the appropriate location. Console summary:

```
Developer Guide Created
  Type: Contributing Guide
  Output: CONTRIBUTING.md
  Sections: 7 (Code of Conduct, How to Contribute, Development Workflow, ...)
  Scripts Referenced: 4 (test, lint, typecheck, dev)
```
## Diátaxis Content Type Decision Tree

```
What is the user doing when they need this content?

Learning something new for the first time
  → Tutorial: guided, safe, step-by-step learning experience

Trying to accomplish a specific known task
  → How-To Guide: minimal steps, assumes context, action-focused

Looking up a specific value/option/parameter
  → Reference: complete, accurate, consistent structure

Trying to understand why something works a certain way
  → Explanation: discursive, contextual, conceptual background

Writing: title test
  Tutorial:     "Build a [thing] with [technology]"
  How-To:       "How to [accomplish specific task]"
  Reference:    "[Noun] Reference" or "[API endpoint]"
  Explanation:  "Understanding [concept]" or "How [system] works"
```

## Getting Started Template

```markdown
# Getting Started with [Product Name]

> [One sentence: what the user will accomplish and in how long]

## Prerequisites

| Requirement | Minimum | Check | Install |
|-------------|---------|-------|---------|
| [Tool 1] | [Version] | `[command]` | [link] |
| [Tool 2] | [Version] | `[command]` | [link] |

## Step 1: Install [Product Name]

```bash
[install command]
```

Expected output:
```
[what the terminal should show]
```

## Step 2: Create your first [thing]

[Minimal code to create the first artifact]

```[language]
[code]
```

## Step 3: Run [thing]

```bash
[run command]
```

You should see:
```
[expected output - show the actual output, not a description of it]
```

## What you built

You created a [description]. This works because [one-sentence explanation].

## Next steps

- [How to do X →](/guides/x)
- [Explore the API reference →](/reference)
- [Examples repository →](https://github.com/...)
```

## How-To Template

```markdown
# How to [Specific Task]

**Prerequisites:**
- [What must already be set up] (see [link])
- [Required access or credentials]

## Steps

1. [Action verb + what to do]

   ```bash
   [command]
   ```

2. [Next action]

   ```[language]
   [code]
   ```

3. Verify [expected result]:

   ```
   [what success looks like]
   ```

## Result

[State what is now true. What can the user do that they couldn't before?]

## Troubleshooting

**[Error message or symptom]**: [Cause and fix]

## Related

- [Link to related how-to]
- [Link to relevant reference]
```
