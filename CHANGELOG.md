# Changelog

## [Unreleased]

### Added
- A public pantry (`pantry/`): a competitor map, an X mine and a people mine, each row cited, plus a pantry queue of Goal atoms with a Done-when anyone can check.
- The Menu (`pantry/MENU.md`), generated from the pantry queue, which names one atom as up next.
- Two issue forms: routing miss (Claude picked the wrong agent or skill) and plugin proposal (a new plugin, agent, skill or command), with the `routing-miss` and `plugin-proposal` labels.
- A Ways to contribute section in CONTRIBUTING.md (Menu items, routing misses, new plugins, translations, sharing what you built) with the local test loop, and a Contribute section in the README.

## [1.0.0] - 2026-09-30

The pack is now a Claude Code plugin marketplace. Before this release, `setup.sh` copied folders into `~/.claude/plugins`, where Claude Code does not load plugins from, so none of the agents, commands, or skills were reachable. From 1.0.0 every plugin installs and loads.

### Added
- Plugin marketplace `libre-copy` (`.claude-plugin/marketplace.json`) and a `plugin.json` for every plugin. Install with `/plugin marketplace add HermeticOrmus/LibreCopy-Claude-Code`, then `/plugin install <plugin>@libre-copy`.
- Frontmatter with routing descriptions on all 31 agents, 22 commands, and 28 skills. Where a plugin has more than one agent, command, or skill, the descriptions say which one to use for what, and point to the sibling for the other job. Every command carries an `argument-hint` listing its actions.
- `libre-copy-hooks`, an optional 21st plugin with three working hooks: a one-line summary of the docs toolchain at session start, a confirmation prompt before Claude reads or edits `.env`, key, or secrets files or runs commands that destroy docs or history, and post-edit checks for empty writes, the Vale or markdownlint command to run, and a matching test file.
- CI (`.github/workflows/validate.yml`) validates the marketplace and every plugin, then installs all of them into a clean config, on pushes to `main` and on pull requests.
- A feedback issue form, plus Feedback and Contributing sections in the README.
- A Commands column in the README plugin table.

### Changed
- Layout: agents moved from `agents/<name>/AGENT.md` to `agents/<name>.md`, commands from `commands/<name>/COMMAND.md` to `commands/<name>.md`, and the loose API skill to `skills/api-documentation/SKILL.md`. File contents moved with them.
- Eleven plugins carried a second copy of the same agent or command in the old nested layout next to a flat file, and two carried two skills on the same subject. Each pair is now one file: the flat file (for the two skill pairs, the fuller skill) stays, every unique section of the other is merged into it, and the other file is removed. Where the nested file covered two jobs, its sections went to the agent that does each job. Nothing was dropped.
  - Commands, old name to new: `/doc-api` → `/api-doc`, `/doc-architecture` → `/arch-doc` (its `adr` action → `/adr`), `/doc-code` → `/document-code`, `/doc-guide` → `/devguide`, `/build-readme` → `/readme`, `/write-blog` → `/blog-post`, `/create-tutorial` → `/tutorial`, `/doc-user` → `/user-doc`. The nested `/changelog`, `/release-notes`, and `/style-guide` merged into the flat commands of the same name. Every merged command keeps its actions (`validate`, `publish`, `diff`, `review`, `export`, and the rest) and its templates.
  - Agents, old name to new: `api-doc-specialist` → `api-doc-writer`; `arch-doc-writer` → `diagram-narrator` and `adr-writer`; `changelog-curator` → `changelog-writer`; `comment-engineer` → `docstring-generator` and `comment-crafter`; `readme-engineer` → `readme-architect` and `badge-specialist`; `release-notes-writer` → `release-note-writer` and `migration-guide-writer`; `style-guide-curator` → `style-guide-architect` and `terminology-manager`; `tutorial-creator` → `tutorial-architect` and `step-writer`; `user-doc-writer` → `user-guide-writer` and `faq-builder`. The nested `devguide-writer` and `tech-blogger` merged into the flat agents of the same name.
  - Skills: `developer-guide-patterns` → `devguide-patterns`; `readme-templates` → `readme-patterns`.
- Pairs that do different jobs stay separate, with descriptions that say so: `/api-docs` (design or audit a whole docs set) and `/api-doc` (generate or lint reference docs); the `api-documentation`, `api-doc-patterns`, and `openapi-patterns` skills (docs-set level, operation writing, spec design); and the paired skills in architecture-docs, code-comments, release-notes, style-guides, technical-blogging, and tutorial-creation.
- `api-doc-writer` runs on the session's model (`model: inherit`) instead of pinning Sonnet.
- Plugin READMEs list the agents, commands, and skills each plugin actually ships.
- `setup.sh` installs through the Claude Code CLI (`claude plugin marketplace add`, `claude plugin install`). New flags: `--list`, `--scope`, `--uninstall`. `--plugins-dir` is still accepted and ignored with a note.
- QUICK_START, TROUBLESHOOTING, and the beginner learning path cover the new install and use the real command names.

### Fixed
- The repository hook scripts expected command-line arguments, but Claude Code sends hook input as JSON on stdin, and the old `setup.sh` never registered them, so they never ran. They also wrote log files next to themselves. The `libre-copy-hooks` versions read the JSON with `jq`, answer in the format Claude Code expects, and write nothing to disk. The originals stay in `hooks/` for reference.

### Upgrading from 0.2.0
- Remove the old copies, which never loaded: `rm -rf ~/.claude/plugins/libre-copy-*`
- Install again with `./setup.sh` or `/plugin install <plugin>@libre-copy`, then restart Claude Code.
- If you call commands or agents by name, use the new names listed under Changed.

## [0.2.0] — 2026-05-23
- LibreUIUX doc chrome
- **api-documentation** depth-complete
- 3-tier learning paths
- 20 plugins: 1 depth-complete, 19 shell-improved

### v0.3-v0.5 priorities
- v0.3: readme-engineering, runbook-writing, tutorial-creation
- v0.4: changelog-management, error-messages, code-comments
- v0.5: technical-blogging, proposal-writing, specification-writing
