# Intermediate Learning Path - API Documentation, Style Guides & Docs-as-Code

## Overview

This path takes your technical writing from competent to professional. You will learn to document APIs so developers can integrate without support tickets, create style guides that keep teams consistent, and set up docs-as-code workflows where documentation is versioned, reviewed, and deployed like software. These are the skills that separate "someone who writes docs" from a technical writer.

## Prerequisites

- Completed the Beginner Learning Path or equivalent experience
- Familiarity with Git workflows (branches, pull requests, reviews)
- Experience reading API documentation (REST or GraphQL)
- Comfort with command-line tools

## Modules

### Module 1: API Documentation

#### Concepts

- The anatomy of an API reference: endpoints, methods, parameters, request/response bodies, status codes, authentication
- OpenAPI (Swagger) specification: describe your API in YAML/JSON, generate docs automatically
- The difference between reference docs and integration guides
- Request/response examples are not optional: developers copy-paste first, read second
- Error documentation: every error code needs a human explanation and a fix suggestion
- Authentication flows documented with sequence diagrams
- Versioning API docs: how to handle breaking changes without breaking trust
- Pagination, rate limiting, and webhooks: the parts everyone forgets to document

#### Hands-On Exercise

Document a fictional payment processing API with the following endpoints:

```
POST   /payments          - Create a payment
GET    /payments/{id}     - Get payment details
GET    /payments          - List payments (paginated)
POST   /payments/{id}/refund - Refund a payment
```

For each endpoint, write:

1. A one-line description
2. Authentication requirements
3. Request parameters with types, constraints, and defaults
4. A complete request example (curl and language SDK)
5. Success and error response examples with every possible status code
6. Rate limiting details

Then write an OpenAPI 3.0 spec for the same API. Compare the two: what does the spec capture that prose misses? What does prose capture that the spec misses?

#### Key Takeaways

- API docs are the product interface: bad docs mean lost developers
- Examples are documentation: a single working curl command teaches more than a page of prose
- Spec-first (OpenAPI) and docs-first are complementary, not competing approaches
- Document the sad paths as thoroughly as the happy paths

### Module 2: Style Guides for Technical Content

#### Concepts

- Why style guides exist: consistency reduces cognitive load
- Building on existing guides: Google Developer Documentation Style Guide, Microsoft Writing Style Guide
- Voice and tone: the difference and why both matter
- Terminology management: glossaries, approved terms, forbidden terms
- Code style in documentation: naming conventions, comment standards, example conventions
- Inclusive language: not political correctness, but precision and professionalism
- Templates: standardize structure without stifling content
- When to break the rules: style guides are guardrails, not prisons

#### Hands-On Exercise

Create a style guide for a development team. Include these sections:

1. **Voice and Tone**: Define the project's voice (e.g., "authoritative but approachable") with before/after examples
2. **Terminology**: A glossary of 15 domain-specific terms with approved usage and common mistakes
3. **Code Examples**: Rules for code samples (language, formatting, comments, error handling)
4. **Templates**: A template for documenting a new feature, including required sections
5. **Anti-patterns**: Five common writing mistakes with corrections

Test your style guide by having someone else write a short document following it. Note where they struggled or deviated. Those are the weak spots in your guide.

#### Key Takeaways

- A style guide no one follows is worse than no style guide (it creates false confidence)
- Start small: 2 pages that the team actually uses beats 50 pages that collect dust
- Review and update the style guide quarterly; language and tools evolve
- The best style guide teaches junior writers and reminds senior writers

### Module 3: Docs-as-Code Workflows

#### Concepts

- Docs-as-code philosophy: documentation lives in the repo, follows the same workflow as code
- Static site generators: MkDocs (Python), Docusaurus (JavaScript), Hugo (Go), Astro
- Content linting: Vale, markdownlint, and custom rules
- CI/CD for docs: build, lint, test links, deploy on merge
- Review workflows: documentation PRs deserve the same rigor as code PRs
- Branch-based previews: deploy preview docs for every PR
- Versioned docs: mapping documentation versions to software versions
- Search: Algolia DocSearch, Pagefind, local search implementations
- Analytics: measuring what people read, where they drop off, what they search for

#### Hands-On Exercise

Set up a complete docs-as-code pipeline:

1. Initialize a docs site using MkDocs Material or Docusaurus
2. Write three pages: a tutorial, a how-to guide, and a reference page
3. Add a `vale.ini` configuration with at least five custom rules
4. Create a GitHub Actions workflow that:
   - Lints Markdown on every PR
   - Checks for broken links
   - Builds the docs site
   - Deploys to GitHub Pages on merge to main
5. Add a `CONTRIBUTING.md` that explains the docs workflow to new contributors

Run the pipeline end-to-end. Break something intentionally and verify the CI catches it.

#### Key Takeaways

- If docs are not in the repo, they will drift from the code
- Linting catches "it works but it is wrong" problems before review
- Preview deployments make documentation review as easy as code review
- Automate everything you check manually more than twice

## Assessment

You have completed the intermediate path when you can:

1. Write API documentation that a developer can use to integrate without asking for help
2. Create an OpenAPI spec and explain where it complements prose documentation
3. Build a style guide that a team can adopt in one week
4. Set up a docs-as-code pipeline with linting, building, and automated deployment
5. Review someone else's documentation PR and provide actionable, specific feedback

## Next Steps

- Move to the **Advanced Path**: documentation systems at scale, automated generation, and content strategy
- Explore API documentation tools: Redoc, Stoplight, ReadMe
- Study how companies like Stripe, Twilio, and Vercel structure their documentation
- Learn about content reuse and single-source publishing (DITA, structured authoring)
