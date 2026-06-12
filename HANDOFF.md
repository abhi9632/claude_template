# HANDOFF: [PROJECT NAME]

Read this file FIRST, every session. It wins over any other doc on "what's the state right now". Rules live in linked docs, not here. See CLAUDE.md → RULES INDEX for the full doc-loading table.

## Quick resume

- **Last completed:** [Session N, DATE: one sentence on what was finished.]
- **Milestone:** [Mx, milestone name]
- **Active branch:** [branch name]
- **Next task:** [next concrete step, with file paths if known]

## Current state snapshot

- **Build:** [build command and status, e.g. "npm run build green, 0 errors"]
- **Active branch:** [branch name]
- **Phase:** [milestone + what is/isn't done]
- **Active warnings:** [non-blocking issues, or "none"]
- **Static info:** stack, design system, tables — in AGENTS.md. Read only when touching architecture.

## Infra & access blockers ([CLIENT]'s action items only)

- [e.g. hosting not yet connected to repo]
- [e.g. third-party account, API key/DSN, DNS, final assets pending]

## Code failures & fixes (durable — do not prune)

- [None yet. Format: YYYY-MM-DD - symptom - root cause - fix/avoid.]

## Session log (most recent first, max 3 lines each)

### Session 1 - [DATE] - planning and foundations
[What changed, key files touched, build status.]
Blockers: [list, or "none yet"].
Next: [first feature/page to build].

> When this list exceeds 5 entries, move oldest into `docs/session-archive.md`.

## Scope change log (most recent first, 1-2 lines each)

[No scope changes yet. Format: YYYY-MM-DD - Added/Changed/Removed - what and why. Approved by: [CLIENT].]

> When this list exceeds 5 entries, move oldest into `docs/session-archive.md`.

<!--
HANDOFF.md maintenance (read at session END, not start):
- "Quick resume" and "Current state snapshot": OVERWRITE each session (describe NOW only).
- "Session log" and "Scope change log": append then prune — move oldest into docs/session-archive.md past ~5 entries.
- "Code failures & fixes": DURABLE — never prune by age.
- "Infra & access blockers": [CLIENT]'s action items only — never code traps.
- Hook 7: set HANDOFF_SYNCED_COMMIT to final commit hash and commit the update.
- scripts/handoff-check.sh (Stop hook) warns if a commit lands without this synced.

HANDOFF_SYNCED_COMMIT: [none yet — set after first commit that updates this file]
-->