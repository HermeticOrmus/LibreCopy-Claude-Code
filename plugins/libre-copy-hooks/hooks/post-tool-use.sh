#!/usr/bin/env bash
# libre-copy-hooks: PostToolUse
#
# After Claude writes or edits a file:
#   - if the file ended up empty, tell Claude, since an empty write is almost
#     always a mistake
#   - if it is a Markdown, MDX, or reStructuredText file and the project has
#     Vale or markdownlint configured, name the linter command to run on it
#   - if it is source code with a matching test file (tests/test_x.py,
#     x_test.go, x.test.ts, and similar), name that test file so Claude runs it
# Silent otherwise. Writes no files.
set -uo pipefail

command -v jq >/dev/null 2>&1 || exit 0
input="$(cat)"

tool="$(jq -r '.tool_name // empty' <<<"$input" 2>/dev/null)"
case "$tool" in Write|Edit|MultiEdit) ;; *) exit 0 ;; esac

file="$(jq -r '.tool_input.file_path // empty' <<<"$input" 2>/dev/null)"
[[ -n "$file" && -f "$file" ]] || exit 0
cwd="$(jq -r '.cwd // empty' <<<"$input" 2>/dev/null)"
[[ -n "$cwd" && -d "$cwd" ]] || cwd="$(dirname "$file")"
rel="${file#"$cwd"/}"

say() {
  jq -n --arg ctx "LibreCopy: $1" '{hookSpecificOutput: {hookEventName: "PostToolUse", additionalContext: $ctx}}'
  exit 0
}

name="$(basename "$file")"
[[ -s "$file" ]] || say "$name is empty after this $tool. Check that the content was written."

ext="${name##*.}"
stem="${name%.*}"

case "$ext" in
  md|mdx|rst)
    linters=()
    [[ -f "$cwd/.vale.ini" || -f "$cwd/_vale.ini" ]] && linters+=("vale $rel")
    if [[ "$ext" != rst ]]; then
      for m in .markdownlint-cli2.jsonc .markdownlint-cli2.yaml .markdownlint-cli2.cjs; do
        [[ -f "$cwd/$m" ]] && { linters+=("markdownlint-cli2 $rel"); break; }
      done
      if (( ${#linters[@]} == 0 )) || [[ "${linters[-1]}" != markdownlint-cli2* ]]; then
        for m in .markdownlint.json .markdownlint.jsonc .markdownlint.yaml .markdownlint.yml; do
          [[ -f "$cwd/$m" ]] && { linters+=("markdownlint $rel"); break; }
        done
      fi
    fi
    (( ${#linters[@]} )) || exit 0
    if (( ${#linters[@]} == 2 )); then
      say "this project lints docs. Run \`${linters[0]}\` and \`${linters[1]}\` before calling this change done."
    else
      say "this project lints docs. Run \`${linters[0]}\` before calling this change done."
    fi
    ;;
  py|js|ts|go|rs|java|rb) ;;
  *) exit 0 ;;
esac

case "$stem" in test_*|*_test|*.test|*.spec) exit 0 ;; esac
candidates=("test_$stem.$ext" "${stem}_test.$ext" "$stem.test.$ext" "$stem.spec.$ext")
for c in "${candidates[@]}"; do
  hit="$(find "$cwd" -maxdepth 6 -name "$c" -not -path '*/node_modules/*' -not -path '*/.git/*' -not -path '*/.venv/*' -print -quit 2>/dev/null)"
  [[ -n "$hit" ]] && say "${hit#"$cwd"/} covers $name. Run it before calling this change done."
done
exit 0
