# Contributing

PRs welcome for plugin depth, real shipped-docs case studies, style-guide examples.

## Ways to contribute

### Take a Menu item

[`pantry/MENU.md`](pantry/MENU.md) lists the work this pack needs next and names one item as up next. Every item has a Done-when anyone can check, and comes from the cited research in [`pantry/`](pantry/README.md). Menu items that have an issue carry the `menu` label: see the [open `[menu]` issues](https://github.com/HermeticOrmus/LibreCopy-Claude-Code/issues?q=is%3Aopen+label%3Amenu). Smaller starters are listed under [good first issues](https://github.com/HermeticOrmus/LibreCopy-Claude-Code/contribute).

To claim one, comment on the issue that you are taking it, then open a pull request that says `Closes #N`.

### Report or fix a routing miss

Every agent, command and skill here has a `description` that tells Claude when to use it. When Claude picks the wrong one, or none, [report a routing miss](https://github.com/HermeticOrmus/LibreCopy-Claude-Code/issues/new?template=routing-miss.yml) with your prompt, what should have run, and what ran instead. Fixing one makes a good first pull request: sharpen the `description` in the frontmatter of the file that should have run, and of the one that ran instead if it reached too far.

### Propose or build a plugin

[Open a plugin proposal](https://github.com/HermeticOrmus/LibreCopy-Claude-Code/issues/new?template=plugin-proposal.yml) for a new plugin, agent, skill or command. To build one, follow the layout every plugin in this repo uses:

```text
plugins/<name>/
  .claude-plugin/plugin.json   name, version, description, author, homepage, repository, license, keywords
  README.md                     the agents, commands and skills the plugin ships
  agents/<agent>.md             frontmatter: name, description, model
  commands/<command>.md         frontmatter: description, argument-hint
  skills/<skill>/SKILL.md       frontmatter: name, description
```

Each agent, command and skill needs frontmatter with a routing `description`: when to use it and, where the plugin has siblings, which sibling does the other job. Then add the plugin to `.claude-plugin/marketplace.json` with `name`, `source` (`./plugins/<name>`), `description` and `version`. A new agent, command or skill inside an existing plugin needs only its own file and a line in that plugin's README.

### Translate

The docs are in English only. Translations of the README, [QUICK_START.md](QUICK_START.md) or a plugin README are welcome as a new file next to the original with a language suffix, for example `README.es.md`. Link the original in your pull request.

### Share what you built

Discussions are not switched on for this repository. Once they are, the Show and tell category is the place for docs you shipped with the pack. Until then, tell us through a [feedback issue](https://github.com/HermeticOrmus/LibreCopy-Claude-Code/issues/new?template=feedback.yml).

### Test your change locally

Load a plugin from your clone for one session, without installing it (point `--plugin-dir` at `./plugins` to load every plugin):

```bash
claude --plugin-dir ./plugins/<name>
```

Validate the marketplace and the plugin you changed:

```bash
claude plugin validate .
claude plugin validate ./plugins/<name>
```

Install from your clone into a throwaway config, the way CI does, and list what the plugin ships (commands show up under Skills):

```bash
export CLAUDE_CONFIG_DIR=$(mktemp -d)
claude plugin marketplace add ./
claude plugin install <name>@libre-copy
claude plugin details <name>@libre-copy
```

Open a new shell afterwards, or `unset CLAUDE_CONFIG_DIR`, so your own config is untouched.

CI ([`.github/workflows/validate.yml`](.github/workflows/validate.yml)) runs the same checks on every pull request: it validates the marketplace and every plugin, then installs all of them into a clean config. A first-time contributor's CI run waits until a maintainer approves it.

`feat/`, `fix/`, `deepen/<plugin>`. MIT, no CLA.
