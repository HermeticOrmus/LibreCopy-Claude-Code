# Tutorial Creation Plugin

> Design and write step-by-step technical tutorials that keep learners in motion: always in a working state, always knowing what they built and why.

## Purpose

Most tutorials fail at step 3. The learner hits an error with no troubleshooting guidance, gets stuck in a broken state with no escape hatch, or realizes the prerequisites were wrong. This plugin applies the Diátaxis framework and proven pedagogical patterns to build tutorials with atomic steps, expected output at every step, checkpoints with reference branches, and honest prerequisites. Learners who start can finish.

## Agents

| Agent | Role |
|-------|------|
| `tutorial-creator` | Tutorial design, step writing, checkpoint placement, prerequisite analysis |

## Commands

| Command | Description |
|---------|-------------|
| `/create-tutorial write` | Generate a complete tutorial |
| `/create-tutorial outline` | Generate a tutorial structure before writing |
| `/create-tutorial review` | Analyze a tutorial for learner experience issues |
| `/create-tutorial checklist` | Generate a tutorial quality checklist |

## Skills

| Skill | Description |
|-------|-------------|
| `tutorial-patterns` | Working state principle, atomic steps, expected output, checkpoints, anti-patterns |
| `tutorial-structures` | Diátaxis framework, structure patterns (Build/Fix/Compare/Migrate), step design rules |

## Quick Start

```bash
# Write a complete tutorial
/create-tutorial write --topic "Build a REST API with Hono and TypeScript" --level beginner

# Generate an outline first
/create-tutorial outline --topic "PostgreSQL full-text search" --sections 4

# Review an existing tutorial
/create-tutorial review tutorials/rest-api.md --check-steps --check-checkpoints
```

## Tutorial Quality Checklist

Every tutorial this plugin generates:

- [ ] Shows the finished artifact before step 1 (destination first)
- [ ] Lists specific, honest prerequisites (not "basic JavaScript")
- [ ] Includes time estimate
- [ ] Every step uses an action verb and is atomic (one action each)
- [ ] Every step with observable output shows the expected output
- [ ] Troubleshooting note at the most common failure point
- [ ] Checkpoint after every 3-5 steps or section boundary
- [ ] Each checkpoint has a reference branch URL
- [ ] Project is in a working state at every section boundary
- [ ] All package versions are pinned
- [ ] Tutorial date is present

## Tutorial vs. How-to Guide

This plugin distinguishes between two document types:

| Use a Tutorial when | Use a How-to Guide when |
|--------------------|------------------------|
| Learner is new to this domain | Learner knows what they need to do |
| Goal is learning, not just doing | Goal is efficient task completion |
| Want to explain why, not just what | Steps should be minimal and focused |

`--type tutorial` (default) or `--type howto` selects the appropriate structure.
