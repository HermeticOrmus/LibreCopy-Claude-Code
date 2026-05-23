<p align="center">
  <img src="https://ormus.solutions/mascot/librecopy_quill.png" alt="LibreCopy Claude Code" width="128" style="image-rendering: pixelated;" />
</p>

<h1 align="center">LibreCopy Claude Code</h1>

<p align="center">
  <em>Technical writing and documentation system for Claude Code -- agents, plugins, commands, and skills for developer docs that inform, teach, and endure</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/plugins-20-2aa198?style=flat-square" alt="Plugins" />
  <img src="https://img.shields.io/badge/agents-20-2aa198?style=flat-square" alt="Agents" />
  <img src="https://img.shields.io/badge/commands-20-2aa198?style=flat-square" alt="Commands" />
  <img src="https://img.shields.io/badge/skills-20-2aa198?style=flat-square" alt="Skills" />
  <a href="https://github.com/HermeticOrmus/LibreCopy-Claude-Code/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-MIT-2aa198?style=flat-square" alt="License: MIT" /></a>
</p>

<p align="center">
  <a href="https://github.com/HermeticOrmus/LibreCopy-Claude-Code/stargazers"><img src="https://img.shields.io/github/stars/HermeticOrmus/LibreCopy-Claude-Code?style=flat-square&color=2aa198" alt="Stars" /></a>
  <a href="https://github.com/HermeticOrmus/LibreCopy-Claude-Code/commits"><img src="https://img.shields.io/github/last-commit/HermeticOrmus/LibreCopy-Claude-Code?style=flat-square&color=2aa198" alt="Last Commit" /></a>
  <img src="https://img.shields.io/badge/Documentation-2aa198?style=flat-square&logo=readthedocs&logoColor=white" alt="Documentation" />
  <img src="https://img.shields.io/badge/Claude Code-2aa198?style=flat-square&logo=anthropic&logoColor=white" alt="Claude Code" />
</p>

---

> **Skills, Agents, Commands, and Workflows for Technical Writing and Documentation with Claude Code**

Stop getting flat, Wikipedia-style documentation that is technically correct but impossible to learn from. This repository provides structured, audience-aware guidance embedded directly in your Claude Code workflow -- 20 plugins across 4 documentation domains.

