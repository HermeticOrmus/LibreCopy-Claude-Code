# /write-blog

Write, plan, and optimize technical blog posts for developer audiences.

## Trigger

`/write-blog <action> [options]`

## Actions

### `write`
Generate a technical blog post on a topic.

```bash
/write-blog write --topic "Building type-safe APIs with Hono and Zod"
/write-blog write --topic "How we cut deploy time from 45min to 8min" --type case-study
/write-blog write --topic "Bun vs Node.js for HTTP servers" --type comparison
/write-blog write --topic "What's new in v3.0" --type announcement
```

### `outline`
Generate a structured outline before writing.

```bash
/write-blog outline --topic "PostgreSQL full-text search vs. Elasticsearch"
/write-blog outline --topic "Building a webhook system" --type tutorial
```

### `review`
Analyze a draft post for quality, structure, and developer audience fit.

```bash
/write-blog review post.md
/write-blog review post.md --check-code --check-headlines --check-metrics
```

### `headline`
Generate headline options for a topic.

```bash
/write-blog headline --topic "Migrating from REST to GraphQL"
/write-blog headline --topic "Our Redis caching implementation" --count 5
```

## Options

| Option | Description |
|--------|-------------|
| `--topic <text>` | Post topic or title draft |
| `--type <type>` | tutorial, deep-dive, case-study, comparison, announcement |
| `--platform <name>` | devto, hashnode, medium, company-blog |
| `--count <n>` | Number of headline variants (default: 3) |
| `--check-code` | Verify code examples have imports and output |
| `--check-metrics` | Flag unsupported performance claims |

## Tutorial Post Template

```markdown
---
title: "How to [Accomplish Specific Goal] with [Technology]"
published: false
description: "In this tutorial, you'll build [specific thing]. You'll learn [skill 1], [skill 2], and [skill 3]."
tags: [technology, tutorial, webdev, javascript]
cover_image:
---

# How to [Accomplish Specific Goal] with [Technology]

[Hook: One specific problem this tutorial solves. Not "learn X" -- "build Y so that Z".]

By the end of this tutorial, you'll have [specific, concrete outcome]. Here's what it looks like:

[Screenshot or code showing the finished result]

## Prerequisites

- [Requirement 1] ([link to install/setup])
- [Requirement 2]
- Basic familiarity with [concept] ([link to resource if advanced])

## 1. [First Step]

[One sentence on why we start here.]

```language
[Complete, runnable code. Include imports.]
```

[What this code does in 1-2 sentences. What the reader should see.]

## 2. [Second Step]

[One sentence on why this step follows the previous one.]

```diff
 // existing code
+// added code shown in diff
```

[Explanation]

---

## Key Takeaways

1. [Most important thing to remember]
2. [Second most important thing]
3. [Where to go next / what to explore]

## Further Reading

- [Official docs link]
- [Related post]
```

## Case Study / Engineering Post Template

```markdown
---
title: "How We [Did X]: [Specific Result]"
published: false
description: "[2-3 sentences on the problem, approach, and result.]"
tags: [performance, engineering, tutorial, backend]
---

# How We [Did X]: [Specific Result]

[Hook: The specific pain point with a number. "Our API was taking 450ms p99. We needed 100ms."]

## Context

[What the system looks like. Constraints we were working within.]

## The Problem

[The specific issue, with before-state metrics. What was happening and why it mattered.]

| Metric | Before | Target |
|--------|--------|--------|
| p99 latency | 450ms | 100ms |
| Error rate | 2.3% | < 0.1% |

## What We Tried (Including What Didn't Work)

[Be honest about failed approaches. This is the most valuable section.]

**Approach 1: [Name]** -- Did not work because [specific reason].

**Approach 2: [Name]** -- Partial improvement but [specific limitation].

## The Solution

[What we actually did. Code-heavy. Specific.]

```language
[The key code change]
```

## Results

| Metric | Before | After | Improvement |
|--------|--------|-------|-------------|
| p99 latency | 450ms | 85ms | -81% |
| Error rate | 2.3% | 0.04% | -98% |

[Methodology: how these were measured, over what period]

## Lessons Learned

1. [What we'd do differently]
2. [What surprised us]
3. [What we'd recommend to others in this situation]
```

## Review Output

```
Post Review: migrating-to-graphql.md

STRUCTURE:
  [✓] Hook present (first 3 paragraphs)
  [✗] Missing: code example in first 25% of post
  [✓] Numbered takeaways at end
  [✓] Article type consistent (case-study structure)

CONTENT:
  [✗] Performance claim "dramatically improved" not quantified (line 47)
  [✓] Code examples include imports
  [✗] Code block at line 89 has no expected output shown
  [✓] Before/after comparison present

HEADLINE:
  [✓] Searchable and specific
  [✓] No superlatives or clickbait
  [✗] 89 characters -- consider shortening (target: < 70 for social previews)

RESULT: 4 issues. Priority: Add quantified metrics + move code example earlier.
```
