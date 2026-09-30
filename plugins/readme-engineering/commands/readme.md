---
description: "Generate or overhaul a project README from the project's metadata, or add badges, validate an existing README, or preview it."
argument-hint: "[generate|badges|validate|preview] [--type library|cli|saas|framework|plugin|monorepo]"
---

# /readme

> Generate or overhaul a project README with proper structure, badges, and content.

Generate, add badges, validate, and preview README files.

## Trigger

`/readme` -- invoked when creating a new README or restructuring an existing one.

`/readme <action> [options]`

With no action, `/readme` runs `generate`, following the Process below.

## Actions

### `generate`
Generate a complete README for the current project.

```bash
/readme generate --type library
/readme generate --type cli --pkg-manager npm,yarn,pnpm
/readme generate --type service --include architecture-diagram
/readme generate --from-package package.json
```

### `badges`
Generate Shields.io badge markdown for a project.

```bash
/readme badges --ci github-actions --coverage codecov
/readme badges --registry npm --pkg package-name
/readme badges --all  # Generate comprehensive badge set
```

### `validate`
Check README against standard-readme spec and best practices.

```bash
/readme validate README.md
/readme validate README.md --spec standard-readme
/readme validate README.md --check-links --check-badges
```

### `preview`
Show what the README looks like rendered (for common elements).

```bash
/readme preview README.md --dark-mode
/readme preview README.md --social-card  # 1280x640 social preview
```

## Input

| Parameter | Required | Description |
|-----------|----------|-------------|
| `--type <project>` | No | Project type: `library`, `cli`, `saas`, `framework`, `plugin`, `monorepo` |
| `--badges <list>` | No | Comma-separated badge types: `ci`, `coverage`, `npm`, `license`, `downloads` |
| `--sections <list>` | No | Custom section order (comma-separated) |
| `--tone <style>` | No | Writing tone: `professional`, `friendly`, `minimal` (default: `professional`) |
| `--output <path>` | No | Output path (default: `./README.md`) |

## Options for the actions

| Option | Description |
|--------|-------------|
| `--type <type>` | library, cli, service, monorepo, docs-site |
| `--pkg-manager <list>` | npm, yarn, pnpm, bun, pip, cargo, go |
| `--ci <provider>` | github-actions, circle, travis |
| `--coverage <service>` | codecov, coveralls |
| `--registry <name>` | npm, pypi, crates, hex |
| `--spec <name>` | standard-readme, none |

## Process

1. **Project Analysis**
   - Read package.json, Cargo.toml, go.mod, pyproject.toml for project metadata
   - Scan directory structure to understand project organization
   - Identify project type if not specified (library vs CLI vs app)
   - Read existing README if present (for update, not replacement)
   - Check for CI config, test setup, license file

2. **Structure Selection**
   - Choose template based on project type
   - Determine which sections are relevant (skip "Deploy" for a library)
   - Order sections by reader journey: understand, install, use, contribute
   - Identify content that can be auto-generated vs needs human input

3. **Content Generation**
   - Write title and one-line description from package metadata
   - Generate badge row based on detected services
   - Create install section from package manager config
   - Write quick start from existing examples or main exports
   - Build API overview from exported functions/classes
   - Generate contributing section from existing CONTRIBUTING.md or template
   - Add license section from LICENSE file

4. **Quality Check**
   - Verify all links are valid
   - Ensure code examples are syntactically correct
   - Check that badge URLs use correct owner/repo
   - Confirm heading hierarchy is valid (no h3 before h2)

## Output

A complete README.md file ready for the repository root. Placeholder sections are marked with `<!-- TODO: ... -->` comments for the developer to fill in.
## Shields.io Badge Reference

```markdown
<!-- Build/CI -->
![CI](https://github.com/{owner}/{repo}/actions/workflows/{workflow}.yml/badge.svg)
![CircleCI](https://circleci.com/gh/{owner}/{repo}.svg?style=shield)

<!-- Version -->
![npm](https://img.shields.io/npm/v/{package})
![PyPI](https://img.shields.io/pypi/v/{package})
![Crates.io](https://img.shields.io/crates/v/{crate})
![GitHub release](https://img.shields.io/github/v/release/{owner}/{repo})

<!-- Coverage -->
![Codecov](https://codecov.io/gh/{owner}/{repo}/branch/main/graph/badge.svg)
![Coveralls](https://coveralls.io/repos/github/{owner}/{repo}/badge.svg)

<!-- Downloads -->
![npm downloads](https://img.shields.io/npm/dm/{package})
![PyPI downloads](https://img.shields.io/pypi/dm/{package})
![Docker Pulls](https://img.shields.io/docker/pulls/{owner}/{image})

<!-- Meta -->
![License](https://img.shields.io/github/license/{owner}/{repo})
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)
![Code style](https://img.shields.io/badge/code_style-prettier-ff69b4.svg)
```

## Standard README Template (Library)

```markdown
# [Project Name]

[One sentence. Format: "[Name] is a [category] that [value proposition]."]

[![CI](https://github.com/{owner}/{repo}/actions/workflows/ci.yml/badge.svg)](https://github.com/{owner}/{repo}/actions)
[![npm version](https://img.shields.io/npm/v/{package})](https://www.npmjs.com/package/{package})
[![License](https://img.shields.io/github/license/{owner}/{repo})](./LICENSE)

## Install

```bash
npm install {package-name}
```

```bash
yarn add {package-name}
```

## Quick Start

```typescript
import { [MainExport] } from '{package-name}';

const client = new [MainExport]({ apiKey: process.env.API_KEY });
const result = await client.doSomething({ input: 'example' });
console.log(result);
```

## API

### `new [MainExport](options)`

| Option | Type | Required | Description |
|--------|------|----------|-------------|
| `apiKey` | `string` | Yes | API key from the dashboard |
| `baseUrl` | `string` | No | API base URL (default: production) |
| `timeout` | `number` | No | Request timeout in ms (default: 30000) |

### `client.doSomething(params)`

[Description]

**Parameters**: [Table or list]
**Returns**: [What it returns]
**Throws**: [What it throws]

## Configuration

See [Configuration Reference](./docs/configuration.md) for all available options.

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md).

## License

[MIT](./LICENSE) © [Author]
```
