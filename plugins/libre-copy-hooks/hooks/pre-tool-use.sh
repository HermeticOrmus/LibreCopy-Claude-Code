#!/usr/bin/env bash
# libre-copy-hooks: PreToolUse
#
# Claude Code sends the tool call as JSON on stdin. Asks the user first when:
#   - a Read, Edit, Write, or MultiEdit targets a file that usually holds
#     secrets (.env files, .pem or .key files, credentials or secrets files)
#   - a Bash command would destroy documentation or history: a recursive rm
#     of a docs, content, or wiki folder, git reset --hard, git clean -f,
#     or a forced git push
# Every other call passes through silently.
set -uo pipefail

command -v jq >/dev/null 2>&1 || exit 0
input="$(cat)"

ask() {
  jq -n --arg reason "LibreCopy: $1" \
    '{hookSpecificOutput: {hookEventName: "PreToolUse", permissionDecision: "ask", permissionDecisionReason: $reason}}'
  exit 0
}

tool="$(jq -r '.tool_name // empty' <<<"$input" 2>/dev/null)"
cwd="$(jq -r '.cwd // empty' <<<"$input" 2>/dev/null)"

case "$tool" in
  Read|Edit|Write|MultiEdit)
    path="$(jq -r '.tool_input.file_path // empty' <<<"$input" 2>/dev/null)"
    [[ -n "$path" ]] || exit 0
    rel="$path"
    [[ -n "$cwd" ]] && rel="${path#"$cwd"/}"
    base="$(basename "$path")"
    lbase="$(tr '[:upper:]' '[:lower:]' <<<"$base")"
    lower="$(tr '[:upper:]' '[:lower:]' <<<"$rel")"
    case "$lbase" in
      .env.example|.env.sample|.env.template|.env.dist) exit 0 ;;
      .env|.env.*) ask "$base looks like an environment file. Confirm before Claude reads or changes it." ;;
      *.pem|*.key) ask "$base looks like a private key or certificate file. Confirm before Claude reads or changes it." ;;
      *.md|*.mdx|*.rst|*.adoc|*.txt|*.html|*.py|*.ts|*.tsx|*.js|*.jsx|*.go|*.java|*.rs|*.rb|*.cs) exit 0 ;;
    esac
    grep -qE '(^|/)[^/]*(credential|secret)[^/]*(/|$)' <<<"$lower" \
      && ask "$base looks like a credentials or secrets file. Confirm before Claude reads or changes it."
    ;;
  Bash)
    cmd="$(jq -r '.tool_input.command // empty' <<<"$input" 2>/dev/null)"
    [[ -n "$cmd" ]] || exit 0
    lc="$(tr '[:upper:]' '[:lower:]' <<<"$cmd")"
    if grep -qE '(^|[;&| ])rm +-[a-z]*r[a-z]* .*(docs?|documentation|content|wiki|adr|runbooks)(/|\b)' <<<"$lc"; then
      ask "this recursively deletes what looks like a documentation folder. Confirm first."
    elif grep -qE '(^|[;&| ])git +reset +.*--hard' <<<"$lc"; then
      ask "git reset --hard discards uncommitted changes, including doc edits, and can drop commits. Confirm first."
    elif grep -qE '(^|[;&| ])git +clean +-[a-z]*f' <<<"$lc"; then
      ask "git clean -f deletes untracked files, including new docs not yet committed. Confirm first."
    elif grep -qE '(^|[;&| ])git +push .*(--force|-f( |$))' <<<"$lc"; then
      ask "this force-pushes, which can overwrite history others depend on. Confirm first."
    fi
    ;;
esac
exit 0
