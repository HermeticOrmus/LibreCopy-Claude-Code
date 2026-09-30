# Code Comments Plugin

> Add and maintain JSDoc/TSDoc, Python docstrings (Google/NumPy/Sphinx), rustdoc, and godoc. Check documentation coverage and detect stale comments.

## Purpose

Transforms undocumented or poorly documented code into well-documented source with comments that explain **why**, not **what**. Covers documentation generation, extraction to reference docs, coverage measurement, and stale comment detection. Integrates with TypeDoc, Sphinx, rustdoc, and godoc for site generation.

## Agents

| Agent | Role |
|-------|------|
| `docstring-generator` | JSDoc/TSDoc generation, Python docstrings, rustdoc, godoc, coverage analysis, deprecation patterns |
| `comment-crafter` | Inline comments that explain why, what to comment, and comment rot prevention |

## Commands

| Command | Description |
|---------|-------------|
| `/document-code generate` | Add documentation comments to source files |
| `/document-code extract` | Extract docs into standalone reference document |
| `/document-code check-coverage` | Report documentation coverage with threshold |
| `/document-code update` | Detect and fix signature/documentation mismatches |

## Skills

| Skill | Description |
|-------|-------------|
| `docstring-patterns` | Language-specific syntax: JSDoc, Google Python, NumPy, rustdoc, godoc with concrete examples |
| `code-comment-patterns` | Why vs what principle, when to comment, TODO standards, anti-patterns |

## Quick Start

```bash
# Document a TypeScript file
/document-code generate --file src/auth.ts --style tsdoc

# Check documentation coverage (require 80% minimum)
/document-code check-coverage --dir src/ --threshold 80 --only-public

# Detect stale comments in a Python module
/document-code update --file src/processor.py

# Extract API reference from TypeScript
/document-code extract --dir src/ --output docs/api-reference.md
```

## When to Use

- Before publishing an open source library (public API surface must be documented)
- During code review when a function's contract is unclear
- Setting up documentation coverage gates in CI
- Generating Sphinx or TypeDoc sites from existing code
- Cleaning up stale TODO comments before a release

## Tooling Reference

| Tool | Language | Purpose |
|------|----------|---------|
| [TypeDoc](https://typedoc.org/) | TypeScript | Documentation site from TSDoc |
| [JSDoc](https://jsdoc.app/) | JavaScript | Documentation site from JSDoc |
| [Sphinx + autodoc](https://www.sphinx-doc.org/) | Python | Docs from Google/NumPy docstrings |
| [rustdoc](https://doc.rust-lang.org/rustdoc/) | Rust | Built-in, `cargo doc` |
| [godoc](https://pkg.go.dev/golang.org/x/tools/cmd/godoc) | Go | Built-in, `go doc` |
| [eslint-plugin-jsdoc](https://github.com/gajus/eslint-plugin-jsdoc) | JS/TS | Enforce JSDoc presence |
| [darglint](https://github.com/terrencepreilly/darglint) | Python | Validate docstrings vs signatures |
