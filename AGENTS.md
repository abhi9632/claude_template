# AGENTS.md — Project Convention Bible (TEMPLATE)
# Filled by SKILL.md Phase 6 on plan approval. Governs EVERY session.
# This file holds THIS PROJECT'S facts + an index of the development rules in rules/.
# CLAUDE.md is the per-session bootstrap. HANDOFF.md is the live state doc, read it
# first. Do NOT deviate without approval from [CLIENT].

---

## PROJECT IDENTITY

Project Name:      [PROJECT-SPECIFIC]
Client:            [PROJECT-SPECIFIC]
Repo:              github.com/[OWNER]/[REPO]
Framework:         [PROJECT-SPECIFIC]
Styling:           [PROJECT-SPECIFIC]
Animation:         [PROJECT-SPECIFIC, if any]
Database:          [PROJECT-SPECIFIC, or "None / delegated"]
ORM:               [PROJECT-SPECIFIC, or N/A]
Auth:              [PROJECT-SPECIFIC, or "delegated"]
Payments/Booking:  [PROJECT-SPECIFIC, or N/A]
Deployment:        [PROJECT-SPECIFIC]
Error Tracking:    [PROJECT-SPECIFIC — MANDATORY, e.g. Sentry]
Email/Forms:       [PROJECT-SPECIFIC, if any]
CMS:               [PROJECT-SPECIFIC, or None]
Started:           [DATE]

Any new service added triggers Hook 8 — update this section immediately.

---

## MANDATORY SKILLS

- **RULE 0 (blocking):** invoke BOTH `frontend-design` AND `design-taste-frontend`
  BEFORE any front-end/UI code. Full rule: `rules/frontend-design.md`.
