# Contributing to LibreCopy

Welcome to the documentation knowledge commons. This repository maps how to use Claude Code for technical writing and documentation -- from inline code comments to full documentation ecosystems. Every contribution raises our shared understanding of AI-assisted technical communication.

---

## Philosophy

**Documentation is a craft, not a chore.**

Most developers treat documentation as an obligation. LibreCopy treats it as a discipline with its own principles, patterns, and quality standards. When you contribute here, you are sharing techniques that make documentation genuinely useful -- not just present.

**We teach by example.**

A repository about documentation must itself be well-documented. Every contribution is both content and demonstration. Write as if the reader will judge the advice by the quality of the prose delivering it.

---

## Guiding Principles

1. **Audience first** -- Every piece of documentation has a reader. Name them. Define what they need. Write for them, not for the abstract concept of "users."
2. **Working examples always** -- Documentation about documentation without working examples is philosophy, not instruction. Show the input, show the output, explain the mechanism.
3. **Voice matters** -- Consistent, direct, second-person voice. No marketing language. No superlatives. Say what things do, not how great they are.
4. **Teach the why** -- Instructions without reasoning produce dependency, not understanding. Explain why a technique works, not just that it does.
5. **Quality over quantity** -- One excellent prompt template teaches more than ten mediocre ones. Ruthlessly cut what does not serve the reader.

---

## Types of Contributions

### Documentation Prompts & Patterns

Prompts that consistently produce quality documentation with Claude Code.

**How to contribute:**
1. Test with Claude Code against a real project
2. Document the exact prompt and the resulting output
3. Explain why the prompt works (what makes it effective)
4. Show what the naive approach produces for comparison

**Template:**
```markdown
## [Technique Name] Prompt

### The Problem
[What documentation failure does this address?]

### The Vague Version
[What most people prompt -- and what Claude produces]

### The Precise Version
[The prompt that works -- and what Claude produces]

### Why This Works
[Technical explanation of the mechanism]

### Try This
[Exercise the reader can run immediately]

### Variations
- [Adapted for different doc types or audiences]
```

### Writing Patterns

Structural patterns for specific documentation types.

**Requirements:**
- Must include at least one complete, working example
- Must specify the target audience
- Must explain when to use this pattern vs. alternatives
- Must be tested with Claude Code

### Tool Integrations

Documentation tooling configured to work with Claude Code.

**Requirements:**
- Clear setup instructions (copy-paste runnable)
- Tool version specified
- Integration with existing doc workflows documented
- Error cases and troubleshooting included

### Real-World Examples

Case studies showing documentation improvements using LibreCopy.

**Requirements:**
- Before and after comparison
- Exact prompts used
- Reader feedback if available
- Lessons learned

### Plugins, Agents & Commands

New Claude Code extensions for documentation workflows.

**Requirements:**
- Clear scope definition (what it does and does not do)
- Usage examples with expected output
- Follows the plugin structure (agents/, commands/, skills/)
- Tested with multiple project types

---

## Contribution Process

### 1. Check Existing Work

Search issues and existing content before starting. Duplicates waste everyone's time.

### 2. Open an Issue (for significant changes)

For new plugins, agents, or substantial content additions, open an issue first to discuss scope and approach. Small fixes and documentation improvements can go directly to PR.

### 3. Fork & Branch

```bash
git clone https://github.com/YOUR-USERNAME/LibreCopy-Claude-Code.git
cd LibreCopy-Claude-Code
git checkout -b feature/your-contribution-name
```

**Branch naming:**
- `feature/` -- New content, plugins, or capabilities
- `fix/` -- Corrections, broken examples, outdated references
- `docs/` -- Documentation improvements (yes, meta-documentation)
- `example/` -- New examples or templates

### 4. Write & Test

Follow the guidelines above. Test everything with Claude Code.

### 5. Commit

```
feat(plugin): Add API documentation versioning patterns

Includes:
- Multi-version API reference template
- URL versioning vs. header versioning guidance
- Migration guide template for breaking changes
- Deprecation notice patterns with sunset dates
```

Use conventional commits: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`.

### 6. Submit PR

Open a pull request using the PR template. Include:
- Clear description of what this adds
- Who benefits from this contribution (audience)
- How you tested it
- Examples of the output

### 7. Review

Maintainers review for:
- **Writing quality** -- Is the prose clear, direct, and well-structured?
- **Audience awareness** -- Is it clear who benefits from this?
- **Working examples** -- Do all examples produce the claimed output?
- **Completeness** -- Does the contribution teach the technique, not just demonstrate it?
- **Consistency** -- Does it match the repository's voice and structure?

Feedback is collaborative. We are mapping this territory together.

---

## Content Guidelines by Difficulty

### Beginner

- Assume the reader has never written technical documentation intentionally
- Provide ready-to-use prompts and templates
- Use simple, common project types for examples (REST API, CLI tool, web app)
- Explain every concept before using it
- Emphasize "why this matters" for each technique

### Intermediate

- Assume familiarity with basic documentation types (README, API docs, changelogs)
- Introduce systematic approaches (style guides, doc-as-code, information architecture)
- Cover tooling setup and configuration
- Include automation and CI integration
- Connect individual techniques to broader documentation strategy

### Advanced

- Assume professional documentation experience
- Cover complex scenarios (versioned docs, i18n, large-scale doc ecosystems)
- Include documentation testing and validation
- Address team coordination and governance
- Provide automation for enterprise-scale documentation

---

## Writing Quality Checklist

Before submitting, verify:

- [ ] Every sentence serves a purpose (no filler, no repetition)
- [ ] Active voice throughout (not "the function is called" but "call the function")
- [ ] Second person where addressing the reader ("you" not "the user")
- [ ] Concrete language (not "various options" but name the options)
- [ ] All code examples are complete and runnable
- [ ] All prompts tested with Claude Code and output verified
- [ ] No marketing language ("powerful", "seamless", "best-in-class")
- [ ] Audience explicitly stated or obvious from context
- [ ] Document type matches content (tutorial vs. reference vs. how-to vs. explanation)
- [ ] Consistent terminology throughout (same thing = same word every time)

---

## What We Do Not Accept

- **Untested content** -- Every prompt, template, and example must be verified
- **Generic advice** -- "Write good documentation" is not a contribution
- **Incomplete examples** -- Code snippets that will not run, prompts that produce unreliable output
- **Marketing copy** -- This is a technical resource, not a sales page
- **Plagiarized content** -- Attribution is required for all referenced material

---

## Recognition

Contributors are:
- Listed in commit history and release notes
- Part of the documentation knowledge commons
- Building collective writing capability

Your contribution might be one prompt template, one style guide section, one plugin. But someone, somewhere, will write documentation that actually helps because you shared what you learned.

Documentation improves software. Clear documentation improves lives. That is worth contributing to.

---

**Share what you discover. The craft grows when knowledge flows.**

Thank you for contributing to better technical communication.
