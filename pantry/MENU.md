# Menu: LibreCopy-Claude-Code

Queue: 2026-09-30-pantry-queue.md
Counts: open 7, in flight 0, shipped 0, parked 0, dropped 0, needs fixing 0

## Steer

- none

## Up next

**ai-tells**: Add an `ai-tells` skill that flags AI writing tells in docs (queue #1, high, repo, since 2026-09-30)

- Done when: `claude plugin validate plugins/style-guides` passes, and after a clean-config install `claude plugin details style-guides@libre-copy` lists skill `ai-tells`; its `SKILL.md` gives every tell a before and after example and tells Claude to flag em dash overuse instead of deleting every em dash
- Verify on: repo
- Evidence: Map: humanizer, wshobson/agents (`avoid-ai-writing`); matrix row "AI-writing tell detection and rewrite" (Us N). X: dr_cintas, shannholmberg, hvpandya (praise); Berniverse42 (complaint about stripping every em dash). The README intro names these tells, but no plugin checks for them
- Issue: none yet (promote after merge)
- Order: ai-tells, dash-rule, agents-md, docs-drift, llms-txt, routing-evals, cross-agent-install
- Tie: ai-tells over dash-rule, by key order (jev off)

## Atoms

| Key | Title | State | Confidence | Class | Since | Queue # | Issue | Because |
|-----|-------|-------|------------|-------|-------|---------|-------|---------|
| agents-md | Add an `agents-md` skill for CLAUDE.md and AGENTS.md files | open | medium | repo | 2026-09-30 | 3 | - | - |
| ai-tells | Add an `ai-tells` skill that flags AI writing tells in docs | open | high | repo | 2026-09-30 | 1 | - | - |
| cross-agent-install | Document a `cross-agent-install` path for Codex and Gemini CLI | open | low | repo | 2026-09-30 | 7 | - | - |
| dash-rule | Reconcile the `dash-rule` in style-guide-architect with the README | open | high | repo | 2026-09-30 | 2 | - | - |
| docs-drift | Add a `docs-drift` action to the /test-docs command | open | medium | repo | 2026-09-30 | 5 | - | - |
| llms-txt | Add an `llms-txt` skill that builds llms.txt for a docs set | open | medium | repo | 2026-09-30 | 4 | - | - |
| routing-evals | Add `routing-evals` for the api-documentation sibling commands | open | medium | eval | 2026-09-30 | 6 | - | - |

## Retired

| Key | Title | State | Since | Issue | Because |
|-----|-------|-------|-------|-------|---------|
| none | | | | | |

## Notes

- none
