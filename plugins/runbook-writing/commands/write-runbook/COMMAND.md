# /write-runbook

Create, validate, and test operational runbooks and incident response procedures.

## Trigger

`/write-runbook <action> [options]`

## Actions

### `create`
Generate a new runbook from an alert name or scenario description.

```bash
/write-runbook create --alert "High API error rate" --service api-server
/write-runbook create --type sop --task "Database failover"
/write-runbook create --type postmortem --incident "2024-03-15 API outage"
/write-runbook create --alert "PagerDuty: api_error_rate > 1%" --severity P2
```

### `validate`
Check an existing runbook for completeness and usability.

```bash
/write-runbook validate runbooks/api-high-error-rate.md
/write-runbook validate runbooks/ --check-commands --check-links
```

### `test`
Generate a tabletop exercise script for a runbook.

```bash
/write-runbook test runbooks/api-high-error-rate.md
/write-runbook test runbooks/ --format game-day
```

### `audit`
Audit all runbooks in a directory for freshness and gaps.

```bash
/write-runbook audit runbooks/ --max-age 90d
/write-runbook audit runbooks/ --check-alert-links --check-owners
```

## Options

| Option | Description |
|--------|-------------|
| `--alert <name>` | Alert name as it appears in PagerDuty/OpsGenie |
| `--service <name>` | Service or component this runbook covers |
| `--severity <level>` | P1/P2/P3 or SEV1/SEV2/SEV3 |
| `--type <type>` | incident, sop, break-glass, postmortem, handoff |
| `--owner <team>` | Owning team for escalation |
| `--max-age <days>` | Flag runbooks not tested within N days |

## Incident Runbook Template

```markdown
---
title: "[Alert Name] Runbook"
alert: "exact_alert_name_in_alerting_tool"
service: service-name
severity: P2
owner: platform-team
escalation: platform-oncall → platform-lead → VP Engineering
last-tested: YYYY-MM-DD
---

# [Alert Name]

## Overview

**What this covers**: [One sentence on what alert/scenario this handles]
**Impact if unresolved**: [User impact, SLA impact, revenue impact]
**Typical duration**: [How long resolution usually takes]

## Alert Context

This alert fires when [exact threshold/condition].

**SLA budget this month**: Check [status page link] before making downtime decisions.

**Common causes** (most frequent first):
1. [Most common cause] - occurs ~60% of the time
2. [Second cause] - occurs ~25% of the time
3. [Rare cause] - occurs ~15% of the time

---

## Diagnosis

### Step 1: Check service health

**Run:**
```bash
kubectl get pods -n production -l app=service-name
```

**Healthy:** All pods in `Running` state with 0 recent restarts.

**Problem indicators:**
- `CrashLoopBackOff` → Go to [Step 2](#step-2)
- `Pending` → Node scheduling issue. See [node runbook](link)
- Restart count > 10 → Repeated crashes. Check logs in Step 3.

### Step 2: Check error logs

**Run:**
```bash
kubectl logs -n production -l app=service-name --since=15m | grep -E "ERROR|FATAL"
```

**What to look for:**
- `connection refused` → Database connectivity issue. Go to [Step 3](#step-3).
- `out of memory` → Resource pressure. Go to [Scaling runbook](link).
- `certificate expired` → TLS issue. Go to [TLS runbook](link).

---

## Remediation

### Option A: Restart the service (for most causes)

> **Caution**: This causes ~30s of downtime. Verify SLA budget first.

**Run:**
```bash
kubectl rollout restart deployment/service-name -n production
```

**Verify:**
```bash
kubectl rollout status deployment/service-name -n production
# Expected: "deployment "service-name" successfully rolled out"
```

**If this fails**: Go to Option B.

### Option B: Scale up (for traffic spike)

```bash
kubectl scale deployment/service-name --replicas=5 -n production
```

**Verify**: Check [Datadog dashboard](link) for error rate dropping below 0.1%.

---

## Escalation

Escalate to `platform-lead` immediately if:
- Error rate has not dropped after 10 minutes of remediation
- Database connectivity issues persist
- You observe data loss or corruption

**When calling**: Have ready: current error rate, steps already taken, relevant log lines.

---

## Post-Resolution

1. Verify alert has resolved in PagerDuty
2. Update "last-tested" date in this runbook header
3. File a ticket for any runbook gaps you discovered: [Runbook improvements project](link)
4. If this was a significant incident (>15 min P1, >30 min P2), initiate postmortem
```

## Validation Output

```
Runbook Validation: api-high-error-rate.md

METADATA:
  [✓] Title and alert name present
  [✓] Severity and owner assigned
  [✗] Missing: last-tested date (add quarterly testing schedule)
  [✓] Escalation path defined

COMMANDS:
  [✓] All commands have expected output examples
  [✗] Missing: failure path for Step 2 command
  [✓] No placeholder substitution required

LINKS:
  [✗] Broken: Datadog dashboard link returns 404
  [✓] Escalation contacts resolve

RESULT: 3 issues. Priority: Add last-tested date + fix dashboard link.
```
