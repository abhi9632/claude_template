<!--
HANDOFF.md: the live, single-source-of-truth context file for this project.

- Auto-loaded into context at the start of every Claude Code session by the
  SessionStart hook (scripts/print-handoff.sh, wired in .claude/settings.json).
  A fresh chat with zero prior context gets this file automatically.
- MUST be updated at the end of every session (see CLAUDE.md > SESSION LOGGING
  and rules/documentation-hooks.md Hook 7). A Stop hook
  (scripts/handoff-check.sh) reminds you if a commit lands without this file
  being updated and re-synced.
- Keep this file SHORT. "Quick resume" and "Current state snapshot" are
  OVERWRITTEN each session (they describe "now", not history). "Session log"
  and "Scope change log" are append-then-prune: when either grows past ~5
  entries, move the oldest entries verbatim into docs/session-archive.md and
  delete them from here.

HANDOFF_SYNCED_COMMIT: [none yet, set this after the first commit that updates
this file, see rules/documentation-hooks.md Hook 7]
-->

# HANDOFF: [PROJECT NAME]

Read this file FIRST, every session, before doing anything else. It is the live
pointer into everything else. If anything here conflicts with another doc on "what's
the state right now", this file wins; the linked docs remain the source of truth for
"what are the rules".

## Document map

| Doc | What it's for |
|-----|----------------|
| **HANDOFF.md** (this file) | Live state: where we left off, what's next, blockers |
| `CLAUDE.md` | Session bootstrap: non-negotiable rules (no em dash, Rule 0, find-skills, decision table) |
| `AGENTS.md` | Project facts, directory structure, RULES INDEX into `rules/` |
| `rules/*.md` | Development discipline detail: frontend-design, development-workflow, data-and-forms, security, pre-launch-checklist, quality, documentation-hooks |
| `design-system/README.md` | Design system: tokens, components, content rules (once adopted). All front-end work follows this |
| `DEPLOYMENT.md` | Branch/environment/release flow (create per project) |
| `SKILL.md` | Planning automation reference (project kickoff template, reusable across clients) |
| `docs/session-archive.md` | Full history of older sessions and scope changes (reference only) |

Read order for a fresh session: this file, then `AGENTS.md`, then the `rules/*.md`
file relevant to the task, then `design-system/README.md` if doing any UI work
(Rule 0).

## Quick resume

- **Last completed:** [Session N, DATE: one or two sentences on what was finished and
  why it matters for the next session.]
- **Current milestone:** [Mx, milestone name, e.g. "M0, foundations"]
- **Active branch:** [branch name]
- **Next task:** [the next concrete step, with file paths if known]

## Current state snapshot

- **Stack:** [framework, styling approach, hosting, error tracking, key third-party
  services, keep this in sync with AGENTS.md > Project Identity]
- **Design system:** [NOT ADOPTED, or ADOPTED, date and one-line summary]
- **Build:** [build/check command and current status, e.g. "npm run build green, 0
  errors"]
- **Skills:** [which of frontend-design / design-taste-frontend / find-skills are
  vendored in `.agents/skills/`, confirmed loadable via the Skill tool]

## Standing blockers (dashboard steps for [CLIENT], not Claude)

- [e.g. hosting project not yet connected to the repo]
- [e.g. third-party account setup, API key/DSN verification, final copy/photos pending]

## Session log (most recent first, keep entries to about 5 lines each)

> Template for a new entry (delete this blockquote when adding a real one):
> ### Session N - YYYY-MM-DD - milestone
> One to three sentences: what changed, key files/areas touched, build status.
> Blockers: unchanged, or list new ones.
> Next: one line.
>
> When this list exceeds 5 entries, move the oldest verbatim into
> `docs/session-archive.md` and delete it from here.

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
