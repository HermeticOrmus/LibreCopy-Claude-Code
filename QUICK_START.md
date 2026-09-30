# Quick start

Inside Claude Code:

```
/plugin marketplace add HermeticOrmus/LibreCopy-Claude-Code
/plugin install api-documentation@libre-copy
```

Or from a clone, installing every plugin through the Claude Code CLI:

```bash
git clone https://github.com/HermeticOrmus/LibreCopy-Claude-Code.git ~/projects/LibreCopy-Claude-Code
cd ~/projects/LibreCopy-Claude-Code
./setup.sh
```

### Install in Grok Build

Grok Build reads the same plugin folders. Add the marketplace and install a plugin, or install one plugin straight from its folder:

```bash
grok plugin marketplace add HermeticOrmus/LibreCopy-Claude-Code
grok plugin install api-documentation@libre-copy --trust
# or, without the marketplace:
grok plugin install HermeticOrmus/LibreCopy-Claude-Code#plugins/api-documentation --trust
```

From a clone, `./setup.sh --grok` installs every plugin through the `grok` CLI. Start a new Grok session to load them. The `libre-copy-hooks` plugin uses a hook format Grok supports, but it has not been verified in a live Grok session.

### First prompt

Restart Claude Code, then try:

```
/api-docs design API documentation for a 30-endpoint REST API. Multiple consumers (web, mobile, partners). Need: reference, getting-started, auth walkthrough, code samples in TS/Python/Go, changelog.
```

Expected: Diátaxis-aligned IA, OpenAPI spec skeleton, error catalog template, getting-started outline targeting < 30 min integration, tooling recommendation.

Once the design exists, `/api-doc` generates the reference from your routes and types, and `/api-doc validate` lints the spec before you publish it.

See learning paths for progression.
