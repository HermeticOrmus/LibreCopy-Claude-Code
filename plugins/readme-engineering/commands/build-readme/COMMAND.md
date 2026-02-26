# /build-readme

Generate, add badges, validate, and preview README files.

## Trigger

`/build-readme <action> [options]`

## Actions

### `generate`
Generate a complete README for the current project.

```bash
/build-readme generate --type library
/build-readme generate --type cli --pkg-manager npm,yarn,pnpm
/build-readme generate --type service --include architecture-diagram
/build-readme generate --from-package package.json
```

### `badges`
Generate Shields.io badge markdown for a project.

```bash
/build-readme badges --ci github-actions --coverage codecov
/build-readme badges --registry npm --pkg package-name
/build-readme badges --all  # Generate comprehensive badge set
```

### `validate`
Check README against standard-readme spec and best practices.

```bash
/build-readme validate README.md
/build-readme validate README.md --spec standard-readme
/build-readme validate README.md --check-links --check-badges
```

### `preview`
Show what the README looks like rendered (for common elements).

```bash
/build-readme preview README.md --dark-mode
/build-readme preview README.md --social-card  # 1280x640 social preview
```

## Options

| Option | Description |
|--------|-------------|
| `--type <type>` | library, cli, service, monorepo, docs-site |
| `--pkg-manager <list>` | npm, yarn, pnpm, bun, pip, cargo, go |
| `--ci <provider>` | github-actions, circle, travis |
| `--coverage <service>` | codecov, coveralls |
| `--registry <name>` | npm, pypi, crates, hex |
| `--spec <name>` | standard-readme, none |

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
