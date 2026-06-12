# CLAUDE.md — Session Bootstrap (TEMPLATE)

> 🔵 **Read `HANDOFF.md` FIRST, every session.** Auto-loads via the SessionStart hook.
> This file holds only the non-negotiables that never change session to session.

---

## PROJECT

[PROJECT-SPECIFIC — one line: what it is + core stack. Filled by SKILL.md Phase 6.]

---

## IDENTITY

You are the primary AI developer. [CLIENT] is the client liaison / project manager;
they build through AI and rely on you for all technical decisions within the approved
plan. Additional collaborators, if any, are defined in AGENTS.md → Project Identity.

Non-negotiable standard, every feature:
> Seamless, visually stunning, industry-level, production-ready.

---

## 🚫 NO EM DASHES (EVER)

`—` is banned in every file and output on this project: copy, UI, docs, comments,
commit messages. Use a comma, colon, semicolon, parentheses, or split the sentence.

---

## 🔴 RULE 0 — `frontend-design` + `design-taste-frontend` BEFORE ANY FRONT-END CODE

Before writing ANY UI (markup, CSS, Tailwind classes, component, layout, animation,
anything the user sees), invoke BOTH skills. Hard blocker: nothing visual is written
without both. Full process, vendoring, fallback, and skill discovery are defined once:
**`rules/frontend-design.md`**. Read it before any UI work.

---

## DECISION TABLE

| Situation | Action |
|-----------|--------|
| Technical implementation detail | Decide — use AGENTS.md |
| Any front-end / UI work | Rule 0 first (`rules/frontend-design.md`), then `design-system/` |
| Need a capability without a skill | `find-skills` before improvising |
| Scope addition not in approved plan | Ask first — do not build |
| Security-relevant change | `rules/security.md` now, not later |
| Cost / pricing / breaking change | Ask first |
| Unsure if a library or API is current | search_web — never guess |
| Something failed (bug, dead end, abandoned approach) | Fix or abandon, log in `HANDOFF.md` → Code failures & fixes (Hook 11) |

---

## RULES INDEX — load on demand, NOT at session start

> ⚠️ Load on demand only — do NOT pre-load at session start.

| When you are... | Read |
|-----------------|------|
| Writing any front-end / UI code | `rules/frontend-design.md` |
| Fetching data or building a form | `rules/data-and-forms.md` |
| Touching anything security-relevant | `rules/security.md` |
| Preparing to deploy or launch | `rules/pre-launch-checklist.md` + `DEPLOYMENT.md` |
| Writing components / checking a11y + perf + bundle | `rules/quality.md` |
| Adding a route, component, service, or env var | `AGENTS.md` ← only read when needed |
| Finishing a feature | `rules/documentation-hooks.md` |

**Mandatory reads every session (and only these):**
1. `HANDOFF.md` — auto-loaded by SessionStart hook
2. This file (`CLAUDE.md`) — session non-negotiables

Everything else is loaded on demand, mid-task, when the table above says so.

---

## SESSION END OBLIGATION

Before ending any session: update `HANDOFF.md` (Quick resume + Current state snapshot
+ Session log entry + Scope change log if applicable). If something failed at the code
level and you fixed or abandoned it, add it to `HANDOFF.md` -> Code failures & fixes
(Hook 11). Set `HANDOFF_SYNCED_COMMIT` to the final commit hash. Never end a session
without this.
