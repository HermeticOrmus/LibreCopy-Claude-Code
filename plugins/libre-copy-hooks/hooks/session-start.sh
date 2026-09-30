#!/usr/bin/env bash
# libre-copy-hooks: SessionStart
#
# Looks at the project Claude Code just opened. When it finds documentation
# tooling (MkDocs, Docusaurus, Sphinx, mdBook, Mintlify, Antora, Vale,
# markdownlint, an OpenAPI or AsyncAPI spec, an ADR folder, or a docs folder
# with real content), it prints one line of context: what it found and which
# LibreCopy plugins fit. Other projects get no output.
# Reads only; writes no files.
set -uo pipefail

input="$(cat)"
dir=""
command -v jq >/dev/null 2>&1 && dir="$(jq -r '.cwd // empty' <<<"$input" 2>/dev/null)"
[[ -n "$dir" && -d "$dir" ]] || dir="$PWD"

found=(); plugins=()
add() { found+=("$1"); shift; plugins+=("$@"); }
any() { local f; for f in "$@"; do [[ -e "$dir/$f" ]] && return 0; done; return 1; }

any mkdocs.yml mkdocs.yaml && add MkDocs developer-guides content-strategy
any docusaurus.config.js docusaurus.config.ts docusaurus.config.mjs && add Docusaurus developer-guides content-strategy
any docs/conf.py doc/conf.py docs/source/conf.py && add Sphinx code-comments developer-guides
any book.toml && add mdBook tutorial-creation developer-guides
any mint.json && add Mintlify api-documentation developer-guides
any antora.yml antora-playbook.yml && add Antora content-strategy
any .vale.ini _vale.ini && add Vale style-guides documentation-testing
any .markdownlint.json .markdownlint.jsonc .markdownlint.yaml .markdownlint.yml .markdownlint-cli2.jsonc .markdownlint-cli2.yaml .markdownlint-cli2.cjs && add markdownlint documentation-testing
any openapi.yaml openapi.yml openapi.json swagger.yaml swagger.json docs/openapi.yaml docs/openapi.yml api/openapi.yaml && add "OpenAPI spec" api-documentation
any asyncapi.yaml asyncapi.yml asyncapi.json && add "AsyncAPI spec" api-documentation
any docs/adr docs/adrs docs/decisions docs/architecture/decisions adr && add ADRs architecture-docs
any runbooks docs/runbooks && add runbooks runbook-writing
any rfcs docs/rfcs docs/rfc && add RFCs proposal-writing

md_count=0
for d in docs doc documentation content; do
  if [[ -d "$dir/$d" ]]; then
    n="$(find "$dir/$d" -maxdepth 3 \( -name '*.md' -o -name '*.mdx' -o -name '*.rst' \) 2>/dev/null | head -50 | wc -l)"
    md_count=$((md_count + n))
  fi
done
(( md_count >= 3 )) && add "docs folder" content-strategy user-documentation

(( ${#found[@]} > 0 )) || exit 0

any CHANGELOG.md && add CHANGELOG.md changelog-management release-notes
any README.md && plugins+=(readme-engineering)

join() { local out="" x; for x in "$@"; do out+="${out:+, }$x"; done; echo "$out"; }
IFS=$'\n' read -r -d '' -a uniq_plugins < <(printf '%s\n' "${plugins[@]}" | sort -u; printf '\0')
echo "LibreCopy: documentation project detected ($(join "${found[@]}")). Relevant plugins: $(join "${uniq_plugins[@]}")."
exit 0
