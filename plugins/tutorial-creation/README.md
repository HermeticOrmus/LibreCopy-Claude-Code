# Tutorial Creation Plugin

> Design and write step-by-step tutorials with clear learning paths and progressive complexity.

## Purpose

Creates structured tutorials that take learners from zero to competent. Handles learning path design, step sequencing, prerequisite identification, and the pedagogical structure that makes technical concepts stick.

## Agents

| Agent | Role |
|-------|------|
| `tutorial-architect` | Designs learning paths, sequences topics, and structures curricula |
| `step-writer` | Writes clear, tested step-by-step instructions with validation checkpoints |

## Commands

| Command | Description |
|---------|-------------|
| `/tutorial` | Create a tutorial for a specific topic or workflow |

## Skills

| Skill | Description |
|-------|-------------|
| `tutorial-structures` | Pedagogical patterns for technical tutorials |

## Usage

```
/tutorial --topic "Build a REST API with Hono"
/tutorial --topic "Deploy to Fly.io" --level beginner
/tutorial --topic "Database migrations" --prerequisites "SQL basics"
```