**Sister projects**: [LibreUIUX-Claude-Code](https://github.com/HermeticOrmus/LibreUIUX-Claude-Code) -- the same architecture applied to UI/UX development. [LibreSecOps-Claude-Code](https://github.com/HermeticOrmus/LibreSecOps-Claude-Code) -- the same architecture applied to security operations.

---

## The New Programming Paradigm

In December 2025, Andrej Karpathy observed that programming is being "dramatically refactored":

> *"I've never felt this much behind as a programmer. The profession is being dramatically refactored."*
>
> *"New vocabulary: agents, subagents, their prompts, contexts, memory, modes, permissions, tools, plugins, skills, hooks, MCP, LSP, slash commands, workflows, IDE integrations..."*

He described Claude Code as *"the first convincing demonstration of what an LLM Agent looks like"* -- a "little spirit/ghost that lives on your computer."

**LibreCopy provides the skills, agents, commands, and workflows for this new paradigm -- focused on technical writing and documentation.**

Documentation is the interface between human understanding and software capability. Unlike UI bugs that users see or security holes that attackers find, documentation failures are silent. Developers abandon libraries. Users never discover features. Teams lose institutional knowledge. Bad documentation costs are diffuse but enormous.

### Where LibreCopy Fits

| New Stack Component | LibreCopy Provides |
|---------------------|-------------------|
| **Skills** | Specialized writing knowledge (audience analysis, information architecture, voice/tone) |
| **Agents** | Task-specific documentation personas (API writer, tutorial author, changelog editor, etc.) |
| **Commands** | Slash commands for common documentation workflows |
| **Plugins** | 20 domain plugins across 4 documentation categories |
| **Workflows** | Beginner to advanced documentation learning paths |

This is not a prompt library. It is infrastructure for producing documentation that people actually read.

---

## The Problem

Claude Code has two distinct failure modes with documentation:

### Failure Mode 1: Encyclopedic Flatness

Ask Claude to write documentation and it produces text that reads like a textbook index. Every sentence has the same weight. There is no hierarchy of importance, no sense of what the reader needs first versus later, no narrative thread connecting concepts. It explains WHAT exists without explaining WHY it matters or WHEN to use it.

### Failure Mode 2: Audience Blindness

Claude writes for a single imagined reader: someone who already knows the subject but needs a reference. This produces documentation that is useless for beginners (too much assumed context) and tedious for experts (too much obvious detail). Real documentation must serve multiple audiences simultaneously or explicitly segment for them.

### What Generic Documentation Looks Like

Ask Claude Code to "write documentation" and you get:

- "This function takes X and returns Y" (without explaining when you would use it or what problem it solves)
- A README with Installation, Usage, Contributing, License sections -- and nothing else (no architecture overview, no FAQ, no migration guide, no troubleshooting)
- API docs that list every parameter with type annotations but no examples, no common patterns, no error handling guidance
- Tutorials that walk through steps without explaining the reasoning behind each choice
- Changelogs that say "updated dependencies" and "fixed bugs" without specifics

These are the documentation equivalent of boilerplate. They check the box without serving the reader.

### What LibreCopy Provides Instead

Ask LibreCopy agents to document your API and you get:

- A clear mental model of the API's architecture before diving into endpoints
- Examples for every endpoint showing the most common use case, not just the happy path
- Error responses with explanations of what causes them and how to resolve them
- Progressive disclosure: quick start for the impatient, deep reference for the thorough
- Consistent voice and terminology throughout (not three different styles because three different people contributed)

---

## What's Included

```
LibreCopy-Claude-Code/
+-- 20 Plugins         # Domain-specific documentation collections
+-- Agents             # Task-specialized documentation personas
+-- Commands           # Slash commands for Claude Code
+-- Skills             # Reusable documentation capability modules
+-- 3 Skill Levels     # Beginner -> Intermediate -> Advanced
+-- Templates          # Ready-to-use documentation configurations
```

### Plugin Categories

| Category | Plugins | Focus |
|----------|---------|-------|
| **Developer Docs** | 5 plugins | API documentation, README engineering, changelogs, developer guides, architecture docs |
| **User-Facing** | 5 plugins | Tutorials, user documentation, onboarding, knowledge bases, error messages |
| **Technical Writing** | 5 plugins | Technical blogging, style guides, content strategy, specifications, proposals |
| **Code & CLI** | 5 plugins | Code comments, CLI help text, release notes, runbooks, documentation testing |

### Skills vs Commands vs Agents

| Component | When to Use | Example |
|-----------|-------------|---------|
| **Skills** | Need documentation knowledge applied to a task | `audience-analysis` -- determines who the reader is and what they need |
| **Commands** | Quick, repeatable documentation actions | `/doc-review` -- structured review against documentation quality standards |
| **Agents** | Complex, multi-step documentation work | `api-documentation-writer` -- produces complete API reference with examples and error handling |

---

## Quick Start

### Installation Paths

**Path 1: Just Want Better Documentation Prompts?** (5 minutes)
```bash
# Browse the beginner documentation prompts
cat beginner/prompts/write-readme.md
```

**Path 2: Add Documentation Commands to Claude Code** (10 minutes)
```bash
# Copy documentation commands to your project or global config
cp -r .claude/commands/* ~/.claude/commands/
```

**Path 3: Use Specific Documentation Plugins** (15 minutes)
```bash
# Example: Add API documentation to your project
cp plugins/api-documentation/agents/* your-project/.claude/agents/
cp plugins/api-documentation/skills/*/SKILL.md your-project/.claude/skills/
```

**Path 4: Full Installation** (30 minutes)
```bash
# Clone and integrate everything
git clone https://github.com/HermeticOrmus/LibreCopy-Claude-Code.git
# Follow the advanced setup guide
```

---

## Learning Paths

### Beginner: Documentation Foundations

**Goal**: Write documentation that people actually read. Understand structure, audience, and clarity.

1. **Audience awareness** -- know who you are writing for and what they need to accomplish
2. **README structure** -- the entry point to every project, and the most important document you will write
3. **Clear prose** -- active voice, concrete language, progressive disclosure
4. **Basic formatting** -- when to use headings, lists, tables, and code blocks
5. **Documentation vocabulary** -- the terminology of technical writing

Start here: `beginner/README.md`

### Intermediate: Documentation Systems

**Goal**: Build documentation that scales. Shift from individual docs to systematic documentation architecture.

1. **Style guides** -- establish voice, tone, and terminology for consistency across contributors
2. **Doc-as-code** -- version control, CI/CD, and review processes for documentation
3. **Component library docs** -- documenting design systems, APIs, and shared components
4. **Information architecture** -- organizing documentation so readers find what they need
5. **Docs tooling** -- Docusaurus, VitePress, Sphinx, MkDocs, and their tradeoffs

Continue here: `intermediate/README.md`

### Advanced: Documentation Engineering

**Goal**: Automate documentation quality. Integrate documentation into the development lifecycle as a first-class concern.

1. **Doc automation** -- generating docs from code, schemas, and types
2. **Versioned documentation** -- maintaining docs for multiple versions simultaneously
3. **Internationalization** -- preparing documentation for translation and localization
4. **Documentation testing** -- linting prose, checking links, validating examples
5. **Content strategy** -- planning documentation across an entire product ecosystem

Master level: `advanced/README.md`

---

## Repository Structure

```
LibreCopy-Claude-Code/
+-- README.md                              # You are here
|
+-- plugins/                               # 20 domain-specific documentation plugins
|   +-- api-documentation/                 # API reference, OpenAPI, endpoint docs
|   |   +-- agents/                        # Specialized documentation agents
|   |   +-- commands/                      # Slash commands
|   |   +-- skills/                        # Reusable skill modules
|   +-- readme-engineering/                # README structure, badges, sections
|   +-- changelog-management/              # Keep a Changelog, semantic versioning
|   +-- developer-guides/                  # Getting started, architecture, contributing
|   +-- architecture-docs/                 # ADRs, system diagrams, data flow
|   +-- tutorial-creation/                 # Step-by-step learning content
|   +-- user-documentation/                # End-user guides, feature docs
|   +-- onboarding-docs/                   # First-run experience, setup guides
|   +-- knowledge-bases/                   # FAQ, troubleshooting, how-to articles
|   +-- error-messages/                    # Error copy, help text, recovery guidance
|   +-- technical-blogging/                # Dev blog posts, case studies, announcements
|   +-- style-guides/                      # Voice, tone, terminology, formatting rules
|   +-- content-strategy/                  # Documentation planning and governance
|   +-- specification-writing/             # RFCs, design docs, technical specs
|   +-- proposal-writing/                  # Project proposals, ADRs, decision records
|   +-- code-comments/                     # Inline docs, JSDoc, docstrings, annotations
|   +-- cli-help-text/                     # --help output, man pages, command docs
|   +-- release-notes/                     # Version announcements, migration guides
|   +-- runbook-writing/                   # Operational procedures, incident playbooks
|   +-- documentation-testing/             # Link checking, prose linting, example validation
|
+-- beginner/                              # Start here if new to technical writing
|   +-- README.md                          # Beginner guide overview
|   +-- writing-vocabulary.md              # Core documentation terminology
|   +-- prompts/                           # Ready-to-use documentation prompts
|   |   +-- write-readme.md                # README prompt comparison
|   +-- checklist.md                       # Pre-writing checklist
|
+-- intermediate/                          # Build documentation systems
|   +-- README.md                          # Intermediate guide overview
|
+-- advanced/                              # Documentation engineering
|   +-- README.md                          # Advanced guide overview
|
+-- templates/                             # Copy-paste templates
|   +-- CLAUDE.md                          # Documentation-focused project config
|
+-- hooks/                                 # Claude Code hooks for documentation
|   +-- session-start.sh                   # Detect doc tools and config
|   +-- pre-tool-use.sh                    # Consistency warnings
|   +-- post-tool-use.sh                   # Quality checks
|
+-- .claude/                               # Claude Code configuration
    +-- commands/                           # Global documentation slash commands
```

### All 20 Plugins

<details>
<summary>Click to expand full plugin list</summary>

**Developer Docs**

| Plugin | Focus Area |
|--------|------------|
| api-documentation | OpenAPI specs, endpoint reference, request/response examples, error catalogs, authentication guides |
| readme-engineering | Project README structure, badges, quick starts, feature lists, contribution guidelines |
| changelog-management | Keep a Changelog format, semantic versioning, migration notes, breaking change documentation |
| developer-guides | Getting started guides, architecture overviews, environment setup, development workflows |
| architecture-docs | Architecture Decision Records, system diagrams, data flow documentation, component relationships |

**User-Facing**

| Plugin | Focus Area |
|--------|------------|
| tutorial-creation | Step-by-step tutorials, learning paths, progressive complexity, hands-on exercises |
| user-documentation | Feature guides, workflow documentation, screenshot annotation, user journeys |
| onboarding-docs | First-run experience, setup wizards, configuration guides, quickstart paths |
| knowledge-bases | FAQ authoring, troubleshooting trees, how-to articles, searchable help content |
| error-messages | User-facing error copy, recovery instructions, contextual help, status page communication |

**Technical Writing**

| Plugin | Focus Area |
|--------|------------|
| technical-blogging | Developer blog posts, release announcements, case studies, engineering culture posts |
| style-guides | Voice and tone guidelines, terminology glossaries, formatting standards, example conventions |
| content-strategy | Documentation roadmaps, content audits, information architecture, governance models |
| specification-writing | RFCs, technical specifications, protocol documentation, interface contracts |
| proposal-writing | Project proposals, ADRs, design documents, decision records, feasibility studies |

**Code & CLI**

| Plugin | Focus Area |
|--------|------------|
| code-comments | Inline documentation, JSDoc/TSDoc, Python docstrings, Go doc comments, annotation standards |
| cli-help-text | --help output, man pages, command reference, flag documentation, usage examples |
| release-notes | Version announcements, upgrade guides, deprecation notices, migration paths |
| runbook-writing | Operational procedures, incident response playbooks, deployment checklists, monitoring guides |
| documentation-testing | Link validation, prose linting (Vale, textlint), code example testing, accessibility checks |

</details>

---

## Key Principles

Documentation is not a feature. It is the interface between your software and every person who will ever use, maintain, extend, or debug it. Treat documentation prompting with the same rigor you apply to code.

### DO: Specify Your Audience

```
-- Instead of:
"Write documentation for this API"

-- Say:
"Write API documentation for the /users endpoint targeting two audiences:
(1) Frontend developers integrating user management into a React SPA --
they need authentication flow, request/response examples with fetch(),
and error handling patterns. (2) Backend developers maintaining the
endpoint -- they need the data model, validation rules, rate limiting
behavior, and database query patterns."
```

**Why it works**: Documentation without a defined audience serves no one well. When you name the reader, the content, examples, and level of detail follow naturally. A frontend developer does not need to know about database indexes. A backend maintainer does not need React examples.

### DO: Define the Document Type

```
-- Instead of:
"Document this feature"

-- Say:
"Write a tutorial for the webhook feature. The reader has never used
webhooks before. Structure as: (1) What webhooks are and why you would
use them, (2) Setting up your first webhook with a working example,
(3) Testing the webhook locally using ngrok, (4) Common patterns
(retry logic, signature verification, idempotency), (5) Troubleshooting
delivery failures. Include complete, runnable code for each step."
```

**Why it works**: "Documentation" is not one thing. A tutorial, a reference, a how-to guide, and an explanation are four fundamentally different document types (see Diataxis framework). Each has different structure, different tone, and different success criteria. Naming the type gives Claude the right template.

### DO: Specify Voice and Constraints

```
-- Instead of:
"Write a README for this project"

-- Say:
"Write a README for this project using direct, second-person voice
('you' not 'the user'). Constraints: (1) The first paragraph must
explain what the project does and who it is for in 3 sentences or
fewer. (2) Installation must include prerequisites and be copy-paste
runnable. (3) Include a 'Quick Start' that gets the reader to a
working result in under 2 minutes. (4) Use concrete examples, not
abstract descriptions. (5) No marketing language -- state capabilities,
not superlatives."
```

**Why it works**: Voice creates consistency and trust. Constraints prevent the document from ballooning into a wall of text. "No marketing language" stops Claude from writing "powerful, flexible, and easy-to-use" and forces it to describe actual capabilities.

### DO: Demand Working Examples

```
-- Instead of:
"Add examples to the documentation"

-- Say:
"For each API endpoint, provide a complete, copy-paste example using
curl that: (1) includes all required headers including authentication,
(2) shows a realistic request body (not { 'key': 'value' }),
(3) shows the actual response body with realistic data,
(4) shows at least one error response with the most common cause,
(5) can be run against the staging environment at api.staging.example.com."
```

**Why it works**: Non-working examples are worse than no examples. They waste the reader's time debugging the documentation instead of learning the API. Requiring runnable examples forces accuracy.

### DON'T: Accept Documentation Theater

- ~~"Add comments to the code"~~ without specifying what to comment (public API) and what not to (obvious implementations)
- ~~"Write a user guide"~~ without defining user personas and their goals
- ~~"Document the architecture"~~ without specifying for whom (new team members, auditors, future maintainers)
- ~~"Update the docs"~~ without specifying what changed and which documents are affected
- ~~"Make it beginner-friendly"~~ -- there is no universal beginner. Specify: "Someone who knows JavaScript but has never used our library"

### DON'T: Confuse Completeness with Quality

Complete documentation that nobody reads is waste. A README with 30 sections is not better than one with 8 focused sections. An API reference with every internal method exposed is not better than one covering the public surface area with excellent examples. Documentation quality is measured by whether readers accomplish their goals, not by word count.

---

## Contributing

Documentation is a craft. It improves through practice, feedback, and community knowledge. This repository stays relevant through contributions from people who care about clear communication.

### What We Need

**Prompt Discoveries**
- Found a phrasing that consistently produces well-structured docs? Share it.
- Discovered how to get Claude to write for a specific audience? Document the technique.
- Figured out how to maintain consistent voice across long documents? PR it.

**Real-World Examples**
- Documented an API and the result was excellent? Show the prompt and output.
- Built a documentation pipeline with CI? Document the architecture.
- Used doc agents for a real project? Share the methodology (sanitized).

**Tool Integration**
- Built a documentation command for Claude Code? Share it.
- Integrated a doc linter into a Claude Code workflow? Document the setup.
- Created a docs-as-code pipeline? PR it.

**Writing Patterns**
- Identified a documentation antipattern Claude produces? Show the before and after.
- Found an effective template for a specific doc type? Share the structure.
- Discovered how to get consistent terminology across documents? Write it up.

### Contribution Guidelines

1. **Clarity is non-negotiable** -- documentation about documentation must be exemplary. Every sentence must earn its place. Every example must work. Every instruction must be testable.

2. **Specify the audience** -- who is this contribution for? Beginners writing their first README? Teams building documentation systems? Solo developers who need quick templates?

3. **Include examples** -- abstract advice about documentation is ironic. Show the technique with real, working output.

4. **Test with Claude Code** -- prompts should work as written, agents should produce usable output, commands should execute successfully.

5. **Follow the voice** -- direct, precise, second-person. No marketing language. No superlatives. State what things do, not how great they are.

### Review Process

PRs are reviewed for:
- Technical accuracy (does the advice produce good documentation?)
- Audience awareness (is it clear who benefits from this contribution?)
- Actionable value (can readers apply it immediately?)
- Writing quality (the contribution itself must be well-written)

---

## Resources

### Documentation Frameworks
- [Diataxis](https://diataxis.fr/) -- A systematic framework for technical documentation (tutorials, how-tos, reference, explanation)
- [Google Developer Documentation Style Guide](https://developers.google.com/style) -- Comprehensive style guide for developer docs
- [Microsoft Writing Style Guide](https://learn.microsoft.com/en-us/style-guide/) -- Accessible, inclusive writing standards
- [Write the Docs](https://www.writethedocs.org/) -- Community for people who care about documentation

### Documentation Tools
- [Docusaurus](https://docusaurus.io/) -- React-based documentation framework
- [VitePress](https://vitepress.dev/) -- Vite-powered static site generator for docs
- [Sphinx](https://www.sphinx-doc.org/) -- Python documentation generator
- [MkDocs](https://www.mkdocs.org/) -- Markdown-based documentation with Material theme
- [Vale](https://vale.sh/) -- Prose linter for technical writing
- [Storybook](https://storybook.js.org/) -- Component documentation and playground

### Official Documentation
- [Claude Code Docs](https://docs.claude.com/en/docs/claude-code)
- [Anthropic Prompt Engineering](https://docs.anthropic.com/en/docs/prompt-engineering)

### Hands-On Practice
- [Write the Docs Learning Resources](https://www.writethedocs.org/guide/) -- Free learning path for technical writing
- [Google Technical Writing Courses](https://developers.google.com/tech-writing) -- Free, structured courses
- [The Good Docs Project](https://thegooddocsproject.dev/) -- Templates for creating quality documentation

---

## Attribution & Inspiration

The framing of this repository was inspired by [Andrej Karpathy's](https://karpathy.ai/) observations about the transformation of programming in the AI era:

**Key Sources:**
- [LLMs as a New Computing Platform (2025 Year in Review)](https://karpathy.ai/blog/2025-llm-os.html) -- Karpathy's comprehensive analysis of how LLMs are becoming a new computing paradigm
- [X/Twitter Thread on the New Vocabulary](https://x.com/karpathy/status/1872411236358504787) -- The December 2025 post describing "agents, subagents, prompts, contexts, memory, modes, permissions, tools, plugins, skills, hooks, MCP, LSP, slash commands, workflows"

**On Claude Code specifically:**
> *"Claude Code is the first convincing demonstration of what an LLM Agent looks like... a little spirit/ghost that lives on your computer, can inspect files, use a browser, can be told to 'just fix all the build errors', or 'write tests for this file'."*

This repository applies that paradigm to the domain that makes all other domains accessible: documentation. The skills, agents, commands, and workflows here are built to produce documentation that a reader trusts, learns from, and returns to -- not documentation that merely exists.

---

## License

MIT License

Copyright (c) 2025-2026 Hermetic Ormus

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

---

## Star This Repo

If LibreCopy helps you write better documentation with Claude Code, star the repository. It helps other developers discover these resources.

---

**Built by developers who believe documentation is a craft, not an afterthought. Building the new programming paradigm, one clear sentence at a time.**

---

## Part of the Libre Open-Source Stack for Claude Code

This repository is part of a growing family of open-source toolkits for Claude Code, each focused on a specific lane:

- [LibreUIUX-Claude-Code](https://github.com/HermeticOrmus/LibreUIUX-Claude-Code) — UI/UX development (152 agents, 70 plugins, 76 commands, 74 skills)
- [LibreArch-Claude-Code](https://github.com/HermeticOrmus/LibreArch-Claude-Code) — Software architecture and system design
- [LibreDevOps-Claude-Code](https://github.com/HermeticOrmus/LibreDevOps-Claude-Code) — DevOps engineering and infrastructure automation
- [LibreEmbed-Claude-Code](https://github.com/HermeticOrmus/LibreEmbed-Claude-Code) — Embedded systems, firmware, and IoT development
- [LibreFinTech-Claude-Code](https://github.com/HermeticOrmus/LibreFinTech-Claude-Code) — Financial technology development
- [LibreGEO-Claude-Code](https://github.com/HermeticOrmus/LibreGEO-Claude-Code) — AI-search optimization (ChatGPT, Perplexity, Gemini, Google AI Overviews)
- [LibreGameDev-Claude-Code](https://github.com/HermeticOrmus/LibreGameDev-Claude-Code) — Game development across Godot, Unity, Unreal
- [LibreMLOps-Claude-Code](https://github.com/HermeticOrmus/LibreMLOps-Claude-Code) — ML engineering and AI operations
- [LibreMobileDev-Claude-Code](https://github.com/HermeticOrmus/LibreMobileDev-Claude-Code) — Mobile app development (Flutter, React Native, native iOS, native Android)
- [LibreSecOps-Claude-Code](https://github.com/HermeticOrmus/LibreSecOps-Claude-Code) — Security operations

Star the family, not just one — that's how the suite stays coherent.
