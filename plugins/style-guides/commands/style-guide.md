# /style-guide

> Create a writing style guide for a project, team, or organization.

## Trigger

`/style-guide` -- invoked when establishing or updating writing standards for documentation.

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--scope <level>` | No | Scope: `project`, `organization`, `api-docs`, `user-docs` (default: `project`) |
| `--base <guide>` | No | Base style guide to extend: `google`, `microsoft`, `stripe`, `none` (default: `google`) |
| `--voice <style>` | No | Voice: `professional`, `friendly`, `technical`, `casual` (default: `professional`) |
| `--type <section>` | No | Generate specific section: `terminology`, `formatting`, `voice`, `full` (default: `full`) |
| `--output <path>` | No | Output path (default: `docs/style-guide.md`) |

## Process

1. **Baseline Selection**
   - Load base style guide rules (Google, Microsoft, etc.)
   - Identify rules to customize for this project's audience and voice
   - Scan existing documentation for current conventions (whether documented or not)

2. **Rule Definition**
   - Define voice and tone with examples for each context
   - Establish grammar conventions (active voice, tense, person)
   - Set formatting standards (headings, lists, code, tables)
   - Build terminology glossary from project-specific terms
   - Create inclusion and accessibility guidelines

3. **Example Generation**
   - Write correct/incorrect examples for each rule
   - Use examples from the actual project documentation where possible

4. **Tooling Configuration**
   - Generate Vale configuration for automated checking
   - Create custom Vale rules for project-specific terminology

## Output

A style guide document with Vale configuration:

```
Style Guide Created
  Scope: Project
  Base: Google Developer Style Guide
  Sections: 6 (Voice, Grammar, Formatting, Terminology, Code, Accessibility)
  Rules: 34
  Vale Rules: 12 custom rules
  Output: docs/style-guide.md, .vale/styles/Project/
```
