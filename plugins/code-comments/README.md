# Code Comments Plugin

> Add meaningful comments, JSDoc annotations, docstrings, and inline documentation to source code.

## Purpose

Transforms uncommented or poorly commented code into well-documented source files. Supports JSDoc/TSDoc for TypeScript/JavaScript, Python docstrings (Google/NumPy/Sphinx style), Rust rustdoc, Go godoc, and general inline commenting best practices.

## Agents

| Agent | Role |
|-------|------|
| `comment-crafter` | Writes meaningful inline comments that explain why, not what |
| `docstring-generator` | Generates JSDoc, Python docstrings, rustdoc, and godoc annotations |

## Commands

| Command | Description |
|---------|-------------|
| `/document-code` | Add documentation comments to source code files |

## Skills

| Skill | Description |
|-------|-------------|
| `docstring-patterns` | Language-specific documentation comment syntax and conventions |

## Usage

```
/document-code --file src/auth.ts --style jsdoc
/document-code --dir src/services/ --style google-docstring
/document-code --file lib.rs --style rustdoc
```