- **Vendored skills:** external skills installed via `npx skills add <source> --skill
  "<name>"` are committed in-repo at `.agents/skills/<name>/SKILL.md` plus
  `skills-lock.json` (the `.claude/skills/<name>/` symlink Claude Code reads is
  generated/gitignored), so they load every session with no network/marketplace
  dependency. Recommended on every project: `frontend-design`
  (`anthropics/claude-code`), `design-taste-frontend`
  (https://github.com/Leonxlnx/taste-skill), `find-skills` (`vercel-labs/skills`).
- **Skill discovery:** `find-skills`, once vendored, needs no install. Need a
  capability without a skill? Use it (or `npx skills find "<task>"`), then vendor and
  commit any new skill the same way. See `rules/frontend-design.md`.

---

## RULES INDEX  ▶ the development discipline lives in `rules/` — read the matching file ◀

| When you are… | Read |
|---------------|------|
| Starting ANY session | `HANDOFF.md` (live state: where we left off, what's next, blockers) |
| Writing any front-end / UI code | `rules/frontend-design.md` (Rule 0 + skill discovery) |
| Building any feature | `rules/development-workflow.md` (build order + Week-One) |
| Fetching/rendering data, or building a form | `rules/data-and-forms.md` |
| Touching anything security-relevant | `rules/security.md` (rules + production audit) |
| Preparing to deploy / launch | `rules/pre-launch-checklist.md` |
| Writing components / styles / checking a11y + perf | `rules/quality.md` |
| Finishing a feature (keep docs live) | `rules/documentation-hooks.md` |
| Branching / deploying / going live | `DEPLOYMENT.md` (create per project) |

The rest of this file is THIS PROJECT'S facts (identity, structure, tables, design
tokens). The .md files must always reflect the current true state — a stale file is as
dangerous as none. `HANDOFF.md` is the live "state right now" doc and is read first
every session (auto-loaded by a SessionStart hook).

---

## PROJECT QUALITY STANDARD

> Seamless, visually stunning, industry-level, production-ready.

No rough edges, no placeholder UIs in production, no broken states. If it is not
production-ready, it is not done. (Placeholder *content* is OK pre-launch only while
client assets are pending, and must be clearly marked.)

---

## DEPLOYMENT & ENVIRONMENTS  ▶ Per-project runbook: `DEPLOYMENT.md` ◀

Three-tier flow — the live domain ONLY ever serves `main`. Never edit `main` directly;
go live by promoting `develop → main`.

| Branch      | Role               | Hosting env          | Visibility              |
|-------------|--------------------|----------------------|-------------------------|
| `main`      | Production / live  | Custom domain        | Public — after launch   |
| `develop`   | Staging (default)  | Preview (gated)      | You only (access-gated) |
| `feature/*` | One task           | Preview (per-commit) | You only (access-gated) |

- Gate preview/staging so the client/public/crawlers can't see WIP. Attach the real
  domain ONLY at launch.
- Env vars set PER ENVIRONMENT (production vs preview); secrets never client-exposed.
- CI gates builds/type-checks before anything reaches live.
- Going live = promote `develop → main` (direct merge / one click) — no PR friction.
- Commit identity: in a cloud agent, set git author via a SessionStart hook so commits
  show as the developer, not the agent.

---

## DIRECTORY STRUCTURE

```
HANDOFF.md                          live session-context doc, read FIRST every session
docs/session-archive.md             full history of older sessions/scope changes (reference)
design-system/                      design system reference (README, tokens/, components/) once adopted
[PROJECT-SPECIFIC — fill in the chosen framework's source structure]
rules/                              development discipline (see RULES INDEX)
.agents/skills/<name>/SKILL.md       vendored skills (committed) + skills-lock.json
.claude/settings.json               (enables frontend-design plugin + SessionStart/Stop hooks:
                                     git identity, HANDOFF.md auto-load, HANDOFF.md sync check)
scripts/cloud-git-identity.sh, print-handoff.sh, handoff-check.sh
DEPLOYMENT.md, .env.example, .mcp.json  (create per project as needed)
```

Mandatory: a custom 404, a SafeImage/fallback, Skeleton components, error-tracking wiring,
and a global error boundary (static-site equivalent: client error capture + 404).

---

## FRAMEWORK RULES ([PROJECT-SPECIFIC framework])

- [PROJECT-SPECIFIC conventions: component model, rendering mode, env-var prefixing,
  styling config, image handling, CSP-friendly scripts, etc.]
- Verify patterns against the INSTALLED framework version. Run search_web if unsure.
- Use `find-skills` to pull a maintained skill for the chosen framework when helpful.

---

## DATABASE RULES

[PROJECT-SPECIFIC. If a DB exists: IDOR/RLS, session-scoped queries, migrations (Hook 4).
 If none/delegated: state it + the equivalent obligation — verify the provider is hardened.]

---

## PAGES & ROUTES

| Route | Page | Auth | Key Purpose | Components |
|-------|------|------|-------------|------------|
| `/` | [PROJECT-SPECIFIC] | | | |

Hook 1 updates this after each new page.

---

## COMPONENT ARCHITECTURE

| Component | Type | Location | STANDARD/CUSTOM |
|-----------|------|----------|-----------------|
| [PROJECT-SPECIFIC] | | | |

Hook 2 updates this after each new component.

---

## API ROUTES & SERVER ACTIONS

| Endpoint | Method | Auth | Rate Limited | Description |
|----------|--------|------|--------------|-------------|
| [PROJECT-SPECIFIC] | | | | |

Hook 3 updates this after each endpoint.

---

## DATABASE SCHEMA

[PROJECT-SPECIFIC tables/fields/relationships, or "None". Note encryption needs. Hook 4.]

---

## ENVIRONMENT VARIABLES

| Variable | Used For | Secret? |
|----------|----------|---------|
| [PROJECT-SPECIFIC] | | |

Hook 5 keeps this table and `.env.example` in sync.

---

## DESIGN SYSTEM  ▶ SINGLE SOURCE OF TRUTH: [PROJECT-SPECIFIC tokens file] ◀

Centralize tokens (colour/typography/spacing/radius/shadow/motion) so a rebrand edits
ONE place. Once a design system is adopted, the durable reference (intent, content
rules, component specs, original token values) lives in **`design-system/`** (read
`design-system/README.md` first); the [PROJECT-SPECIFIC tokens file] is the canonical,
machine-consumed token set. **All front-end work goes through `frontend-design` AND
`design-taste-frontend` first (Rule 0); they MUST follow `design-system/` and the
canonical tokens, not improvise new colours/fonts/spacing.**
Hook 10 updates this section AND `design-system/README.md` after any token change. Swap
checklist when assets arrive:
1. Colour tokens 2. Fonts 3. Logo in Header/Footer 4. favicon + OG image 5. media.

---

## ERROR TRACKING SETUP

Tool: [PROJECT-SPECIFIC — MANDATORY]. Client + server capture, environment tag,
release = git SHA, source maps uploaded privately. Verify before M0 complete (throw →
confirm in dashboard → delete temp route → commit).

---

## WHAT NOT TO DO — LESSONS

- Do NOT write any UI before invoking `frontend-design` AND `design-taste-frontend` (Rule 0).
- Do NOT improvise a capability when `find-skills` can find a vetted skill.
- Do NOT add scope, an SSR adapter, a DB, or a public secret without approval.
- Do NOT use inline event handlers/scripts — breaks the CSP.
- Do NOT skip loading/error/empty states or clear a form on error.
- Do NOT commit `.env*` or real tokens in `.mcp.json`.
- Do NOT skip the security audit before launch — it is a release gate.
- Do NOT let the .md files fall out of sync — run the hooks after every feature, and
  update `HANDOFF.md` at session end (Hook 7).
