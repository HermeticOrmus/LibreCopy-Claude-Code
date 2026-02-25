# Developer Guide Patterns

> Patterns for writing developer onboarding documentation, contributing guides, and integration docs.

## Knowledge Base

### The Developer Journey

Developers interact with a project through distinct phases, each needing different documentation:

```
Discover --> Evaluate --> Adopt --> Build --> Contribute --> Maintain
   |           |          |         |           |            |
 README    Quick Start  Install   Guides    CONTRIBUTING  Architecture
           + Examples   + Setup   + API       + PRs        + ADRs
```

### Getting Started: The 15-Minute Rule

A new developer should go from `git clone` to running tests in 15 minutes or less. Every minute beyond that is a barrier to contribution.

**Measure your setup time:**
1. Start a timer when running `git clone`
2. Follow your own getting-started guide exactly
3. Stop when tests pass
4. If over 15 minutes, automate or simplify

### The Prerequisites Table

Never use prose for prerequisites. Use a table:

| Tool | Minimum Version | Check Command | Install Link |
|------|----------------|---------------|-------------|
| Node.js | 20.0.0 | `node --version` | [nodejs.org](https://nodejs.org) |
| Docker | 24.0.0 | `docker --version` | [docker.com](https://docker.com) |
| PostgreSQL | 16.0 | `psql --version` | Via Docker or native |

### Contributing Guide Structure

Standard sections in order of importance:

1. **Code of Conduct** - Link to or embed the Contributor Covenant
2. **Quick Contribution Guide** - For typo fixes and small changes (minimal process)
3. **Development Setup** - How to get the project running for development
4. **How to Submit Changes** - Branch naming, commit format, PR process
5. **Code Standards** - Linting rules, formatting, naming conventions
6. **Testing Requirements** - What tests are expected with different types of changes
7. **Review Process** - What to expect after opening a PR, SLA for reviews
8. **Release Process** - How changes get from merged PR to released version
9. **Getting Help** - Where to ask questions (Discord, discussions, issues)

### Integration Documentation Structure

1. **Overview** - What the integration does, architectural diagram
2. **Prerequisites** - Accounts, credentials, access requirements
3. **Authentication** - How to authenticate (API key, OAuth, etc.)
4. **Core Setup** - Install SDK, configure client, first API call
5. **Common Operations** - CRUD operations with code examples
6. **Webhooks** - Receiving events, signature verification, payload schemas
7. **Error Handling** - Error codes, retry strategies, fallback behavior
8. **Testing** - Sandbox environments, mock servers, test credentials
9. **Troubleshooting** - Common issues and their solutions
10. **Migration** - Upgrading from previous versions

## Patterns

1. **Script Aliases**: Document `Makefile` or `package.json` script aliases so developers run `make test` not `docker compose exec app pytest --cov --tb=short -q`.
2. **Environment Variables Table**: List every env var with its purpose, required/optional status, and example value. Never just say "copy .env.example".
3. **Architecture Before Code**: In contributing guides, include a brief architecture overview so contributors understand where their change fits.
4. **Issue Labels as Onboarding**: Document issue label meanings. `good first issue`, `help wanted`, `bug`, `enhancement` should be explained.
5. **Review Checklist**: Provide a PR checklist that contributors can self-review against before requesting review.

## Anti-Patterns

1. **"It's in the code"**: Telling contributors to read the source code instead of documenting architecture. Code shows what, docs explain why.
2. **Implicit prerequisites**: Assuming everyone has Docker, Go, and PostgreSQL installed. List everything.
3. **Stale scripts**: Documenting `npm run test` when the actual command is `pnpm test`. Keep docs in sync with package.json.
4. **No first-issue path**: Contributing docs that only describe the process for major features. Include guidance for small first contributions.
5. **Setup scripts without explanation**: A `setup.sh` that does 20 things silently. Developers need to understand what setup does so they can debug when it fails.

## References

- [GitHub's Guide to CONTRIBUTING.md](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions)
- [Contributor Covenant](https://www.contributor-covenant.org/)
- [First Timers Only](https://www.firsttimersonly.com/)
- [Diataxis - How-to Guides](https://diataxis.fr/how-to-guides/)
