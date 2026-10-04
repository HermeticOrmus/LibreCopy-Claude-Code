# Install from a clone with setup.sh

A user who cloned LibreCopy-Claude-Code runs `./setup.sh` to register the checkout as a marketplace and install its plugins through the Claude Code CLI, or through Grok Build with `--grok`. The script can also list the pack, install a subset and uninstall.

## Sub-features

- `setup-list` prints the plugins in the pack.
- `setup-only` installs only the named plugins.
- `setup-all` installs every plugin.
- `setup-grok` does the same through the Grok Build CLI.
- `setup-uninstall` removes the pack's plugins and its marketplace.

## How to get to it (user POV)

- `git clone https://github.com/HermeticOrmus/LibreCopy-Claude-Code.git`, then `cd LibreCopy-Claude-Code` and `./setup.sh`.
- `./setup.sh --list`, `./setup.sh --only api-documentation`, `./setup.sh --grok`, `./setup.sh --uninstall`.
- `./setup.sh --help` prints the options.

## Driving it with control-libre-copy

Preconditions:

- A run with clean configs exists. Start one with `.grok/skills/verify-libre-copy/bin/control-libre-copy install --claude --only api-documentation` (or any `install`), so `setup.sh` runs against empty configs.

- **List the pack.** Run `.grok/skills/verify-libre-copy/bin/control-libre-copy setup --list`. The log lists the plugins in `.claude-plugin/marketplace.json` and ends in `exit 0`.
- **Install a subset.** Run `.grok/skills/verify-libre-copy/bin/control-libre-copy setup --only api-documentation`. The log ends in `exit 0`, and `CLAUDE_CONFIG_DIR="$(readlink -f ~/.local/share/verify-libre-copy/runs/latest)/scratch/claude-config" claude plugin list` shows `api-documentation@libre-copy` enabled.
- **Grok mode.** Run `.grok/skills/verify-libre-copy/bin/control-libre-copy setup --grok --only api-documentation`. The log ends in `exit 0`.
- **Uninstall.** Run `.grok/skills/verify-libre-copy/bin/control-libre-copy setup --uninstall`. The log ends in `exit 0`, and the same `claude plugin list` no longer shows `@libre-copy` plugins.
- **Proof.** Keep the `evidence/setup-<n>.log` files, then run `.grok/skills/verify-libre-copy/bin/control-libre-copy cleanup`.

## Gotchas

- `setup.sh` installs into whatever config `CLAUDE_CONFIG_DIR` and `GROK_HOME` point at. Run it through the helper, or it installs into your own setup.
- `--scope` is Claude Code only; with `--grok` it is ignored.
- `--plugins-dir` is accepted for old commands but no longer used.
