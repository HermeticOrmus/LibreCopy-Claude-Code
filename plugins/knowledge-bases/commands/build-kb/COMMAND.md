# /build-kb

Design knowledge base structure, migrate content, optimize search, and measure performance.

## Trigger

`/build-kb <action> [options]`

## Actions

### `structure`
Design or review knowledge base taxonomy and navigation.

```bash
/build-kb structure --describe "B2B SaaS with end users, admins, and developers"
/build-kb structure --review ./kb-audit.md
/build-kb structure --platform confluence --output kb-design.md
```

### `migrate`
Plan and execute knowledge base content migration.

```bash
/build-kb migrate --from zendesk --to confluence --audit first
/build-kb migrate --plan --source ./export.json --output migration-plan.md
```

### `optimize`
Audit search performance and article findability.

```bash
/build-kb optimize --zero-results-report ./search-analytics.csv
/build-kb optimize --audit-titles ./articles/  # Check title format
/build-kb optimize --check-orphans  # Articles with no inbound links
```

### `measure`
Generate KB measurement plan and analyze health metrics.

```bash
/build-kb measure --platform zendesk --output measurement-plan.md
/build-kb measure --report --csat-data ./csat.csv --search-data ./search.csv
```

## Options

| Option | Description |
|--------|-------------|
| `--platform <name>` | confluence, notion, gitbook, zendesk, readme (affects output format) |
| `--describe <text>` | Describe the product and user types |
| `--output <path>` | Output file |
| `--audit` | Run audit before action |
| `--from <platform>` | Source platform for migration |
| `--to <platform>` | Target platform for migration |

## KB Article Template

```markdown
---
title: [Question format: "How do I...?" or task format: "Reset your password"]
tags: [billing, account, authentication, ...]
audience: [new-user | power-user | admin | developer]
product_area: [feature or area name]
last_reviewed: YYYY-MM-DD
---

# [Title]

[Summary: 1-2 sentences. What does this article help with? Include search keywords naturally.]

## [Before you begin / Prerequisites (optional)]

You'll need:
- [Requirement 1]
- [Requirement 2]

## Steps

1. Navigate to **[Location]** in the dashboard.

2. Click **[Button or link name]**.

   ![Screenshot description](screenshot.png)

3. [Continue with steps...]

   > **Note**: [Important caveat if applicable]

4. [Final step with success state]

   You should see [expected outcome].

## Troubleshooting

**[Common error message or symptom]**
[Solution]

**[Another common issue]**
[Solution]

## Related articles

- [Link to related article 1]
- [Link to related article 2]

---
*Last reviewed: [date] · [Feedback: Was this helpful? Yes / No]*
```

## Taxonomy Design Template

```markdown
# Knowledge Base Taxonomy - [Product Name]

## Top-Level Categories

Limit to 5-7. Named from user perspective (their goal, not your team structure).

| Category | User Goal | Target Audience |
|----------|-----------|----------------|
| Get Started | New to the product | New users |
| [Main feature] | [User goal] | [Audience] |
| Account & Billing | Manage their subscription | All users |
| API & Developer Docs | Build integrations | Developers |
| Troubleshooting | Fix problems | All users |

## Controlled Tag Vocabulary

Tags are a closed vocabulary. New tags require approval.

**Audience**: new-user, power-user, admin, developer
**Product area**: [list your features]
**Content type**: getting-started, how-to, faq, reference, troubleshooting, policy

## Article Lifecycle

draft → (writer) → in-review → (SME + editor) → published → [scheduled review: 6 months] → archived

## Review Schedule

- How-to articles: review every 6 months
- Reference articles: review after each release
- Policy articles: review annually with legal
- FAQ articles: review quarterly (update based on support ticket analysis)
```

## Search Optimization Checklist

```
Title format:
  [ ] Starts with action verb or "How to" or "What is"
  [ ] Contains the main search term within first 5 words
  [ ] Under 70 characters (full display in search results)

Content:
  [ ] Summary paragraph contains key synonyms and related terms
  [ ] Headings are scannable (bold the UI element names)
  [ ] Internal links to at least 2 related articles
  [ ] No internal jargon in title or summary

Metadata:
  [ ] Tags from controlled vocabulary
  [ ] Audience tag set correctly
  [ ] Last reviewed date within 6 months
```
