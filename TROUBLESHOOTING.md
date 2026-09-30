# Troubleshooting

```bash
claude plugin list | grep -c '@libre-copy'  # 21 after a full ./setup.sh (20 plugins plus libre-copy-hooks)
```

Common scenarios:
- API doc design → `/api-docs`
- API reference from code → `/api-doc`
- README that nobody reads → `/readme`
- Runbook for an incident → `/write-runbook`
- Tutorial that loses people → `/tutorial`
- Error message UX → `/doc-errors`

## Plugins installed but nothing shows up

Restart Claude Code after installing; plugins load at startup. Then check that each one is enabled:

```bash
claude plugin list
claude plugin details api-documentation@libre-copy
```

A disabled plugin can be turned back on with `claude plugin enable <plugin>@libre-copy`.

## Installed with an older setup.sh

Versions before 1.0.0 copied plugin folders into `~/.claude/plugins/libre-copy-*`. Claude Code does not load plugins from there, so those copies never ran. Remove them (`rm -rf ~/.claude/plugins/libre-copy-*`) and install again with `./setup.sh` or `/plugin install`.

## A command I used before is gone

1.0.0 merged commands that did the same job into one. The old names and their replacements: `/doc-api` → `/api-doc`, `/doc-architecture` → `/arch-doc` (its `adr` action → `/adr`), `/doc-code` → `/document-code`, `/doc-guide` → `/devguide`, `/build-readme` → `/readme`, `/write-blog` → `/blog-post`, `/create-tutorial` → `/tutorial`, `/doc-user` → `/user-doc`. Each keeps the old actions (`validate`, `review`, `diff`, and so on).

## The hooks do nothing

`libre-copy-hooks` needs `jq` on the PATH. Without it the hooks exit quietly. The session-start line only appears in projects with documentation tooling or a docs folder with at least three pages.
