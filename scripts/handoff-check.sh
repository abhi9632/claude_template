#!/usr/bin/env bash
# Stop hook (wired via .claude/settings.json): reminds Claude to update
# HANDOFF.md when a session's work has been committed but HANDOFF.md was not
# updated/re-synced as part of it.
#
# Logic: HANDOFF.md carries a `HANDOFF_SYNCED_COMMIT: <hash>` marker recording
# the commit it was last verified against. If the working tree is clean (a
# commit just landed, nothing mid-edit) and HEAD has moved past that marker,
# block the stop once and ask Claude to update HANDOFF.md (Quick resume,
# session log, blockers), set the marker to the new HEAD, and commit that.
#
# Avoiding the chicken-and-egg: the commit that sets the marker necessarily
# becomes the new HEAD, which then would not equal the hash it contains. To
# break this, any commit whose message mentions HANDOFF_SYNCED_COMMIT (e.g.
# "Sync HANDOFF_SYNCED_COMMIT marker", or a feature commit that updated
# HANDOFF.md and the marker together) is treated as already in sync.
#
# `stop_hook_active` (from the hook's stdin JSON) is true if this hook already
# blocked once in this turn chain; exit cleanly then to avoid looping forever.
set -euo pipefail

cd "$CLAUDE_PROJECT_DIR"

input="$(cat || true)"

if printf '%s' "$input" | grep -q '"stop_hook_active"[[:space:]]*:[[:space:]]*true'; then
  exit 0
fi

# --- Non-blocking warnings: surface a missing/incomplete governance doc set
# without blocking the session. Each check is independent of the others.
if [ ! -f HANDOFF.md ]; then
  echo "WARNING: HANDOFF.md is missing. See scripts/print-handoff.sh for how to recreate it." >&2
fi
if [ -f HANDOFF.md ] && ! grep -q 'HANDOFF_SYNCED_COMMIT:' HANDOFF.md; then
  echo "WARNING: HANDOFF.md has no HANDOFF_SYNCED_COMMIT marker (rules/documentation-hooks.md Hook 7)." >&2
fi
if [ ! -f docs/session-archive.md ]; then
  echo "WARNING: docs/session-archive.md is missing (Session log pruning, Hook 7, has nowhere to go)." >&2
fi
if [ ! -f design-system/README.md ]; then
  echo "WARNING: design-system/README.md is missing (Hook 10 has nowhere to update)." >&2
fi

[ -f HANDOFF.md ] || exit 0
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0

# Skip while there are uncommitted changes: the session is still mid-task.
if [ -n "$(git status --porcelain)" ]; then
  exit 0
fi

head_hash="$(git rev-parse HEAD)"
head_subject="$(git log -1 --pretty=%s HEAD)"

case "$head_subject" in
  *HANDOFF_SYNCED_COMMIT*) exit 0 ;;
esac

synced_hash="$(grep -oE 'HANDOFF_SYNCED_COMMIT:[[:space:]]*[a-f0-9]+' HANDOFF.md | awk '{print $2}' || true)"

if [ "$head_hash" != "$synced_hash" ]; then
  {
    echo "HANDOFF.md is out of sync with the repo: HEAD is now $head_hash but"
    echo "HANDOFF.md's HANDOFF_SYNCED_COMMIT marker is '${synced_hash:-<none>}'."
    echo "Before ending this session: update HANDOFF.md (Quick resume, Current"
    echo "state snapshot, Session log, Standing blockers as needed), set"
    echo "HANDOFF_SYNCED_COMMIT to $head_hash, and commit that update."
  } >&2
  exit 2
fi

exit 0
