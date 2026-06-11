<!--
HANDOFF.md: the live, single-source-of-truth context file for this project.

- Auto-loaded into context at the start of every Claude Code session by the
  SessionStart hook (scripts/print-handoff.sh, wired in .claude/settings.json).
  A fresh chat with zero prior context gets this file automatically.
- MUST be updated at the end of every session (Hook 7). A Stop hook
  (scripts/handoff-check.sh) reminds you if a commit lands without this file
  being updated and re-synced.
- Keep this file SHORT. "Quick resume" and "Current state snapshot" are
  OVERWRITTEN each session (they describe "now", not history). "Session log"
  and "Scope change log" are append-then-prune: when either grows past ~5
  entries, move the oldest verbatim into docs/session-archive.md.
  "Code failures & fixes" is durable and NOT pruned by age.
  "Infra & access blockers" are [CLIENT]'s action items only — never code traps.

HANDOFF_SYNCED_COMMIT: [none yet — set this after the first commit that updates
this file, see rules/documentation-hooks.md Hook 7]
-->

# HANDOFF: [PROJECT NAME]

Read this file FIRST, every session. It wins over any other doc on "what's the state
right now". Linked docs are the source of truth for rules, not state.

## Quick resume

- **Last completed:** [Session N, DATE: one or two sentences on what was finished and
  why it matters for the next session.]
- **Current milestone:** [Mx, milestone name]
- **Active branch:** [branch name]
- **Next task:** [the next concrete step, with file paths if known]

## Current state snapshot

- **Build:** [build/check command and current status, e.g. "npm run build green, 0 errors"]
- **Active branch:** [branch name]
- **Phase:** [what milestone you are in and what is/isn't done yet]
- **Active warnings:** [any non-blocking issues worth flagging, or "none"]
- **Static info (stack, design system, tables):** in AGENTS.md — read it when touching
  architecture, not every session.

## Document map

| Doc | What it's for | When to read |
|-----|----------------|---------------|
| **HANDOFF.md** (this file) | Live state: where we left off, what's next, blockers | Every session (auto-loaded) |
| `CLAUDE.md` | Non-negotiable rules: no em dash, Rule 0 pointer, decision table, rules index | Every session (short, ~60 lines) |
| `AGENTS.md` | Project facts, directory structure, component/route/env tables, design system detail | When touching architecture, adding a service/route/component, or need the tables |
| `rules/frontend-design.md` | Rule 0 full process, vendored skills, skill discovery | Before any UI/front-end work |
| `rules/development-workflow.md` | Feature build order, Week One foundations | When building a feature end-to-end |
| `rules/data-and-forms.md` | Data fetching states, form hardening | When fetching data or building a form |
| `rules/security.md` | Security rules + production audit | When touching anything security-relevant |
| `rules/pre-launch-checklist.md` | Pre-launch gate | When preparing to deploy or launch |
| `rules/quality.md` | Code quality, a11y, perf, bundle size | When writing components or checking quality |
| `rules/documentation-hooks.md` | Live doc hooks (1-11) | After finishing a feature |
| `design-system/README.md` | Brand tokens, components, content rules (once adopted) | Before any UI work (Rule 0 flow) |
| `DEPLOYMENT.md` | Branch/environment/release runbook | When branching, deploying, or going live |
| `SKILL.md` | Planning automation reference | For new project kickoff or re-planning |
| `docs/session-archive.md` | Older session + scope change history | Reference only |

## Infra & access blockers ([CLIENT]'s action items — not code issues, not for Claude to fix)

These are setup tasks that need [CLIENT]'s dashboard/account access. Claude reads
these once at session start to know what is unavailable, then ignores them until
resolved. Never mix code-level failures in here.

- [e.g. hosting project not yet connected to the repo]
- [e.g. third-party account setup, API key/DSN verification, DNS, final assets pending]

## Code failures & fixes (do not repeat — code/build level only)

Durable list of code-level mistakes, dead ends, and build failures already hit and
resolved. NOT pruned by age. Stays until the trap is permanently impossible. Keep each
entry to 2-3 lines: symptom -> root cause -> fix / how to avoid. Add whenever
something fails at the code/build level (Hook 11). Infra and access failures go in
"Infra & access blockers" above, not here.

- [None yet. Format: YYYY-MM-DD - symptom - root cause - fix / how to avoid.]

## Session log (most recent first, keep entries to about 5 lines each)

> Template for a new entry (delete this blockquote when adding a real one):
> ### Session N - YYYY-MM-DD - milestone
> One to three sentences: what changed, key files/areas touched, build status.
> Blockers: unchanged, or list new ones.
> Next: one line.
>
> When this list exceeds 5 entries, move the oldest verbatim into
> `docs/session-archive.md` and delete them from here.

### Session 1 - [DATE] - planning and foundations
[One to three sentences: planning skill run, repo scaffolded, key tooling wired,
build status.]
Blockers: [list, or "none yet"].
Next: [first feature/page to build].

## Scope change log (most recent first, keep entries to 1-2 lines)

> When this list exceeds 5 entries, move the oldest verbatim into
> `docs/session-archive.md`.

[No scope changes yet. Format: YYYY-MM-DD - Added/Changed/Removed - what, and why.
Approved by: [CLIENT].]
