#!/usr/bin/env bash
# Runs on every session start/resume/clear (wired via .claude/settings.json
# SessionStart hook). Prints a COMPACT startup summary from HANDOFF.md so
# Claude Code gets orientation without loading the full file into context.
#
# Prints ONLY:
#   - Quick resume section
#   - Current state snapshot section
#   - First 3 lines of Infra & access blockers (if any)
#
# Everything else (session log, scope log, failures log, maintenance comments)
# is intentionally omitted from startup context. Claude loads the full
# HANDOFF.md on demand if it needs the failure history or session log.
set -euo pipefail

cd "$CLAUDE_PROJECT_DIR"

if [ ! -f HANDOFF.md ]; then
  echo "WARNING: HANDOFF.md is missing. Re-create it from the template in SKILL.md." >&2
  exit 0
fi

echo "===== HANDOFF (startup summary — quick resume + current state) ====="

# Extract from start of file through end of "Current state snapshot" section.
# Stops at the first H2 that follows (## Infra, ## Code failures, ## Session log, etc.)
awk '
  /^## / { section++ }
  section == 0 { print; next }   # file header / preamble
  section == 1 { print; next }   # ## Quick resume
  section == 2 { print; next }   # ## Current state snapshot
  section == 3 { exit }          # stop at next H2
' HANDOFF.md

# Print the Infra & access blockers heading + first 3 non-empty bullet lines only.
INFRA=$(awk '
  /^## Infra/ { found=1; print; next }
  found && /^- / { count++; print; if (count==3) exit }
  found && /^## / { exit }
' HANDOFF.md)

if [ -n "$INFRA" ]; then
  echo ""
  echo "$INFRA"
fi

echo "===== END HANDOFF SUMMARY (full file: HANDOFF.md) ====="

exit 0
