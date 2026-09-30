# Competitor map: LibreCopy-Claude-Code

## How this fills

1. Name the product and its surfaces (plugins, agents, skills, commands, install paths).
2. WebSearch / WebFetch public competitor docs, READMEs and homepages: other Claude Code plugin packs and marketplaces in this domain, Cursor rules and plugins, Codex or Gemini CLI extensions, and standalone tools people use for the same job.
3. One row per competitor; blank unknowns; cite a URL per row.
4. Fill the capabilities matrix (Y / N / P / ?) with the capabilities that matter in this domain, and a source per claimed cell.
5. Save as `YYYY-MM-DD-competitor-map.md` (keep this template).

## Product

- Name: LibreCopy-Claude-Code, Claude Code plugin marketplace `libre-copy`, version 1.0.0 (`.claude-plugin/marketplace.json`).
- Flagship: `api-documentation`, the one plugin the README marks depth-complete.
- Our surfaces: 21 plugins (20 technical-writing plugins plus the optional `libre-copy-hooks`), 31 agents, 22 slash commands, 28 skills, 3 hook scripts. Install with `/plugin marketplace add HermeticOrmus/LibreCopy-Claude-Code` or `./setup.sh`. CI validates the marketplace and every plugin, then installs all of them into a clean config. Counts are from the files on `main`, read on 2026-09-30.

Star counts below come from the GitHub API (`gh api repos/<owner>/<repo>`), read on 2026-09-30.

## Map

| Competitor | What it is | Overlap with us | Watch / differentiator | Source URL |
|------------|------------|-----------------|------------------------|------------|
| blader/humanizer | Agent skill that makes AI-written text read like a person wrote it, built on Wikipedia's "Signs of AI writing". 53,087 stars. | Prose quality in READMEs, blog posts, release notes, any docs page. | One job done deeply: 26 patterns, a Claude Code plugin, and `npx skills add` for Codex, Gemini CLI and other agents. Its README cites a blind test where judges preferred its rewrite 16 times out of 16 (issue #229). | https://github.com/blader/humanizer |
| wshobson/agents | Multi-harness plugin marketplace for Claude Code, Codex, Cursor, OpenCode, GitHub Copilot, Antigravity and Pi. 40,112 stars. | Its `documentation-generation` plugin (agents api-documenter, docs-architect, mermaid-expert, reference-builder, tutorial-engineer; skills architecture-decision-records, changelog-automation, openapi-spec-generation), plus `code-documentation` and `documentation-standards`. | Ships `avoid-ai-writing` (detect-only, rewrite and edit-in-place modes) and a `plugin-eval` plugin; installs outside Claude Code. | https://github.com/wshobson/agents/tree/main/plugins/documentation-generation |
| anthropics/skills `doc-coauthoring` | Anthropic's public skill for co-writing docs, proposals, specs and decision docs in three stages: context gathering, refinement and structure, reader testing. Repo 179,153 stars. | proposal-writing, specification-writing, architecture-docs. | The Reader Testing stage checks the doc works for someone who was not in the room. Available in Claude Code, Claude.ai and the Claude API. | https://github.com/anthropics/skills/tree/main/skills/doc-coauthoring |
| Gemini CLI `docs-writer` skill | The Gemini CLI project's own skill for writing and reviewing `/docs` and `.md` files against its standards (address the reader as "you", "must" versus "we recommend", no Latin abbreviations). Repo 107,194 stars. | style-guides, developer-guides. | Shows a style guide encoded as a skill for one codebase; the same repo also carries a `docs-changelog` skill. | https://github.com/google-gemini/gemini-cli/blob/main/.gemini/skills/docs-writer/SKILL.md |
| awesome-cursorrules docs rules | Community Cursor rules, including `how-to-documentation`, `readme-best-practices` and `kubernetes-mkdocs-documentation`. Repo 40,862 stars. | readme-engineering, user-documentation. | The README rule bans "seamless", "robust" and "comprehensive" and asks for a working example in the first five lines. Rules files, not installable agents. | https://github.com/PatrickJS/awesome-cursorrules/tree/main/rules |
| Vale | Command-line prose linter that turns writing guidelines into checks in the editor and in CI, offline. 6,174 stars. | style-guides and documentation-testing both configure Vale. | The enforcement layer our agents call, not an agent itself. | https://github.com/vale-cli/vale |
| Mintlify | Hosted docs platform ("The documentation platform for agents"): OpenAPI reference pages, auto-hosted `llms.txt` and `llms-full.txt`, a generated search MCP server at `/mcp`, and an agent that opens docs pull requests (Pro or Enterprise plan). | api-documentation, content-strategy, knowledge-bases. | AI-readable output that we do not generate; a paid hosted product. | https://www.mintlify.com/docs/ai/llmstxt |

