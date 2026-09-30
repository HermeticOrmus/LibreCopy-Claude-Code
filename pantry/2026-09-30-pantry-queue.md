# Pantry queue: LibreCopy-Claude-Code

## How this fills

1. Read the latest competitor map, X mine and people mine.
2. Propose 5 to 8 Goal atoms that answer their themes. The Menu needs at least 3.
3. Each atom needs a Done predicate someone else can check on this repo, a surface, the evidence rows it answers, and a confidence (high, medium or low).
4. Save as `YYYY-MM-DD-pantry-queue.md`; the Menu reads the newest one.
5. Retire an atom only with a bullet under "Explicitly not stocked" of the form `<Title>: shipped, PR #N` or `<Title>: parked, <reason>`.

Sources for this run: [competitor map](2026-09-30-competitor-map.md), [X mine](2026-09-30-x-mine.md), [people mine](2026-09-30-people-mine.md) (no outside voices yet, so no atom cites it).

## Atoms

| # | Title | Done predicate | Surface | Evidence | Confidence |
|---|-------|----------------|---------|----------|------------|
| 1 | Add an `ai-tells` skill that flags AI writing tells in docs | `claude plugin validate plugins/style-guides` passes, and after a clean-config install `claude plugin details style-guides@libre-copy` lists skill `ai-tells`; its `SKILL.md` gives every tell a before and after example and tells Claude to flag em dash overuse instead of deleting every em dash | repo | Map: humanizer, wshobson/agents (`avoid-ai-writing`); matrix row "AI-writing tell detection and rewrite" (Us N). X: dr_cintas, shannholmberg, hvpandya (praise); Berniverse42 (complaint about stripping every em dash). The README intro names these tells, but no plugin checks for them | high |
| 2 | Reconcile the `dash-rule` in style-guide-architect with the README | `plugins/style-guides/agents/style-guide-architect.md` no longer recommends em dashes for parenthetical statements; its Dashes rule names commas, parentheses or a new sentence as the default and treats em dash overuse as a tell, matching the README intro; `claude plugin validate plugins/style-guides` passes | repo | Map: matrix row "AI-writing tell detection and rewrite", source note on line 79 of `style-guide-architect.md`. X: Berniverse42 (so the rule keeps correct em dash use) | high |
| 3 | Add an `agents-md` skill for CLAUDE.md and AGENTS.md files | `claude plugin validate plugins/developer-guides` passes and `claude plugin details developer-guides@libre-copy` lists skill `agents-md`; the skill includes a short example CLAUDE.md and a step that checks every command and path the file names still exists in the repo | repo | Map: matrix row "CLAUDE.md and AGENTS.md authoring" (Us N, wshobson/agents P); `templates/CLAUDE.md` is a blank template. X: DataChaz, dani_avila7 (complaints about bloated and stale files) | medium |
| 4 | Add an `llms-txt` skill that builds llms.txt for a docs set | `claude plugin validate plugins/content-strategy` passes and `claude plugin details content-strategy@libre-copy` lists skill `llms-txt`; the skill ships an example `llms.txt` in the https://llmstxt.org format and says which tools fetch the file and which do not | repo | Map: Mintlify; matrix row "AI-readable docs output (llms.txt, MCP)" (Us N, Mintlify Y). X: aakashgupta, dbabbs, HamelHusain (praise); kazuhito, sengineland (complaints: most files are never read, Google does not use it); zeke (agents blocked from docs) | medium |
| 5 | Add a `docs-drift` action to the /test-docs command | `plugins/documentation-testing/commands/test-docs.md` documents a `drift` action with a runnable example that lists the file paths, CLI commands and code symbols a doc names that no longer exist in the repo; `claude plugin validate plugins/documentation-testing` passes | repo | Map: matrix row "Docs testing: links and runnable examples" (Mintlify agent validates builds before its PRs); the current `freshness` action checks dates and version strings only. X: dani_avila7 (stale CLAUDE.md complaint) | medium |
| 6 | Add `routing-evals` for the api-documentation sibling commands | `plugins/api-documentation/evals/` holds cases that ask for a whole docs set and for one endpoint's reference, each grader checks which skill fired, and `claude plugin eval plugins/api-documentation` passes every case with `/api-docs` on the first kind and `/api-doc` on the second | repo | Map: matrix row "Published proof that it works (eval or blind test)" (Us N; humanizer blind test in its issue #229; wshobson/agents `plugin-eval`). The README claims each sibling's description says which one to pick; nothing tests it | medium |
| 7 | Document a `cross-agent-install` path for Codex and Gemini CLI | README gains a section that shows how to load this pack's skills in Codex or Gemini CLI with a command someone ran against this repo, and names what stays Claude Code only (agents, slash commands, hooks) | repo | Map: matrix row "Runs outside Claude Code" (Us N; humanizer, wshobson/agents, anthropics/skills, Gemini CLI docs-writer all Y). X: pors (added humanizer to Codex) | low |

## Explicitly not stocked (and why)

- A hosted docs site with a generated MCP server, as Mintlify runs: not stocked, it needs hosting and spend.
- Rewriting prose to get past AI detectors: not stocked. The pack edits for readers, and the humanizer README itself says passing detectors is not its goal.
- Paid Mintlify or other platform integrations: not stocked, they need an account and a paid plan to verify.
