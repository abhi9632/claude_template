# SKILL: Project Planning Automation
# Version: 4.2 — General template for all projects
# Purpose: Automate planning from brief/transcript → approved plan → pre-filled
#          CLAUDE.md + AGENTS.md + rules/*.md + .mcp.json + .claude/settings.json
#          pushed to a GitHub repo.
#
# 4.x adds: SKILLS-FIRST principle (frontend-design mandatory for UI; find-skills for
#           anything else) and the three-layer doc model
#           (CLAUDE.md → AGENTS.md → rules/).

---

## OVERARCHING GOAL

Every project has ONE non-negotiable standard:
> A seamless, visually stunning, industry-level, production-ready product.

Claude treats every project as if it will be showcased in a portfolio and reviewed by a
senior engineer.

---

## SKILLS-FIRST PRINCIPLE (applies to every phase)

1. **`frontend-design` is mandatory for ALL front-end work (RULE 0).** Before any
   UI/markup/CSS/component, invoke Anthropic's official `frontend-design` skill
   (marketplace `claude-code-plugins`, repo `anthropics/claude-code`). The scaffold
   enables it in `.claude/settings.json` so it auto-loads every session.

2. **Discover skills on the go with `find-skills`.** When a task needs expertise you
   don't already have a skill for, run `npx skills find "<task>"` (leaderboard:
   https://skills.sh/), prefer battle-tested/official skills, install with
   `npx skills add <owner/repo@skill>`, and use it. Install the guided skill once with
   `npx skills add vercel-labs/skills@find-skills`. Never hand-roll what a vetted skill
   does well; never guess when a skill could tell you.

These two rules are written into the generated docs (Phase 6).

---

## DOC MODEL (three layers)

- **CLAUDE.md = per-session bootstrap (< 200 lines).** Only what's needed at session
  start: project one-liner, identity, startup steps, Rule 0 + skill-discovery reminders,
  decision table, a pointer to AGENTS.md, and the Progress/Scope logs.
- **AGENTS.md = project facts + RULES INDEX.** Identity, structure, tables (pages,
  components, API, env), design tokens, deployment — plus a table that references the
  rule files in `rules/`.
