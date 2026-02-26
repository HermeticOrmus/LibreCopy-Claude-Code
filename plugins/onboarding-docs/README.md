# Onboarding Docs Plugin

> Write quickstarts, getting started guides, and onboarding checklists optimized for time-to-first-success. Reduce user drop-off at every step.

## Purpose

Creates first-time user documentation that gets developers and users to their first success as quickly as possible. The quickstart is distinguished from the full guide: one is a sprint to working state, the other is a learning journey. Covers FTUE principles, progressive disclosure, expected output blocks, copy-paste safety, and setup script documentation.

## Agents

| Agent | Role |
|-------|------|
| `onboarding-writer` | Quickstarts, getting started guides, onboarding checklists, setup documentation, time-to-first-success optimization |

## Commands

| Command | Description |
|---------|-------------|
| `/doc-onboarding create` | Generate a quickstart, getting-started guide, or checklist |
| `/doc-onboarding test` | Review for completeness, step clarity, and expected output |
| `/doc-onboarding measure` | Set up funnel measurement for onboarding completion |
| `/doc-onboarding update` | Update guide for current version, verify commands work |

## Skills

| Skill | Description |
|-------|-------------|
| `onboarding-patterns` | TTFS optimization, quickstart structure, expected output, prerequisites table, anti-patterns |

## Quick Start

```bash
# Create a quickstart for a Python CLI tool
/doc-onboarding create --type quickstart --project "Python log analysis CLI"

# Review existing quickstart
/doc-onboarding test docs/quickstart.md --time-estimate

# Create developer onboarding checklist
/doc-onboarding create --type checklist --for "new backend engineers"

# Update for new version
/doc-onboarding update docs/quickstart.md --current-version 3.0.0
```

## When to Use

- Shipping a new library, tool, or API and need a quickstart
- Existing quickstart has high user drop-off (analytics shows users leaving at step 3+)
- Onboarding a new batch of engineers and need a structured checklist
- After a major version change that breaks existing setup steps
- Setting up funnel analytics to measure onboarding conversion

## Benchmark: Good Quickstart

| Criterion | Target |
|-----------|--------|
| Time to complete | < 5 min (CLI) / < 15 min (API/SDK) |
| Prerequisites | Listed as table with verify commands |
| Commands | Copy-paste ready, no undeclared placeholders |
| Expected output | Shown after every step that produces output |
| Success definition | Explicit: "You should see X. Setup is complete." |
| Recovery paths | Top 2-3 failure modes documented per step |
