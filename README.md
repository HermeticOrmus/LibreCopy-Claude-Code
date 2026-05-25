<p align="center">
  <img src="https://ormus.solutions/mascot/pixellab_liquid_to_book.gif" alt="LibreCopy Claude Code" width="128" style="image-rendering: pixelated;" />
</p>

<h1 align="center">LibreCopy Claude Code</h1>

<p align="center">
  <em>Technical writing and documentation engineering with Claude Code — 20 plugins for API docs, READMEs, runbooks, blog posts, and the discipline that turns AI-assisted writing into shippable docs</em>
</p>

<p align="center">
  <a href="https://github.com/HermeticOrmus/LibreCopy-Claude-Code/stargazers"><img src="https://img.shields.io/github/stars/HermeticOrmus/LibreCopy-Claude-Code?style=flat-square&color=aa8142" alt="Stars" /></a>
  <img src="https://img.shields.io/badge/Docs-aa8142?style=flat-square" alt="Docs" />
  <img src="https://img.shields.io/badge/Claude_Code-aa8142?style=flat-square&logo=anthropic&logoColor=white" alt="Claude Code" />
</p>

---

> **Skills, agents, commands, and workflows for technical writing with Claude Code.**

AI-generated documentation has tells. The em dash everywhere. The "powerful, comprehensive, world-class" adjective stack. Soft closes. Triple-bullet cataloging. Generic prose that says nothing. **LibreCopy gives Claude Code the technical-writing discipline that produces docs people actually read.**

Twenty plugins covering API docs, READMEs, runbooks, technical blogs, internal proposals, release notes, and the operational layer that makes documentation a continuous practice rather than a release-time scramble.

## The 20 plugins

| Plugin | Domain |
|---|---|
| **api-documentation** ⭐ | OpenAPI/AsyncAPI, examples, error codes, change logs |
| readme-engineering | The structure that makes READMEs useful (Diátaxis-aware) |
| developer-guides | Tutorials, how-tos, deep dives |
| tutorial-creation | Pedagogy + sequencing for newcomer onboarding |
| user-documentation | End-user docs, screenshots, video integration |
| architecture-docs | ADRs, system diagrams, technology choices |
| onboarding-docs | First-day, first-week, first-quarter onboarding |
| runbook-writing | Incident response runbooks, scheduled-action playbooks |
| changelog-management | What's worth a changelog entry, semver discipline |
| release-notes | Customer-facing changelog formatting |
| error-messages | UX writing for error states (actionable, not blame-y) |
| cli-help-text | Inline help, examples, man-page generation |
| code-comments | When to comment, what to comment, anti-patterns |
| content-strategy | Information architecture, governance, lifecycle |
| documentation-testing | Doctest-style verification; broken-link detection |
| knowledge-bases | Internal wikis, FAQ, search-first design |
| proposal-writing | RFC structure, decision-doc patterns |
| specification-writing | Technical specs, requirements, acceptance criteria |
| style-guides | Writing style, vocabulary, voice + tone |
| technical-blogging | Engineering blogs, distribution, post-mortems |

⭐ = depth-complete. Remaining 19 shell-improved.

## Quick start

```bash
git clone https://github.com/HermeticOrmus/LibreCopy-Claude-Code.git ~/projects/LibreCopy-Claude-Code
cd ~/projects/LibreCopy-Claude-Code
./setup.sh
```

```
/api-docs design API documentation for a REST API with 30 endpoints. Multiple consumers (web, mobile, partners). Need: reference docs, getting-started guide, authentication walkthrough, code samples in 3 languages, change log.
```

See [QUICK_START.md](QUICK_START.md). Learning paths: [beginner](learning-paths/beginner.md), [intermediate](learning-paths/intermediate.md), [advanced](learning-paths/advanced.md).

## See also

