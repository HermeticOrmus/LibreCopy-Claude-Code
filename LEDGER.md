# Kintsugi ledger: LibreCopy-Claude-Code

Kintsugi mends broken pottery with gold, so the repair is the part you see. Here it means every crack we found in LibreCopy is written down with its evidence and the seal that closed it, so you can check the gold yourself.

A row is `hallmarked` when its seal shipped in a release that was verified by installing from GitHub into a clean config. Grades: `hairline` is copy or cosmetic, `fracture` is wrong behavior with a workaround, `break` means it did not work or broke a safety promise. IDs are never reused.

| ID | Crack | Evidence | Grade | Tracker | Seal | State |
|----|-------|----------|-------|---------|------|-------|
| K-01 | Nothing installed: the repo had no marketplace or plugin manifests, and the old `setup.sh` copied folders into `~/.claude/plugins`, where Claude Code does not load plugins from. | [PR #2][pr2], [CHANGELOG 1.0.0 L5][a5], [L8][a8], [L24][a24] | break | filed #1 | `marketplace.json` plus a `plugin.json` per plugin; `setup.sh` installs through `claude plugin`; large | hallmarked |
| K-02 | Agents and commands lived in `agents/<name>/AGENT.md` and `commands/<name>/COMMAND.md`, and the API skill was a loose `.md` file: layouts Claude Code does not load. | [PR #2][pr2], [CHANGELOG 1.0.0 L16][a16] | break | filed #1 | Moved with `git mv` to `agents/<name>.md`, `commands/<name>.md`, and `skills/api-documentation/SKILL.md`, content kept; medium | hallmarked |
| K-03 | 104 of the 105 agent, command, and skill files had no frontmatter, so Claude Code could not route to them. | [PR #2][pr2], [CHANGELOG 1.0.0 L9][a9]; count taken from `main` before the release (`18b3b70`) | break | filed #1 | A routing description on every file that says which sibling to use for what, and an `argument-hint` on every command; large | hallmarked |
| K-04 | Eleven plugins carried a second copy of the same agent or command in the old nested layout next to a flat file, and two carried two skills on the same subject. | [PR #2][pr2], [CHANGELOG 1.0.0 L17][a17] | fracture | filed #1 | Each pair is one file: every unique section merged into the one that stays, with the renames listed in the CHANGELOG; large | hallmarked |
| K-05 | `api-doc-writer` was pinned to Sonnet instead of the session's model. | [PR #2][pr2], [CHANGELOG 1.0.0 L22][a22] | fracture | filed #1 | `model: inherit`; small | hallmarked |
| K-06 | Plugin READMEs did not match the agents, commands, and skills each plugin ships. | [PR #2][pr2], [CHANGELOG 1.0.0 L23][a23] | hairline | filed #1 | Each plugin README lists what the plugin ships, with the surviving command names; small | hallmarked |
| K-07 | The hook scripts read command-line arguments, but Claude Code sends hook input as JSON on stdin, so they never received anything. | [PR #2][pr2], `hooks/pre-tool-use.sh:5` (the original, kept for reference), [CHANGELOG 1.0.0 L28][a28] | break | filed #1 | The `libre-copy-hooks` scripts read the JSON with `jq` and answer in the format Claude Code expects; medium | hallmarked |
| K-08 | The old `setup.sh` never registered the hook scripts, so they never ran. | [PR #2][pr2], [CHANGELOG 1.0.0 L28][a28] | break | filed #1 | The `libre-copy-hooks` plugin wires them through `hooks/hooks.json` and `${CLAUDE_PLUGIN_ROOT}`; medium | hallmarked |
| K-09 | The hook scripts wrote log files next to themselves. | [PR #2][pr2], `hooks/session-start.sh:5`, `hooks/post-tool-use.sh:9`, [CHANGELOG 1.0.0 L28][a28] | fracture | filed #1 | The plugin scripts write nothing to disk; small | hallmarked |
| K-10 | QUICK_START, TROUBLESHOOTING, and the beginner learning path described the old install and used command names that no longer exist. | [PR #2][pr2], [CHANGELOG 1.0.0 L25][a25] | hairline | filed #1 | All three cover the plugin install and use the real names, with an old-name to new-name map in TROUBLESHOOTING; small | hallmarked |
| K-11 | `style-guide-architect` tells Claude to use em dashes for parenthetical statements, while the README names em dash overuse as an AI writing tell. | `plugins/style-guides/agents/style-guide-architect.md:79`, `README.md:21`; [pantry queue][queue] atom 2 | fracture | Menu atom `dash-rule` | The Dashes rule defaults to commas, parentheses, or a new sentence and treats em dash overuse as a tell; small | open |
| K-12 | The README opens by naming AI writing tells (the em dash everywhere, the adjective stack, soft closes, triple bullets), but no plugin checks for them. | `README.md:21`; no file under `plugins/` names them except the rule in K-11; [pantry queue][queue] atom 1 | hairline | Menu atom `ai-tells` | An `ai-tells` skill in style-guides with a before and after example for every tell, flagging em dash overuse instead of deleting every em dash; medium | open |
| K-13 | The `libre-copy-hooks` plugin has not run inside a live Grok Build session, so its runtime behavior there is unverified. | `grok plugin validate plugins/libre-copy-hooks` passes and lists hooks (grok 1.0.44). *Inferred*: Grok's hooks guide shows a camelCase stdin envelope (`toolName`, `toolInput`, Grok tool names); fed that envelope for a `.env` edit, `pre-tool-use.sh` prints nothing, while the Claude Code envelope gets `ask`. | hairline | new | Read both envelopes (`.tool_name // .toolName`, `.tool_input // .toolInput`) and Grok tool names, then record each hook's output in a live Grok session; small | open |

[pr2]: https://github.com/HermeticOrmus/LibreCopy-Claude-Code/pull/2
[a5]: https://github.com/HermeticOrmus/LibreCopy-Claude-Code/blob/8ec68f353913bfd5cb087c621247a71f6448efe7/CHANGELOG.md?plain=1#L5
[a8]: https://github.com/HermeticOrmus/LibreCopy-Claude-Code/blob/8ec68f353913bfd5cb087c621247a71f6448efe7/CHANGELOG.md?plain=1#L8
[a9]: https://github.com/HermeticOrmus/LibreCopy-Claude-Code/blob/8ec68f353913bfd5cb087c621247a71f6448efe7/CHANGELOG.md?plain=1#L9
[a16]: https://github.com/HermeticOrmus/LibreCopy-Claude-Code/blob/8ec68f353913bfd5cb087c621247a71f6448efe7/CHANGELOG.md?plain=1#L16
[a17]: https://github.com/HermeticOrmus/LibreCopy-Claude-Code/blob/8ec68f353913bfd5cb087c621247a71f6448efe7/CHANGELOG.md?plain=1#L17
[a22]: https://github.com/HermeticOrmus/LibreCopy-Claude-Code/blob/8ec68f353913bfd5cb087c621247a71f6448efe7/CHANGELOG.md?plain=1#L22
[a23]: https://github.com/HermeticOrmus/LibreCopy-Claude-Code/blob/8ec68f353913bfd5cb087c621247a71f6448efe7/CHANGELOG.md?plain=1#L23
[a24]: https://github.com/HermeticOrmus/LibreCopy-Claude-Code/blob/8ec68f353913bfd5cb087c621247a71f6448efe7/CHANGELOG.md?plain=1#L24
[a25]: https://github.com/HermeticOrmus/LibreCopy-Claude-Code/blob/8ec68f353913bfd5cb087c621247a71f6448efe7/CHANGELOG.md?plain=1#L25
[a28]: https://github.com/HermeticOrmus/LibreCopy-Claude-Code/blob/8ec68f353913bfd5cb087c621247a71f6448efe7/CHANGELOG.md?plain=1#L28
[queue]: pantry/2026-09-30-pantry-queue.md

<p align="center"><img src="https://brand.ormus.solutions/assets/marks/kintsugi-mark.svg" alt="Kintsugi mark" width="48" /></p>
