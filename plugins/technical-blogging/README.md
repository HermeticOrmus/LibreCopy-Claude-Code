# Technical Blogging Plugin

> Write technical blog posts that developer audiences actually read: code-first, specific, and trustworthy.

## Purpose

Developer readers scan before they read. They look for real code, specific metrics, and honest trade-off analysis. They abandon posts that lead with marketing language, hide code after three paragraphs of theory, or make claims without evidence. This plugin produces posts that earn developer trust: specific headlines, working code examples with output shown, and engineering arguments backed by measurements.

Covers tutorials, deep dives, case studies, comparisons, and release announcements for Dev.to, Hashnode, company blogs, and other developer platforms.

## Agents

| Agent | Role |
|-------|------|
| `tech-blogger` | Technical post writing, headline generation, structure, code examples |

## Commands

| Command | Description |
|---------|-------------|
| `/write-blog write` | Write a complete technical blog post |
| `/write-blog outline` | Generate a structured outline before writing |
| `/write-blog review` | Review a draft for quality and developer audience fit |
| `/write-blog headline` | Generate headline options for a topic |

## Skills

| Skill | Description |
|-------|-------------|
| `blog-structures` | Article type structures, code example guidelines, engagement metrics |
| `tech-blogging-patterns` | Developer reading pattern, before/after, specificity standard, anti-patterns |

## Quick Start

```bash
# Write a tutorial post
/write-blog write --topic "Type-safe SQL in TypeScript with Drizzle ORM" --type tutorial

# Write an engineering case study
/write-blog write --topic "How we reduced deploy time from 45min to 8min" --type case-study

# Write a technology comparison
/write-blog write --topic "Bun vs Node.js for HTTP servers" --type comparison

# Review an existing draft
/write-blog review my-post.md --check-code --check-metrics

# Generate 5 headline options
/write-blog headline --topic "Our migration from REST to GraphQL" --count 5
```

## Post Quality Checklist

Every post this plugin generates:

- [ ] Working code example within the first 25% of the post
- [ ] All code blocks have language hints and include imports
- [ ] All code examples show expected output in comments
- [ ] Performance claims have specific metrics (not "much faster" but "60% faster at p99")
- [ ] Headline is searchable, specific, and under 70 characters
- [ ] Article type structure is consistent (tutorial vs. case study vs. comparison)
- [ ] Post includes an "Updated" date
- [ ] Ends with numbered takeaways (3-5 specific, standalone lessons)
- [ ] No unqualified superlatives ("revolutionary", "game-changing", "blazing fast")

## Article Types

| Type | Goal | Structure |
|------|------|-----------|
| Tutorial | Reader can replicate the result | Prerequisites → Steps → What you built |
| Deep Dive | Reader understands internals | Surface → Mechanics → Implications |
| Case Study | Reader learns from your experience | Problem → What failed → Solution → Results |
| Comparison | Reader can make a decision | Criteria → Analysis per option → Recommendation |
| Announcement | Reader gets started immediately | Feature → Why → Quickstart → Changelog |
