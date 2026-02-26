# /doc-onboarding

Create, test, measure, and update onboarding documentation optimized for time-to-first-success.

## Trigger

`/doc-onboarding <action> [options]`

## Actions

### `create`
Generate a new onboarding guide or quickstart from project description.

```bash
/doc-onboarding create --type quickstart --project "Python CLI tool for log analysis"
/doc-onboarding create --type getting-started --project "REST API service" --time 15min
/doc-onboarding create --type checklist --for "new engineers joining the team"
```

### `test`
Review an existing guide for completeness, clarity, and testability.

```bash
/doc-onboarding test docs/quickstart.md
/doc-onboarding test docs/quickstart.md --simulate-clean-environment
/doc-onboarding test docs/quickstart.md --time-estimate
```

### `measure`
Set up funnel measurement for onboarding completion.

```bash
/doc-onboarding measure --platform docs-site --analytics ga4
/doc-onboarding measure --report --period 30d
```

### `update`
Detect outdated steps and update for current version.

```bash
/doc-onboarding update docs/quickstart.md --current-version 3.0.0
/doc-onboarding update docs/quickstart.md --check-commands  # Verify all commands work
```

## Options

| Option | Description |
|--------|-------------|
| `--type <type>` | quickstart, getting-started, checklist, setup-script |
| `--project <desc>` | Description of the project |
| `--time <estimate>` | Target completion time (e.g., 5min, 15min, 30min) |
| `--for <audience>` | Target audience description |
| `--current-version <v>` | Current product version for update check |
| `--check-commands` | Verify all code commands are valid |

## Quickstart Template (< 5 minutes)

```markdown
# [Product] Quickstart

**Goal**: [One sentence: what the user will have working by the end]
**Time**: ~[N] minutes

## Prerequisites

| Requirement | Check | Install |
|-------------|-------|---------|
| [Tool 1 v2+] | `tool --version` | [link] |
| [Tool 2 v1+] | `tool2 --version` | [link] |

## 1. Install

```bash
[single install command]
```

## 2. Initialize

```bash
[single init/setup command]
```

Expected:
```
[exact terminal output to confirm success]
```

## 3. Run

```bash
[run command]
```

You should see:
```
[exact expected output]
```

**[Product] is working.** You just [what they accomplished].

## Next steps

- [How to do the next common task →](link)
- [Configuration reference →](link)
- [Examples →](link)
```

## Onboarding Checklist Template

```markdown
# New [Role] Onboarding Checklist

Welcome to [Team/Company]. This checklist guides you through your first [day/week].

## Before you start

- [ ] Account created at [system] (ask [person])
- [ ] Added to [Slack channel / team]
- [ ] Local development environment set up ([link to setup guide])

## Phase 1: Get oriented (Day 1)

- [ ] Read [architecture overview](link) - 20 minutes
- [ ] Complete [quickstart](link) for [main product] - 15 minutes
- [ ] Run the test suite: `make test` - passes locally
- [ ] Review [code standards](link)

## Phase 2: First contribution (Week 1)

- [ ] Pick a `good-first-issue` from [GitHub Issues](link)
- [ ] Open a draft PR for the issue
- [ ] Get PR reviewed by [person or team]
- [ ] Merge first contribution

## Phase 3: Full productivity (Week 2)

- [ ] Complete [advanced guide](link)
- [ ] Attend [relevant recurring meeting]
- [ ] Own a [task/feature] end-to-end

## Who to ask for help

| Question about | Ask |
|----------------|-----|
| Development setup | #dev-help Slack channel |
| Product/domain questions | [person] |
| Access and permissions | [person] |
```

## Environment Variables Documentation Template

```markdown
## Environment Variables

Copy `.env.example` to `.env` and fill in the required values:

```bash
cp .env.example .env
```

| Variable | Required | Description | Example |
|----------|----------|-------------|---------|
| `DATABASE_URL` | Yes | PostgreSQL connection string | `postgres://user:pass@localhost:5432/mydb` |
| `API_KEY` | Yes | [Service] API key. Get from [dashboard link] | `sk_test_abc123...` |
| `PORT` | No | Port to run on | `3000` (default: 3000) |
| `LOG_LEVEL` | No | Log verbosity | `info` (options: debug, info, warn, error) |
| `NODE_ENV` | No | Runtime environment | `development` |
```
