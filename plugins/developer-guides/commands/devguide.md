# /devguide

> Generate developer-facing documentation: getting started, contributing, or integration guides.

## Trigger

`/devguide` -- invoked when creating developer onboarding or contribution documentation.

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--type <guide>` | No | Guide type: `getting-started`, `contributing`, `integration`, `development` (default: `getting-started`) |
| `--service <name>` | No | Third-party service name (for integration type) |
| `--output <path>` | No | Output path (default: varies by type) |
| `--monorepo` | No | Flag for monorepo-specific guidance |

## Process

1. **Project Analysis**
   - Read package.json/Cargo.toml for project metadata and scripts
   - Scan for Docker/devcontainer configuration
   - Identify test framework and commands
   - Check for existing CONTRIBUTING.md, CODE_OF_CONDUCT.md
   - Detect CI configuration for required checks

2. **Content Generation**
   - For getting-started: Map prerequisites, clone-to-running steps, project structure overview
   - For contributing: PR process, commit conventions, code review expectations, issue templates
   - For integration: Authentication, SDK setup, webhook handling, error scenarios
   - For development: Deep dive on architecture, testing strategy, debugging tips

3. **Validation**
   - Verify all commands in code blocks match actual package.json scripts
   - Check that file paths in project structure match reality
   - Ensure prerequisites list is complete (nothing assumed)

## Output

Markdown guide file written to the appropriate location. Console summary:

```
Developer Guide Created
  Type: Contributing Guide
  Output: CONTRIBUTING.md
  Sections: 7 (Code of Conduct, How to Contribute, Development Workflow, ...)
  Scripts Referenced: 4 (test, lint, typecheck, dev)
```
