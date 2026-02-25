# /tutorial

> Create a complete tutorial for a specific topic, technology, or workflow.

## Trigger

`/tutorial` -- invoked when a tutorial needs to be designed and written from scratch.

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--topic <subject>` | Yes | The tutorial subject ("Build a REST API with Hono") |
| `--level <difficulty>` | No | Target audience: `beginner`, `intermediate`, `advanced` (default: `beginner`) |
| `--prerequisites <list>` | No | Comma-separated prerequisite knowledge areas |
| `--duration <minutes>` | No | Target completion time in minutes (default: 30) |
| `--output <path>` | No | Output directory for tutorial files (default: `./tutorials/`) |
| `--format <type>` | No | Output format: `markdown`, `mdx`, `notebook` (default: `markdown`) |

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