- **rules/*.md = the development discipline.** frontend-design (Rule 0),
  development-workflow, data-and-forms, security (+ production audit),
  pre-launch-checklist, quality, documentation-hooks.

---

## HOW TO INVOKE

Say any of: "New project — here's the brief: [paste]" · "Run project planning skill for
[client]" · "Here are my notes." Claude executes ALL phases in sequence. Do NOT skip
phases — each gates the next. Do NOT ask "what would you like to do?" — execute.

---

## PHASE 0: PRE-FLIGHT RESEARCH

> MANDATORY before recommending any tech stack. Never rely on memorised pricing/packages.

- Run `find-skills` for the project type to surface specialized skills/workflows.
- Live-search every relevant category: framework · database · auth · file storage ·
  email · payments · CMS · background jobs · deployment · error tracking · animation ·
  component library · data viz · maps — each "[YEAR] comparison pricing free tier".

Output a scored comparison table per category:

| Provider | Free Tier | Paid Entry | Best For | DX Score | Lock-in | Recommended |
|----------|-----------|------------|----------|----------|---------|-------------|

Weights: free tier covers MVP 30% · pricing at 10K MAU 25% · DX/AI-tool compat 20% ·
maintenance 15% · lock-in 10%. If two are within 5 pts, show both with "pick A if X."

---

## PHASE 1: BRIEF EXTRACTION

Accept any input. Extract into a table: | Field | Extracted Value | Confidence | Ask if Unknown |
Fields: client/business · industry · primary goal · audience · pages/screens · core
features · content ready? · existing site? · domain owned? · budget · launch deadline ·
design preferences · integrations · multi-language? · SEO? · user accounts? · admin? ·
mobile-first? · analytics? Confidence HIGH/MEDIUM/LOW. ALL LOW → survey (Phase 2).
NEVER assume budget. Read a transcript fully before extracting.

---

## PHASE 2: CLIENT SURVEY BUILDER

Professional, brand-neutral, mobile-first survey (single index.html, no build step) to
fill Phase 1 gaps. Progress indicator, "~5 minutes", in-page thank-you, Formspree (or
similar). Sections: business · goals · pages & features · content & assets · design
preferences · technical details · timeline & budget · anything else. Host where the
client can reach it (separate from any gated staging). Output a ready-to-send message.

---

## PHASE 3: TECH STACK RECOMMENDATION

Step 1 — Project type (brochure → static; business+form → lightweight+form service;
content → +CMS; e-commerce → +payments+DB; SaaS/portal/booking/marketplace/AI →
full-stack + needed layers). Step 2 — Per layer: RECOMMENDATION + RUNNER-UP + SKIP.
Error tracking MANDATORY. Step 3 — Frontend skills: **`frontend-design` always in the
stack**; then UI lib · icons · CSS · animation (if brief demands) · charts/maps/rich-text/
media (only if needed) — confirm maintained + compatible, use `find-skills`. Step 4 —
final stack table (layer · tool · plan · est. cost · why) + Frontend Skills + MCP tools.

---

## PHASE 4: PACKAGE & DEPENDENCY INVENTORY

Copy-paste install plan grouped by category, every package verified current/compatible:
scaffold · DB+ORM · auth · UI · forms+validation · email · payments · CMS · error
tracking · animation/charts/maps/media (if needed) · utilities · dev tools. All env var
names (no values). Skills to load per feature — always `frontend-design` for UI,
`find-skills` for gaps.

---

## PHASE 5: FULL PROJECT PLAN

# Project Plan: [Name] | [DATE] | v1.0 | AWAITING APPROVAL
1 Summary · 2 Quality Standard · 3 Pages & Routes · 4 Component Architecture · 5 API
Routes · 6 DB Schema · 7 Env Vars · 8 Frontend Skills · 9 Design System · 10 Security
Plan (all mandatory items pre-wired) · 11 Performance · 12 Accessibility · 13 Milestones
(M0–M8) · 14 Risks & Flags · 15 Out of Scope · 16 Client Handoff.

---

## PHASE 5.5: SECURITY READINESS REVIEW

12-point checklist (error boundary, 404, image fallbacks, fetch states, form hardening,
error tracking, HTTP headers, auth cookies, IDOR, webhook HMAC, rate limiting, audit
scheduled). Any ❌ = BLOCKER — do not ask for approval until all ✅.

---

## PHASE 6: PLAN APPROVAL + REPO + FILE PRE-FILL + SETTINGS

Pause: "⏸️ WAITING FOR YOUR APPROVAL — APPROVED / CHANGE [x] / SKIP [x] / QUESTION [x]."
"Looks good" is not enough. On APPROVED, Claude executes (no manual steps for client):

1. Create GitHub repo: [OWNER]/[project-slug] (private, auto-init README).
2. Pre-fill **CLAUDE.md** — the SHORT per-session bootstrap (< 200 lines): project
   one-liner, identity, startup steps, Rule 0 + skill-discovery reminders, decision
   table, pointer to AGENTS.md, Session 1 in the progress log. No rule detail here.
3. Pre-fill **AGENTS.md** — project facts (identity, structure, tables, design tokens,
   deployment) + the RULES INDEX that references the rule files.
4. Create **rules/** — frontend-design, development-workflow, data-and-forms, security,
   pre-launch-checklist, quality, documentation-hooks (tailor to the chosen stack).
5. Create **.mcp.json** (GitHub + filesystem always; add per stack; env-var refs only).
6. Create **.claude/settings.json** enabling the design skill in every session:
   ```json
   {
     "extraKnownMarketplaces": {
       "claude-code-plugins": { "source": { "source": "github", "repo": "anthropics/claude-code" } }
     },
     "enabledPlugins": [ { "marketplace": "claude-code-plugins", "plugin": "frontend-design" } ]
   }
   ```
   (Also wire a SessionStart hook here if commit identity must be set in a cloud agent.)
7. Commit initial structure: .env.example (names only) · .gitignore · README · DEPLOYMENT.md.
8. Output: ✅ repo live · ✅ docs pushed · ✅ open in Claude Code, start M0.

> Network note: the environment must allow GitHub so `frontend-design` (and the
> `npx skills` registry) can be fetched. Prefer a "Trusted" network policy.

---

## MCP SETUP

Always include GitHub + filesystem. Add per stack (research current names): Supabase,
Sanity, Stripe, Vercel, Upstash, Neon/PlanetScale/Turso, etc. Rules: only services
actually used · never hardcode tokens (use `${VAR}`) · comment each entry · skip (and
note) any service with no MCP · research package names, never guess.

---

## LIVE DOCUMENTATION HOOKS (run after every completed feature)

1 route → AGENTS.md Pages & Routes · 2 component → Component Architecture · 3 API → API
Routes · 4 schema → Database Schema + migration · 5 env var → env table + .env.example ·
6 scope → CLAUDE.md Scope Change Log · 7 session end → CLAUDE.md Progress Log · 8 service/
package → identity + .env.example + mcp.json · 9 security change → re-check rules/security
+ rules/pre-launch-checklist · 10 design-system change → Design System.

The .md files must always reflect the current true state. A stale AGENTS.md is as
dangerous as none.

---

## PHASE 0 REFRESH RULE

If > 30 days since last use, re-run ALL Phase 0 searches (and re-check `find-skills` for
newer skills). Never reuse pricing, versions, or recommendations from memory.

---

## GLOBAL QUALITY RULES (every project, every session)

1. Every UI intentional — produced via `frontend-design` (Rule 0). 2. Mobile-first.
3. Performance is part of the design. 4. Every state handled (loading/error/empty/
success). 5. Every form bulletproof. 6. Accessibility built in. 7. Security from day
one. 8. Generated code never trusted blindly. 9. Reach for a skill before improvising —
`find-skills` finds it.
