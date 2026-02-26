# Runbook Writing Plugin

> Write operational runbooks, incident response procedures, and SOPs that work under pressure at 3am.

## Purpose

A runbook is only useful if an engineer under stress can follow it without calling anyone. This plugin generates runbooks that pass the 3AM test: findable from the alert within 30 seconds, understandable within 60 seconds, actionable within 2 minutes. Covers incident runbooks, SOPs, break-glass procedures, postmortem templates, and on-call handoff documents.

## Agents

| Agent | Role |
|-------|------|
| `runbook-writer` | Incident runbooks, SOPs, postmortems, on-call documentation |

## Commands

| Command | Description |
|---------|-------------|
| `/write-runbook create` | Generate a new runbook from alert name or scenario |
| `/write-runbook validate` | Check runbook for completeness and usability |
| `/write-runbook test` | Generate a tabletop exercise script for a runbook |
| `/write-runbook audit` | Audit all runbooks for freshness and gaps |

## Skills

| Skill | Description |
|-------|-------------|
| `runbook-patterns` | 3AM test, command documentation, escalation gates, postmortem template |

## Quick Start

```bash
# Create a runbook for a specific alert
/write-runbook create --alert "High API error rate" --service api-server --severity P2

# Create an SOP for a routine operation
/write-runbook create --type sop --task "Database failover to read replica"

# Validate an existing runbook
/write-runbook validate runbooks/api-high-error-rate.md --check-commands --check-links

# Audit all runbooks for staleness
/write-runbook audit runbooks/ --max-age 90d
```

## Runbook Quality Checklist

Every runbook this plugin generates:

- [ ] Alert name matches exactly what appears in PagerDuty/OpsGenie
- [ ] Alert description links directly to this runbook URL
- [ ] Overview section is visible without scrolling
- [ ] Common causes are listed in frequency order
- [ ] Every command has expected output for healthy and unhealthy states
- [ ] Every remediation step ends with a verification command
- [ ] Escalation conditions are deterministic (not judgment calls)
- [ ] SLA budget context is included before any downtime decision
- [ ] `last-tested` date is present in the header
- [ ] No placeholder text requiring mental substitution

## Runbook Types

| Type | Use When | Key Sections |
|------|----------|--------------|
| Incident runbook | Alert fires, on-call must respond | Alert context, diagnosis, remediation, escalation |
| SOP | Routine task that must be correct | Prerequisites, numbered steps, verification |
| Break-glass | Emergency access override | Approval required, audit trail, auto-expiry |
| Postmortem | After significant incident | Timeline, root cause, action items |
| On-call handoff | Shift transition | Current incidents, open issues, context |