## Capabilities matrix

Mark Y / N / P (partial) / ? and cite. Rows are the capabilities that matter for this domain.

| Capability | Us | humanizer | wshobson/agents | doc-coauthoring | Gemini CLI docs-writer | Vale | Mintlify | Source notes |
|------------|----|-----------|-----------------|-----------------|------------------------|------|----------|--------------|
| API reference from OpenAPI | Y | N | Y | N | N | N | Y | Us: `plugins/api-documentation` (`/api-doc`, skill `openapi-patterns`). wshobson: agent `api-documenter`, skill `openapi-spec-generation`. Mintlify: https://www.mintlify.com/docs/api-playground/openapi-setup ("Generate interactive API documentation from OpenAPI specification files"). humanizer rewrites prose only. |
| README engineering | Y | P | ? | N | P | N | N | Us: `plugins/readme-engineering` (`/readme`, `readme-architect`, `badge-specialist`). humanizer rewrites README prose, not structure. docs-writer applies to any `.md` file. |
| Tutorials and how-tos | Y | N | Y | N | ? | N | ? | Us: `tutorial-creation`, `developer-guides`. wshobson: agent `tutorial-engineer`. |
| Changelogs and release notes from git history | Y | N | Y | N | ? | N | ? | Us: `changelog-management`, `release-notes`. wshobson: skill `changelog-automation`. |
| ADRs and architecture diagrams | Y | N | Y | P | N | N | ? | Us: `architecture-docs` (`adr-writer`, `diagram-narrator`). wshobson: skill `architecture-decision-records`, agent `mermaid-expert`. doc-coauthoring covers decision docs, not diagrams. |
| Proposals, RFCs and specs | Y | N | ? | Y | N | N | N | Us: `proposal-writing`, `specification-writing`. doc-coauthoring description: "proposals, technical specs, decision docs". |
| Style guide enforced by a linter | Y | N | ? | N | P | Y | ? | Us: `style-guides` and `documentation-testing` configure Vale. docs-writer states rules but runs no linter. Vale: https://github.com/vale-cli/vale |
| AI-writing tell detection and rewrite | N | Y | Y | N | P | ? | ? | Us: no skill does this; the README intro names the tells, and `plugins/style-guides/agents/style-guide-architect.md` line 79 recommends em dashes for parenthetical statements. wshobson: plugin `avoid-ai-writing`. docs-writer: "Avoid jargon, slang, and marketing hype." |
| Docs testing: links and runnable examples | Y | N | ? | P | N | P | P | Us: `/test-docs links`, `/test-docs examples`. doc-coauthoring: Reader Testing stage. Vale checks prose only. Mintlify agent validates builds before it opens a PR (https://www.mintlify.com/docs/agent). |
| AI-readable docs output (llms.txt, MCP) | N | N | ? | N | N | N | Y | Us: no file under `plugins/` mentions llms.txt. Mintlify: auto-hosted llms.txt and llms-full.txt (https://www.mintlify.com/docs/ai/llmstxt) and a search MCP server (https://www.mintlify.com/docs/ai/model-context-protocol). |
| CLAUDE.md and AGENTS.md authoring | N | N | P | N | N | N | ? | Us: `templates/CLAUDE.md` is a blank template; no agent or skill covers it. wshobson: `documentation-standards` describes "documentation that works efficiently for both human readers and AI models". |
| Installs from a Claude Code plugin marketplace | Y | Y | Y | Y | N | N | N | Us: `.claude-plugin/marketplace.json`. humanizer README: `/plugin marketplace add blader/humanizer`. wshobson README: `/plugin marketplace add wshobson/agents`. anthropics/skills README: `/plugin marketplace add anthropics/skills`. |
| Runs outside Claude Code | N | Y | Y | Y | Y | Y | Y | Us: README documents Claude Code installs only. humanizer: `npx skills add` for Codex and other agents. wshobson: Codex, Cursor, OpenCode, Copilot, Antigravity, Pi. anthropics/skills: Claude.ai and the API. docs-writer: Gemini CLI. Vale: standalone CLI. Mintlify: hosted. |
| Guard hooks on doc edits | Y | ? | ? | ? | N | N | N | Us: `plugins/libre-copy-hooks` (session summary, confirmation before secrets files or destructive commands, post-edit linter hint). |
| Published proof that it works (eval or blind test) | N | P | P | ? | ? | ? | ? | Us: no `evals/` folder; CI validates and installs only. humanizer: blind test in https://github.com/blader/humanizer/issues/229, cited in its README. wshobson: plugin `plugin-eval` ("Static lint for Claude Code plugins and skills, with experimental LLM scoring for skills"). |
