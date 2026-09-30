---
description: "Write a complete tutorial on a topic, or outline one first, review an existing tutorial for learner experience problems, or generate a quality checklist."
argument-hint: "[write|outline|review|checklist] [--topic text] [--level beginner|intermediate|advanced]"
---

# /tutorial

> Create a complete tutorial for a specific topic, technology, or workflow.

Design and write step-by-step technical tutorials with learning checkpoints and reference repositories.

## Trigger

`/tutorial` -- invoked when a tutorial needs to be designed and written from scratch.

`/tutorial <action> [options]`

With no action, `/tutorial` runs `write`, following the Process below.

## Actions

### `write`
Generate a complete tutorial for a topic or workflow.

```bash
/tutorial write --topic "Build a REST API with Hono and TypeScript"
/tutorial write --topic "Deploy to Fly.io" --level beginner
/tutorial write --topic "Database migrations with Drizzle ORM" --type howto
/tutorial write --topic "React Query for server state" --prerequisites "React hooks"
```

### `outline`
Generate a tutorial structure before writing.

```bash
/tutorial outline --topic "GraphQL API with Pothos and Prisma"
/tutorial outline --topic "Testing Express.js APIs" --sections 4
```

### `review`
Analyze an existing tutorial for completeness and learner experience.

```bash
/tutorial review tutorials/rest-api.md
/tutorial review tutorials/rest-api.md --check-steps --check-checkpoints
```

### `checklist`
Generate the tutorial quality checklist for a topic.

```bash
/tutorial checklist --topic "WebSocket server with Socket.io"
```

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--topic <subject>` | Yes | The tutorial subject ("Build a REST API with Hono") |
| `--level <difficulty>` | No | Target audience: `beginner`, `intermediate`, `advanced` (default: `beginner`) |
| `--prerequisites <list>` | No | Comma-separated prerequisite knowledge areas |
| `--duration <minutes>` | No | Target completion time in minutes (default: 30) |
| `--output <path>` | No | Output directory for tutorial files (default: `./tutorials/`) |
| `--format <type>` | No | Output format: `markdown`, `mdx`, `notebook` (default: `markdown`) |

## Options for the actions

| Option | Description |
|--------|-------------|
| `--topic <text>` | Tutorial topic or learning goal |
| `--level <level>` | beginner, intermediate, advanced |
| `--type <type>` | tutorial (learning), howto (task) |
| `--prerequisites <text>` | Required prior knowledge |
| `--sections <n>` | Target number of major sections |
| `--repo <url>` | Reference repository URL |
| `--check-steps` | Verify each step has expected output |
| `--check-checkpoints` | Verify checkpoint placement and content |

## Process

1. **Topic Analysis**
   - Identify core concepts the topic requires
   - Map concept dependencies into a learning graph
   - Determine prerequisite knowledge
   - Assess complexity relative to target level

2. **Outline Design**
   - Define 3-5 concrete learning objectives
   - Structure tutorial into 3-4 parts (setup, core, advanced, deploy/wrap-up)
   - Estimate time per section (aim for 5-15 minutes each)
   - Design checkpoints after each major section
   - Identify where screenshots or diagrams add value

3. **Content Writing**
   - Write introduction explaining what the learner will build and why
   - Write each step following the step-writer agent's format
   - Create all code files referenced in the tutorial
   - Add troubleshooting notes after failure-prone steps
   - Write section summaries connecting what was learned to what comes next

4. **Validation**
   - Walk through the tutorial mentally step by step
   - Verify code examples build on each other correctly
   - Check that no step references something not yet introduced
   - Confirm the final result matches the promised learning objectives

## Output

A tutorial directory containing:

```
tutorials/{topic-slug}/
  README.md              # Complete tutorial document
  code/                  # Finished code for reference
    src/
    package.json
  assets/                # Screenshots, diagrams
```

Console summary:
```
Tutorial Created
  Topic: Build a REST API with Hono
  Level: Beginner
  Duration: ~35 minutes
  Parts: 4 (Setup, Routes, Database, Deploy)
  Steps: 18
  Checkpoints: 4
  Output: tutorials/build-rest-api-hono/
```
## Tutorial Template

```markdown
# Build [Specific Thing] with [Technology]

> **Time**: 30-45 minutes
> **Level**: Beginner
> **Repo**: [github.com/example/tutorial](link) (with checkpoint branches)

By the end of this tutorial, you'll have a working [specific outcome].
Here is what it looks like:

```[language]
[Short code example showing the end result -- 5-10 lines]
```

## Prerequisites

**You should know:**
- [Specific prerequisite 1] ([link to resource if advanced])
- [Specific prerequisite 2]

**This tutorial does NOT teach:** [What it assumes]

**Install before starting:**
```bash
[Install commands with version requirements]
```

---

## 1. [First Section: Setup]

[One sentence on what this section accomplishes]

### Step 1: [Action]

[One sentence: why this step, what it enables]

```bash
[command]
```

**Expected output:**
```
[What the learner sees]
```

[1 sentence on what just happened]

> **Troubleshooting**: If you see `[common error]`, [cause and fix].

### Step 2: [Action]

[Pattern repeats]

#### Checkpoint: End of Section 1

Your project should now have:
- [ ] [Verifiable state 1]
- [ ] [Verifiable state 2]

Test: Run `[command]` and you should see `[expected output]`.

If something is wrong, compare with the [section-1 branch](link).

---

## 2. [Second Section: Core Implementation]

[Section intro: one sentence]

### Step 3: [Action]

[Pattern continues]

---

## 3. [Final Section: Verification and Next Steps]

### Step N: Verify everything works end-to-end

```bash
[Full integration test command]
```

**Expected output:**
```
[Complete expected output for the finished project]
```

---

## What You Built

[2-3 sentences on what the learner built and what skills they now have]

## Key Concepts

| Concept | What You Learned |
|---------|-----------------|
| [Concept 1] | [Specific insight] |
| [Concept 2] | [Specific insight] |

## Next Steps

- **Go deeper**: [Link to advanced topic]
- **Add [feature]**: [Link to related tutorial]
- **Reference**: [Link to official docs]
```

## Review Output

```
Tutorial Review: rest-api-tutorial.md

STRUCTURE:
  [✓] End result shown in opening
  [✗] Missing: time estimate
  [✓] Prerequisites section present
  [✗] Prerequisites too vague: "JavaScript basics" -- what specifically?

STEPS:
  [✓] All steps use action verbs
  [✗] Step 4 has "and" -- likely two actions (split it)
  [✗] Step 7: no expected output shown
  [✓] Steps are numbered (not bulleted)

CHECKPOINTS:
  [✓] Checkpoint after Section 1
  [✗] Missing: checkpoint after Section 2 (8 steps without verification)
  [✓] Checkpoint includes escape hatch (branch link)

TROUBLESHOOTING:
  [✗] No troubleshooting notes in any step
  [✓] Common errors identified in comments

RESULT: 6 issues. Priority: Add expected output to Step 7 + split Step 4.
```