- [`markdown-discipline-skills`](https://github.com/HermeticOrmus/markdown-discipline-skills) — companion: strip AI-slop tells from markdown
- [`vibe-engineer-skills`](https://github.com/HermeticOrmus/vibe-engineer-skills) — how to direct AI codegen well
- [Diátaxis](https://diataxis.fr) — the canonical documentation framework

## License

MIT.

---

## Part of the Libre Open-Source Stack for Claude Code

This repository is part of a growing family of open-source toolkits for Claude Code.

### Libre suite — comprehensive plugin bundles

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
- [LibreSessionFlow-Claude-Code](https://github.com/HermeticOrmus/LibreSessionFlow-Claude-Code) — Session lifecycle: handoff, pickup, absorb, explore, close

### Skills mini-repos — single CLAUDE.md drop-ins

- [vibe-engineer-skills](https://github.com/HermeticOrmus/vibe-engineer-skills) — Direct AI codegen well: hypothesis before help, scoped prompts, validate before accepting
- [markdown-discipline-skills](https://github.com/HermeticOrmus/markdown-discipline-skills) — Strip AI-slop from markdown (no em dashes, no marketing fluff)
- [shell-safety-skills](https://github.com/HermeticOrmus/shell-safety-skills) — `set -euo pipefail` discipline plus 15 failure-mode examples
- [commit-standard-skills](https://github.com/HermeticOrmus/commit-standard-skills) — Ormus Commit Standard v1.0 plus commit-msg hook and commitlint
- [unwoke-skills](https://github.com/HermeticOrmus/unwoke-skills) — Strip AI theater (ten sins to eliminate, symmetric engagement)
- [python-conventions-skills](https://github.com/HermeticOrmus/python-conventions-skills) — Modern Python 3.11+ (types, pathlib, async, ruff, mypy, uv)
- [typescript-conventions-skills](https://github.com/HermeticOrmus/typescript-conventions-skills) — TypeScript strict mode, discriminated unions, Result types
- [hermetic-laws-skills](https://github.com/HermeticOrmus/hermetic-laws-skills) — Seven Hermetic Principles applied to engineering
- [riper-workflow-skills](https://github.com/HermeticOrmus/riper-workflow-skills) — Research / Innovate / Plan / Execute / Review systematic dev
- [six-day-cycle-skills](https://github.com/HermeticOrmus/six-day-cycle-skills) — Sustainable shipping cadence with mandatory rest
- [token-optimization-skills](https://github.com/HermeticOrmus/token-optimization-skills) — Claude Code token and context optimization
- [osint-skills](https://github.com/HermeticOrmus/osint-skills) — OSINT research methodology (multi-wave investigative spiral)
- [calcinate-skills](https://github.com/HermeticOrmus/calcinate-skills) — Stage 1 of the Magnum Opus (burn project bloat)
- [claude-md-overhaul-skills](https://github.com/HermeticOrmus/claude-md-overhaul-skills) — Audit CLAUDE.md and MEMORY.md against caps
- [session-handoff-skills](https://github.com/HermeticOrmus/session-handoff-skills) — Session handoff and pickup discipline
- [naming-skills](https://github.com/HermeticOrmus/naming-skills) — Product naming methodology (mine the brand's vocabulary)
- [magnum-opus-skills](https://github.com/HermeticOrmus/magnum-opus-skills) — Seven-stage alchemy applied to project transformation
- [mem-search-skills](https://github.com/HermeticOrmus/mem-search-skills) — Search claude-mem cross-session memory: search, filter, fetch
- [hypothesis-debugging-skills](https://github.com/HermeticOrmus/hypothesis-debugging-skills) — Hypothesis-driven debugging: reproduce, isolate, test, fix
- [vibe-proof-skills](https://github.com/HermeticOrmus/vibe-proof-skills) — Security hardening for vibe-coded full-stack apps
- [tdd-skills](https://github.com/HermeticOrmus/tdd-skills) — Test-driven development (Red-Green-Refactor) for JS/TS and Python
- [mars-skills](https://github.com/HermeticOrmus/mars-skills) — Production-readiness audit: the five mortal sins of vibe-coded MVPs
- [git-workflow-skills](https://github.com/HermeticOrmus/git-workflow-skills) — Clean git workflow: branch, atomic commits, reviewable PRs
- [code-review-skills](https://github.com/HermeticOrmus/code-review-skills) — Domain-aware code review: classify the code, then focus
- [code-comprehension-skills](https://github.com/HermeticOrmus/code-comprehension-skills) — Understand an unfamiliar codebase fast
- [dx-audit-skills](https://github.com/HermeticOrmus/dx-audit-skills) — Audit developer experience: docs, onboarding, tooling friction
- [setup-env-skills](https://github.com/HermeticOrmus/setup-env-skills) — Set up a project's development environment
- [automate-skills](https://github.com/HermeticOrmus/automate-skills) — Turn repetitive tasks into reliable automation scripts
- [quick-fix-skills](https://github.com/HermeticOrmus/quick-fix-skills) — Fast troubleshooting for common issues
- [prime-context-skills](https://github.com/HermeticOrmus/prime-context-skills) — Prime project context at the start of a session
- [auto-docs-skills](https://github.com/HermeticOrmus/auto-docs-skills) — Generate and maintain project documentation
- [learning-skills](https://github.com/HermeticOrmus/learning-skills) — Learn any technology: roadmaps, explanations, practice, cheatsheets, comparisons
- [linux-sysadmin-skills](https://github.com/HermeticOrmus/linux-sysadmin-skills) — Linux system administration: security, performance, diagnostics, monitoring, maintenance

### Template source

- [andrej-karpathy-skills](https://github.com/HermeticOrmus/andrej-karpathy-skills) — the canonical single-file CLAUDE.md pattern (fork of jiayuan_jy's original)

Star the family, not just one — that's how the suite stays coherent.
