# libre-copy-hooks

> Optional hooks for LibreCopy: a documentation tooling summary when a session starts, a confirmation prompt before Claude touches secrets files or runs commands that destroy docs or history, and post-edit checks for empty writes, doc linters, and matching tests.

This plugin is separate from the other 20 so you choose whether hooks run in your sessions. Install it with:

```
/plugin install libre-copy-hooks@libre-copy
```

or from a terminal: `claude plugin install libre-copy-hooks@libre-copy`, or `./setup.sh --only libre-copy-hooks` from a clone.

## What each hook does

| Event | Script | Behavior |
|---|---|---|
| SessionStart | `hooks/session-start.sh` | Looks for MkDocs, Docusaurus, Sphinx, mdBook, Mintlify, or Antora configuration, Vale and markdownlint configs, OpenAPI or AsyncAPI specs, ADR, runbook, and RFC folders, and a docs folder with at least three pages. When it finds any, it prints one line naming them and the LibreCopy plugins that fit. A repo with only a README or CHANGELOG gets no output. |
| PreToolUse (Read, Edit, Write, MultiEdit, Bash) | `hooks/pre-tool-use.sh` | Asks you to confirm when Claude targets a `.env` file (not `.env.example`, `.env.sample`, `.env.template`, `.env.dist`), a `.pem` or `.key` file, or a non-document, non-source file whose path names credentials or secrets. For Bash it asks before a recursive `rm` of a docs, content, wiki, ADR, or runbook folder, `git reset --hard`, `git clean -f`, and forced `git push`. Everything else passes silently. |
| PostToolUse (Write, Edit, MultiEdit) | `hooks/post-tool-use.sh` | Tells Claude when a file is empty after a write. After an edit to a Markdown, MDX, or reStructuredText file in a project with Vale or markdownlint configured, it names the lint command to run on that file. After an edit to a source file with a matching test file, it names the test file. Silent otherwise. |

## Requirements

- `bash` and `jq` on the PATH. Without `jq` the hooks exit quietly and do nothing.
- The lint hint assumes the `vale`, `markdownlint`, or `markdownlint-cli2` command your config is written for.

## Privacy

The hooks read the JSON Claude Code sends on stdin and the files in your project. They write nothing to disk and send nothing over the network.

## Origin

These scripts are ports of the original `hooks/*.sh` files at the root of this repository, which are kept for reference. The originals expected the tool name and target as command-line arguments, but Claude Code sends hook input as JSON on stdin, and the old `setup.sh` never registered them, so they never ran. They also wrote log files next to themselves. These versions read the JSON with `jq`, keep the same checks (sensitive files, destructive operations, empty writes, a nudge to verify changes), and keep no logs.
