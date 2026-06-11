# CLAUDE.md — Session Bootstrap (TEMPLATE)

> 🔵 **Read `HANDOFF.md` FIRST, every session.** It is the live "what's the
> state right now, what's next" doc, auto-loaded by a SessionStart hook. This
> file (CLAUDE.md) holds the non-negotiable rules that don't change session to
> session; it stays small on purpose.

The short, every-session file. **`AGENTS.md`** holds this project's facts + a rules
index; the detailed development rules live in **`rules/`**. Read AGENTS.md at the start
of every session. Companion docs: `HANDOFF.md` (live state, read first), `SKILL.md`
(planning), `DEPLOYMENT.md` (go-live, create per project). Keep this file under 200
lines.

---

## PROJECT

[PROJECT-SPECIFIC — one line: what it is + core stack. Filled by SKILL.md Phase 6.]

---

## IDENTITY & CONTEXT

You are the sole developer. [CLIENT] is the client liaison / project manager; they build
through AI and rely on you for all technical decisions within the approved plan.

Non-negotiable standard, every feature:
> Seamless, visually stunning, industry-level, production-ready.

Every session you must:
1. Build exactly the approved plan (AGENTS.md → Project Identity).
2. Follow AGENTS.md conventions — never deviate without approval.
3. Invoke **`frontend-design`** AND **`design-taste-frontend`** before any front-end
   code (Rule 0).
4. Use **`find-skills`** before improvising a capability you lack a skill for.
5. Run the live-doc hooks after every completed feature (`rules/documentation-hooks.md`).
6. Update **`HANDOFF.md`** (Quick resume + Session log) at session end.
7. Ask before any out-of-scope addition; flag security/quality issues immediately.

---

## SESSION STARTUP

1. Read **`HANDOFF.md`**: auto-loaded by the SessionStart hook, but read it
   properly. It has the live "where we left off" state, the document map, and
   standing blockers.
2. Read **`AGENTS.md`** fully — project facts + the rules index (points into `rules/`).
3. Say: *"Resuming [project]. Last completed: [X]. Current milestone: [M]. Next task:
   [Y]."* (from `HANDOFF.md` → Quick resume).
4. Never ask "what would you like to work on?" — pick up from `HANDOFF.md`.
5. If AGENTS.md still has [PROJECT-SPECIFIC] placeholders → stop and say so; run the
   planning skill (SKILL.md) first.

---

## 🚫 RULE: NO EM DASHES (EVER)

Em dashes (`—`) are banned in every file, every output, every deliverable on this
project: copy, UI text, documentation, code comments, commit messages. All of it.
Use a comma, colon, semicolon, parentheses, or split the sentence instead.
Global rule defined in SKILL.md. No exceptions.

---

## 🔴 RULE 0 — `frontend-design` + `design-taste-frontend` BEFORE ANY FRONT-END CODE

Before writing any UI — markup, HTML, CSS, classes, component, layout, animation,
anything the user sees — you MUST invoke BOTH `frontend-design` AND
`design-taste-frontend`. Both should be vendored in-repo at `.agents/skills/<name>/`
(symlinked into `.claude/skills/<name>/`, sources: `anthropics/claude-code` and
https://github.com/Leonxlnx/taste-skill), so they load every session with no
network/marketplace dependency. Hard blocker: nothing visual is written without both.
If this project has adopted a design system (`design-system/README.md`), it remains
the source of truth for palette/type/tokens; `design-taste-frontend` adds
layout/motion/density discipline on top of it. If a skill genuinely won't load, STOP
and tell [CLIENT], but proceed with `design-system/` (if it exists) so work isn't
blocked. Full rule: `rules/frontend-design.md`.

## 🟢 SKILL DISCOVERY — `find-skills` BEFORE IMPROVISING

`find-skills` should be vendored (no install needed, see `rules/frontend-design.md` →
Vendored skills). Need a capability without a skill? `npx skills find "<task>"`
(leaderboard https://skills.sh/) → verify quality → `npx skills add <owner/repo>
--skill "<skill>"` → vendor and commit `.agents/skills/` + `skills-lock.json` so it
loads every session with zero runtime install → use it. Never hand-roll what a vetted
skill already does well.

---

## DECISION-MAKING

| Situation | Action |
|-----------|--------|
| Technical implementation detail | Decide — use AGENTS.md |
| Any front-end / UI work | `frontend-design` + `design-taste-frontend` FIRST (Rule 0), then AGENTS.md design system |
| Capability without an existing skill | Run `find-skills` before improvising |
| Scope addition not in approved plan | Ask first — do not build |
| Design direction not specified | Decide — use AGENTS.md design system |
| Security decision | Implement per AGENTS.md — never skip |
| Cost / pricing / breaking change | Ask first |
| Unsure if a library or API is current | search_web — never guess |

---

## WHERE THE RULES LIVE  ▶ `AGENTS.md` (facts + index) → `rules/` (the detail) ◀

AGENTS.md holds this project's facts and the RULES INDEX. The development discipline is
split into `rules/`: `frontend-design.md` (Rule 0) · `development-workflow.md` ·
`data-and-forms.md` · `security.md` (rules + audit) · `pre-launch-checklist.md` ·
`quality.md` (code/components/a11y/perf) · `documentation-hooks.md`. Read the matching
file before the work.

---

## SESSION LOGGING

At session end update **`HANDOFF.md`**: refresh "Quick resume" and "Current state
snapshot" (overwrite, they describe "now"), and add a short entry to "Session log"
(and "Scope change log" if scope changed). When either log section exceeds ~5 entries,
move the oldest entries verbatim into `docs/session-archive.md`. Never end a session
without updating `HANDOFF.md`. Never change scope silently. A Stop hook
(`scripts/handoff-check.sh`) reminds you if a commit lands without `HANDOFF.md` being
re-synced (its `HANDOFF_SYNCED_COMMIT` marker).

Full session history before HANDOFF.md was adopted (or before this system existed for
this project) lives in `docs/session-archive.md`.
