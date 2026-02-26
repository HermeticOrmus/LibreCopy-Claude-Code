# /doc-guide

Create, review, test, and publish developer guides following the Diátaxis framework.

## Trigger

`/doc-guide <action> [options]`

## Actions

### `create`
Generate a new guide from a description or template.

```bash
/doc-guide create --type getting-started --project "Python HTTP client library"
/doc-guide create --type how-to --task "configure OAuth with Google"
/doc-guide create --type tutorial --outcome "build a REST API in 30 minutes"
/doc-guide create --type integration --service stripe
```

### `review`
Review an existing guide for Diátaxis compliance, clarity, and completeness.

```bash
/doc-guide review docs/getting-started.md
/doc-guide review docs/guides/ --check-type-mixing  # Flag mixed content types
```

### `test`
Verify a guide can be followed successfully (check commands, links, expected output).

```bash
/doc-guide test docs/getting-started.md --platform linux
/doc-guide test docs/getting-started.md --validate-links --check-commands
```

### `publish`
Build and deploy the guide to the target platform.

```bash
/doc-guide publish --platform docusaurus --section guides/
/doc-guide publish --platform mintlify
```

## Options

| Option | Description |
|--------|-------------|
| `--type <type>` | getting-started, how-to, tutorial, integration, explanation |
| `--project <desc>` | Description of the project for context |
| `--task <desc>` | Task the guide accomplishes (for how-tos) |
| `--outcome <desc>` | What the user builds (for tutorials) |
| `--service <name>` | External service being integrated |
| `--platform <name>` | Target platform: docusaurus, mkdocs, mintlify |
| `--check-type-mixing` | Flag articles that mix Diátaxis content types |

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
