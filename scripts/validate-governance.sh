#!/usr/bin/env bash
# On-demand governance validator. Run at any time to check the doc structure is intact.
# Not wired as an automatic hook — run manually: bash scripts/validate-governance.sh
# Exit 0 = all PASS or WARN only. Exit 1 = at least one FAIL.
set -euo pipefail

cd "$(git rev-parse --show-toplevel 2>/dev/null || echo '.')" 2>/dev/null || true

PASS=0; WARN=0; FAIL=0

pass() { echo "PASS  $1"; PASS=$((PASS+1)); }
warn() { echo "WARN  $1"; WARN=$((WARN+1)); }
fail() { echo "FAIL  $1"; FAIL=$((FAIL+1)); }

# --- Required files (hard fail if missing) ---
REQUIRED_FILES=(
  HANDOFF.md
  AGENTS.md
  CLAUDE.md
  rules/documentation-hooks.md
  rules/frontend-design.md
  rules/security.md
  rules/quality.md
  rules/development-workflow.md
  rules/data-and-forms.md
  rules/pre-launch-checklist.md
  docs/session-archive.md
  scripts/print-handoff.sh
  scripts/handoff-check.sh
  scripts/cloud-git-identity.sh
  .claude/settings.json
)

for f in "${REQUIRED_FILES[@]}"; do
  if [ -f "$f" ]; then
    pass "$f exists"
  else
    fail "$f is MISSING"
  fi
done

# DEPLOYMENT.md is created per-project, so warn only
if [ -f DEPLOYMENT.md ]; then
  pass "DEPLOYMENT.md exists"
else
  warn "DEPLOYMENT.md not found (create per project once hosting is known)"
fi

# --- HANDOFF.md required sections ---
if [ -f HANDOFF.md ]; then
  REQUIRED_SECTIONS=(
    "Quick resume"
    "Current state snapshot"
    "Standing blockers"
    "Known failures"
    "Session log"
    "Scope change log"
    "HANDOFF_SYNCED_COMMIT"
  )
  for section in "${REQUIRED_SECTIONS[@]}"; do
    if grep -q "$section" HANDOFF.md; then
      pass "HANDOFF.md contains '$section'"
    else
      fail "HANDOFF.md is missing section: '$section'"
    fi
  done
fi

# --- Unfilled placeholders in AGENTS.md (warn only — valid on first session) ---
if [ -f AGENTS.md ]; then
  if grep -q '\[PROJECT-SPECIFIC\]' AGENTS.md; then
    warn "AGENTS.md still contains [PROJECT-SPECIFIC] placeholders (run SKILL.md planning phase to fill)"
  else
    pass "AGENTS.md has no unfilled [PROJECT-SPECIFIC] placeholders"
  fi
fi

# --- cloud-git-identity.sh placeholder check (warn only) ---
if [ -f scripts/cloud-git-identity.sh ]; then
  if grep -qE '\[YOUR_GITHUB_USERNAME\]|\[YOUR_EMAIL\]' scripts/cloud-git-identity.sh; then
    warn "scripts/cloud-git-identity.sh still contains placeholder identity values — update before first commit"
  else
    pass "scripts/cloud-git-identity.sh identity placeholders are filled"
  fi
fi

# --- Document map link validation (check files referenced in HANDOFF.md table exist) ---
if [ -f HANDOFF.md ]; then
  # Extract markdown link targets that look like local file paths from the document map
  LINKED=$(grep -oE '`[A-Za-z0-9_./\*-]+\.md`' HANDOFF.md | tr -d '`' | sort -u || true)
  for linked in $LINKED; do
    # Skip glob patterns and paths with wildcards
    [[ "$linked" == *"*"* ]] && continue
    if [ -f "$linked" ]; then
      pass "Document map link valid: $linked"
    else
      warn "Document map references '$linked' but the file does not exist yet"
    fi
  done
fi

# --- Summary ---
echo ""
echo "Results: ${PASS} PASS, ${WARN} WARN, ${FAIL} FAIL"

if [ "$FAIL" -gt 0 ]; then
  echo "Governance check FAILED. Fix the FAIL items above before continuing."
  exit 1
else
  echo "Governance check PASSED (review any WARNs above)."
  exit 0
fi
