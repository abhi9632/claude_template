#!/usr/bin/env bash
# Runs on every session start/resume/clear (wired via .claude/settings.json
# SessionStart hook). Prints HANDOFF.md to stdout so Claude Code adds it to
# context automatically, even in a brand-new chat with zero prior context.
# This is a backstop: the session should also read HANDOFF.md itself per
# CLAUDE.md > SESSION STARTUP, but this hook guarantees it is never missed.
set -euo pipefail

cd "$CLAUDE_PROJECT_DIR"

if [ -f HANDOFF.md ]; then
  echo "===== HANDOFF.md (auto-loaded session context, read this first) ====="
  cat HANDOFF.md
  echo "===== END HANDOFF.md ====="
else
  echo "WARNING: HANDOFF.md is missing. Re-create it following the template in SKILL.md Phase 6" >&2
  echo "step 3a, populate it from docs/session-archive.md and AGENTS.md, then re-run." >&2
fi

exit 0
