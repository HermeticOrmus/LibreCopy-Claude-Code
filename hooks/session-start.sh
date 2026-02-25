#!/bin/bash
# Session Start Hook - Technical Writing
# Detects project context and configures the session

LOG_DIR="$(dirname "$0")/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/session-$(date +%Y%m%d-%H%M%S).log"

log() {
  echo "[$(date +%H:%M:%S)] $1" >> "$LOG_FILE"
}

log "Session started"
log "Working directory: $(pwd)"

# Detect Technical Writing context
detect_context() {
  local indicators=0
  
  
  [ -f "docs/index.md" ] && indicators=$((indicators + 1))
  [ -f "mkdocs.yml" ] && indicators=$((indicators + 1))
  [ -f "docusaurus.config.js" ] && indicators=$((indicators + 1))
  [ -d "docs/" ] && indicators=$((indicators + 1))
  [ -f "CHANGELOG.md" ] && indicators=$((indicators + 1))

  
  echo "$indicators"
}

CONTEXT_SCORE=$(detect_context)
log "Context score: $CONTEXT_SCORE"

if [ "$CONTEXT_SCORE" -gt 0 ]; then
  log "Technical Writing project detected"
  echo "[Technical Writing] Project context detected. Relevant plugins activated."
else
  log "No Technical Writing context found"
fi

# Check for project-specific configuration
if [ -f "CLAUDE.md" ]; then
  log "Found project CLAUDE.md"
fi

if [ -f ".claude/settings.json" ]; then
  log "Found Claude settings"
fi

log "Session start hook complete"
