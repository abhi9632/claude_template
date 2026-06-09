# CLAUDE.md — Session Bootstrap (TEMPLATE)

The short, every-session file. **`AGENTS.md`** holds this project's facts + a rules
index; the detailed development rules live in **`rules/`**. Read AGENTS.md at the start
of every session. Keep this file under 200 lines.

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
3. Invoke **`frontend-design`** before any front-end code (Rule 0).
4. Use **`find-skills`** before improvising a capability you lack a skill for.
5. Run the live-doc hooks after every completed feature (`rules/documentation-hooks.md`).
6. Update the Progress Log (below) at session end.
7. Ask before any out-of-scope addition; flag security/quality issues immediately.

---

## SESSION STARTUP

1. Read **`AGENTS.md`** fully — project facts + the rules index (points into `rules/`).
2. Read the **Progress Log** below.
3. Say: *"Resuming [project]. Last completed: [X]. Current milestone: [M]. Next task: [Y]."*
4. Never ask "what would you like to work on?" — pick up from the log.
5. If AGENTS.md still has [PROJECT-SPECIFIC] placeholders → stop and say so; run the
   planning skill (SKILL.md) first.

---

## 🔴 RULE 0 — `frontend-design` BEFORE ANY FRONT-END CODE

Before writing any UI — markup, HTML, CSS, classes, component, layout, animation,
anything the user sees — you MUST invoke the `frontend-design` skill first. It is
enabled in `.claude/settings.json` and auto-loads every session. Hard blocker: nothing
visual is written without it. If it won't load, STOP and tell [CLIENT].
Full rule: `rules/frontend-design.md`.

## 🟢 SKILL DISCOVERY — `find-skills` BEFORE IMPROVISING

Need a capability you don't have a skill for? `npx skills find "<task>"`
(leaderboard https://skills.sh/) → verify quality → `npx skills add <owner/repo@skill>`
→ use it. Never hand-roll what a vetted skill already does well.

---

## DECISION-MAKING

| Situation | Action |
|-----------|--------|
| Technical implementation detail | Decide — use AGENTS.md |
| Any front-end / UI work | `frontend-design` FIRST (Rule 0), then AGENTS.md design system |
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

At session end update the **Progress Log** (always) and the **Scope Change Log** (if
scope changed). Never end a session without updating the log. Never change scope silently.

---

## PROGRESS LOG

Session 1 — [DATE]
Milestone: M0
Completed: [what was done]
Files changed: [list]
Blockers: [any]
Next: [next task]

---

## SCOPE CHANGE LOG

Any feature added or removed after plan approval is logged here. Never change scope silently.

[DATE] — [Added/Removed] [feature] — Reason: [why] — Approved by: [CLIENT]
