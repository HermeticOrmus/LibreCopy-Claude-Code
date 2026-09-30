---
description: "Write a technical blog post on a topic, or outline one, review a draft for developer audience fit, or generate headline options."
argument-hint: "[write|outline|review|headline] [--topic text] [--type tutorial|case-study|comparison|announcement]"
---

# /blog-post

> Write a technical blog post on a specified topic with proper structure and SEO optimization.

Write, plan, and optimize technical blog posts for developer audiences.

## Trigger

`/blog-post` -- invoked when creating a technical article for a blog or publication.

`/blog-post <action> [options]`

With no action, `/blog-post` runs `write`, following the Process below.

## Actions

### `write`
Generate a technical blog post on a topic.

```bash
/blog-post write --topic "Building type-safe APIs with Hono and Zod"
/blog-post write --topic "How we cut deploy time from 45min to 8min" --type case-study
/blog-post write --topic "Bun vs Node.js for HTTP servers" --type comparison
/blog-post write --topic "What's new in v3.0" --type announcement
```

### `outline`
Generate a structured outline before writing.

```bash
/blog-post outline --topic "PostgreSQL full-text search vs. Elasticsearch"
/blog-post outline --topic "Building a webhook system" --type tutorial
```

### `review`
Analyze a draft post for quality, structure, and developer audience fit.

```bash
/blog-post review post.md
/blog-post review post.md --check-code --check-headlines --check-metrics
```

### `headline`
Generate headline options for a topic.

```bash
/blog-post headline --topic "Migrating from REST to GraphQL"
/blog-post headline --topic "Our Redis caching implementation" --count 5
```

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--topic <subject>` | Yes | Blog post topic or title |
| `--type <article>` | No | Article type: `tutorial`, `deep-dive`, `case-study`, `announcement`, `comparison`, `opinion` (default: `tutorial`) |
| `--audience <level>` | No | Target audience: `beginner`, `intermediate`, `advanced` (default: `intermediate`) |
| `--length <words>` | No | Target word count (default: 1500) |
| `--output <path>` | No | Output file path (default: `./blog/`) |
| `--seo` | No | Include SEO optimization pass (default: true) |

## Options for the actions

| Option | Description |
|--------|-------------|
| `--topic <text>` | Post topic or title draft |
| `--type <type>` | tutorial, deep-dive, case-study, comparison, announcement |
| `--platform <name>` | devto, hashnode, medium, company-blog |
| `--count <n>` | Number of headline variants (default: 3) |
| `--check-code` | Verify code examples have imports and output |
| `--check-metrics` | Flag unsupported performance claims |

## Process

1. **Topic Research**
   - Identify the core problem or question the post addresses
   - Determine search intent (learn, solve, compare, decide)
   - Identify primary and secondary keywords
   - Check what existing content covers this topic

2. **Outline**
   - Select article structure based on type
   - Design hook/opening that states the value proposition
   - Plan code examples and their progression
   - Identify where diagrams or tables add value

3. **Draft**
   - Write opening hook (2 sentences, specific problem or insight)
   - Develop each section with prose and code examples
   - Include working code that the reader can run
   - Add transition sentences between sections
   - Write conclusion with key takeaways

4. **SEO Pass**
   - Optimize title (under 60 characters, includes primary keyword)
   - Write meta description (120-155 characters)
   - Generate URL slug
   - Verify heading hierarchy
   - Add frontmatter with all SEO fields

5. **Quality Review**
   - Verify all code examples compile/run
   - Check that claims are substantiated
   - Ensure trade-offs are acknowledged
   - Confirm the post delivers on the title's promise

## Output

A complete markdown blog post file with frontmatter, ready for publication:

```
Blog Post Created
  Title: "Type-Safe API Validation with Zod and Hono"
  Type: Tutorial
  Words: ~1,800
  Code Blocks: 6
  Estimated Read Time: 8 minutes
  Output: blog/type-safe-api-validation-zod-hono.md
```
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
