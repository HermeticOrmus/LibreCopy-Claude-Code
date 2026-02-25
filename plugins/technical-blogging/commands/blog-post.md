# /blog-post

> Write a technical blog post on a specified topic with proper structure and SEO optimization.

## Trigger

`/blog-post` -- invoked when creating a technical article for a blog or publication.

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--topic <subject>` | Yes | Blog post topic or title |
| `--type <article>` | No | Article type: `tutorial`, `deep-dive`, `case-study`, `announcement`, `comparison`, `opinion` (default: `tutorial`) |
| `--audience <level>` | No | Target audience: `beginner`, `intermediate`, `advanced` (default: `intermediate`) |
| `--length <words>` | No | Target word count (default: 1500) |
| `--output <path>` | No | Output file path (default: `./blog/`) |
| `--seo` | No | Include SEO optimization pass (default: true) |

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
