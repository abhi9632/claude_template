# SKILL: Project Planning Automation
# Version: 4.0 — General template for all projects (abhi9632)
# Purpose: Automate the full planning phase from brief/transcript → approved plan
#          → pre-filled AGENTS.md + CLAUDE.md + mcp.json pushed to a new GitHub repo.

---

## OVERARCHING GOAL

Every project Abhi takes on has ONE non-negotiable standard:
> A seamless, visually stunning, industry-level, production-ready product.

This is the baseline. Not aspirational. Claude treats every project as if it will be
showcased in a portfolio and reviewed by a senior engineer.

### NON-NEGOTIABLE WRITING RULE — NO EM DASHES

**Em dashes are banned across every project, every file, every output.**
This means: no `—` in copy, UI text, headings, labels, tooltips, error messages,
documentation, code comments, commit messages, or any other deliverable.

Use one of these instead:
- A comma: "We build sites, fast" not "We build sites — fast"
- A colon: "One goal: results" not "One goal — results"
- A semicolon: "We ship; you grow" not "We ship — you grow"
- Parentheses: "The plan (approved last week) is live"
- Split into two sentences

This rule has no exceptions. If you find an em dash anywhere, replace it.

---

## HOW TO INVOKE

Say any of the following:
- "New project — here's the brief: [paste]"
- "New client — here's the meeting transcript: [paste]"
- "Run project planning skill for [client name]"
- "Here are my notes from a client call: [paste]"

Claude executes ALL phases in sequence without further prompting.
Do NOT skip phases. Each phase gates the next.
Do NOT ask "what would you like to do?" — execute and present outputs.

---

## PHASE 0: PRE-FLIGHT RESEARCH

> MANDATORY before recommending any tech stack. Never rely on memorised pricing or
> package names — the market changes monthly. Lesson from Karavi: wrong tool choices
> caused major mid-project rework.

Run live searches for every category relevant to the project type:
- best full-stack framework [YEAR] comparison developer experience
- best database serverless [YEAR] comparison pricing free tier
- best auth provider [YEAR] Clerk Supabase Auth0 Better-Auth pricing
- best file storage [YEAR] Cloudflare R2 Supabase S3 Uploadthing pricing
- best transactional email [YEAR] Resend Postmark SendGrid pricing
- best payment provider [YEAR] Stripe Lemon Squeezy pricing AUS
- best headless CMS [YEAR] Sanity Contentful Payload Keystatic pricing
- best background jobs [YEAR] Trigger.dev Inngest Upstash pricing
- best deployment platform [YEAR] Vercel Railway Render Fly pricing
- best error tracking [YEAR] Sentry Highlight LogRocket Axiom pricing
- best animation library [YEAR] Framer Motion GSAP Motion
- best component library [YEAR] shadcn Radix Mantine Chakra
- best data visualisation [YEAR] Recharts Tremor Chart.js
- best map library [YEAR] React Map GL Leaflet Google Maps pricing

For each relevant category, output a scored comparison table:

| Provider | Free Tier | Paid Entry | Best For | DX Score | Lock-in | Recommended |
|----------|-----------|------------|----------|----------|---------|-------------|

Scoring matrix (apply to pick winner per category):
| Criterion | Weight |
|-----------|--------|
| Free tier covers MVP | 30% |
| Pricing at 10K MAU | 25% |
| DX / AI-tool compatibility | 20% |
| Maintenance burden | 15% |
| Lock-in risk | 10% |

If two options score within 5 points, show both with "pick A if X, pick B if Y."

---

## PHASE 1: BRIEF EXTRACTION

Accept any input format: transcript, email, brief document, bullet points, voice-to-text, or any combination.

Extract into this table:

| Field | Extracted Value | Confidence | Ask if Unknown |
|-------|----------------|------------|----------------|
| Client name / business | | | What is your business name? |
| Industry / niche | | | What industry are you in? |
| Primary website goal | | | What's the #1 thing this site must do? |
| Target audience | | | Who are your customers? |
| Pages / screens needed | | | How many pages are you thinking? |
| Core features | | | Any features — booking, store, blog, login? |
| Content ready? | | | Do you have copy, photos, and a logo ready? |
| Existing website? | | | Is there a site we're replacing? |
| Domain owned? | | | Do you own a domain already? |
| Budget range | | | Do you have a budget in mind? |
| Launch deadline | | | Is there a hard launch date? |
| Design preferences | | | Any sites you love the look of? |
| Integrations needed | | | Any tools to connect — CRM, payments, calendar? |
| Multi-language? | | | Do you need the site in multiple languages? |
| SEO priority? | | | Is getting found on Google important? |
| User accounts needed? | | | Will users need to log in or have profiles? |
| Admin panel needed? | | | Do you or the client need to manage content? |
| Mobile-first critical? | | | Is most of your traffic from mobile? |
| Analytics needed? | | | Do you need visitor tracking or dashboards? |

Rules:
- Confidence: HIGH (stated) / MEDIUM (inferred) / LOW (guessing)
- ALL LOW items → added to client survey in Phase 2
- NEVER assume budget — always flag as unknown
- If input is a transcript, read it fully before extracting

---

## PHASE 2: CLIENT SURVEY BUILDER

> Purpose: Fill Phase 1 information gaps — ONLY the gaps. Never ask what you already know.
> The cardinal rule: if the answer appears anywhere in the provided material, it is KNOWN. Do not ask for it.

### Step 1 — Separate KNOWN from ASK

Before writing a single question, go through every field in the Phase 1 extraction table plus
all raw input (brief, transcript, email, notes) and build two lists:

KNOWN — any field with HIGH or MEDIUM confidence, or stated anywhere in the source material.
ASK   — any field with LOW confidence, missing, or contradictory.

Common fields that briefs and meeting transcripts typically already answer
(always check before including a question):
- Business name and what it does
- Services or products offered
- Target audience and ideal customer description
- Primary website goal
- Design style / aesthetic preferences
- Launch timeline / target go-live date
- Number of pages and their names
- Whether the site should be mobile-first

If ANY of these appear in the provided material — even partially — they are KNOWN. Remove them.
Asking a client to re-state something they already told you reads as careless.

### Step 2 — Build the question set (ASK fields only)

For each ASK field, write one focused question. Rules for every question:
- One question, one answer — no multi-part questions disguised as one
- Provide a helpful placeholder or example in every text/textarea input
- Use radio buttons for anything with 3–4 mutually exclusive options
- Use checkboxes for "select all that apply" scenarios
- Group logically into 4–5 fieldsets maximum — never more than 6
- Always open with a contact details fieldset (Name + Email required; Phone + Address optional)
- Always close with a "Anything else?" open textarea

Questions that almost always belong in a survey (client-specific data no brief ever includes):
- Actual pricing in local currency (service drop-in prices, membership tiers with names + inclusions)
- Social media handles (Instagram, Facebook, TikTok — needed for footer links and meta tags)
- Domain name status (own one / have a name in mind / need to buy one)
- Booking or payment system status (do they have an Acuity / Stripe / similar account already?)
- Specific menu, product, or service details (names, ingredients, variants — content no one else knows)
- What content assets they have ready to send (photos, video, written copy — tick all that apply)
- Inspiration website URLs (style is often known from the brief; specific URLs are not)
- Pre-launch email capture decision (yes/no — only relevant for landing pages before a business opens)
- Success metric (what does a great outcome look like in 6 months — genuinely subjective)
- What they do NOT want (specific styles, features, or experiences to avoid)

### Step 3 — Build the survey using the proposals template

Source:   github.com/abhi9632/proposals → _template/index.html
Deployed: https://proposals-1xg.pages.dev/[client-slug]/
client-slug = business name, lowercase, hyphenated (e.g. reflekt, karavi, studio-nine)

Execution steps:
1. Duplicate _template/ → rename the folder to [client-slug]/
2. Replace every [PLACEHOLDER] in index.html — search for "[" to find them all
3. Drop the client's logo in the folder named logo.jpg (use a CSS placeholder if not yet received)
4. Populate Part 1 (tool/platform recommendation) from the Phase 3 stack decision
5. Populate Part 2 (investment card) from the agreed pricing
6. In Part 3 (brief form): keep ONLY the fieldsets and fields from Step 2 above
   — delete any fieldset or field that asks about a KNOWN item
   — re-number the fieldset legend markers (1, 2, 3 …) after removing sections
7. Create a Formspree form for this client at formspree.io (free, 50 submissions/month)
   → paste the form ID (e.g. xpzgkwlb) into the form action: formspree.io/f/[ID]
8. git add [client-slug]/ && git commit -m "Add [client-slug] proposal" && git push
9. Cloudflare Pages auto-deploys in ~30 seconds — no manual trigger needed

Live URL: https://proposals-1xg.pages.dev/[client-slug]/

### Step 4 — Output ready-to-send client message

"Hi [name], I've put together the proposal and a short brief — everything's in one place:

[URL]

The first two sections cover how the site will work and what's included. Section 3 is the brief — only the things I still need from you that I couldn't answer from our conversation. It takes about 5 minutes.

Let me know if anything's unclear."

---

## PHASE 3: TECH STACK RECOMMENDATION

Uses Phase 0 research. No hardcoded opinions.

Step 1 — Determine project type:
| Profile | Complexity | Direction |
|---------|-----------|-----------|
| Brochure / portfolio / landing page | Low | Static — no backend |
| Business site with contact form | Low-Med | Lightweight framework + form service |
| Content / blog-heavy | Med | Framework + headless CMS |
| E-commerce | Med-High | Framework + payments + DB |
| SaaS / member portal / dashboard | High | Full-stack + Auth + DB + Payments |
| Booking / appointment platform | High | Full-stack + Auth + DB + Calendar API |
| Marketplace / multi-vendor | Very High | Full-stack + Auth + DB + Payments + Storage |
| AI-powered app | High | Full-stack + AI SDK + DB + Auth |

Step 2 — For each layer, apply Phase 0 research. Output RECOMMENDATION + RUNNER-UP + SKIP.
Layers to evaluate (skip if not needed): Framework, Database, ORM, Auth, Storage, Email,
Payments, CMS, Background jobs, Deployment, Error tracking (MANDATORY), Analytics, AI SDK.

Step 3 — Frontend skills inventory. Research and recommend based on project visual requirements:
- UI component library (research current compatibility with chosen framework)
- Icon library
- CSS approach
- Animation library (only if brief demands it — confirm maintained + compatible)
- Charts (only if dashboards needed)
- Maps (only if location features needed)
- Rich text editor (only if user content or CMS editor needed)
- Video / media (only if needed)

For each frontend skill: confirm maintained, confirm framework compatibility, note special setup.

Step 4 — Output the final stack table:

Recommended Stack for [Project Name] | Researched: [DATE]

| Layer | Tool | Plan | Est. Monthly Cost | Why |
|-------|------|------|------------------|-----|
(all layers, total row, cost at launch / 1K users / 10K users)

Frontend Skills Required:
| Skill | Package | Version | Purpose | Setup Notes |
|-------|---------|---------|---------|-------------|

MCP Tools Needed:
- GitHub MCP (always required)
- [Others based on chosen stack — e.g. Supabase MCP, Sanity MCP, Stripe MCP]

---

## PHASE 4: PACKAGE & DEPENDENCY INVENTORY

Produce a complete, copy-paste-ready installation plan grouped by category.
Every package verified as current and compatible with the chosen stack.

Include:
- Scaffold command (research current recommended command for chosen framework)
- DB + ORM, Auth, UI components, Forms + validation, Email, Payments, CMS,
  Error tracking, Animation (if needed), Charts/Maps/Media (if needed),
  Utilities, Dev tools
- All environment variable names (no values)
- List of Claude skill files to load before each relevant feature

---

## PHASE 5: FULL PROJECT PLAN

Output the complete project plan:

# Project Plan: [Name] | [DATE] | v1.0 | AWAITING APPROVAL

1. Project Summary (3-4 sentences: what, who, problem, definition of success)
2. Quality Standard — non-negotiable: seamless, visually stunning, production-ready
3. Pages & Routes table (route, page name, auth required, purpose, components)
4. Component Architecture (grouped: layout / sections / primitives / feature / data — mark STANDARD or CUSTOM)
5. API Routes / Server Actions table
6. Database Schema (tables, key fields, relationships, fields needing encryption)
7. Environment Variables table
8. Frontend Skills Required table
9. Design System Decisions (colours, typography, spacing, motion, dark mode, component library)
10. Security Plan — all items below are MANDATORY, pre-wired from day one:
    - Global error boundary + Try Again button
    - Custom 404 page
    - Safe image component with fallback placeholder
    - Loading + error + empty states on every data fetch
    - Form: pending disable + error preservation + inline validation
    - Error tracking — client + server, stack trace, user context
    - HTTP security headers
    - Auth cookies: HttpOnly + Secure + SameSite
    - IDOR prevention — session ID only, never URL param
    - HMAC verification on all webhooks
    - Rate limiting on auth, forms, payments, AI, admin endpoints
    - Open redirect guard
    - Input validation + sanitisation on all user input
    - No secrets in client bundles
    - .env.example with all variable names
    - Full 50-point security audit at M6 (see CLAUDE.md)
11. Performance Targets — Lighthouse ≥ 90 mobile, LCP < 2.5s, CLS < 0.1
12. Accessibility — WCAG 2.1 AA minimum
13. Milestones table (M0–M8 with deliverables and est. days)
14. Risks & Flags
15. Out of Scope
16. Client Handoff Plan

---

## PHASE 5.5: SECURITY READINESS REVIEW

Before asking for approval, output:

Security Readiness Review:
1. Error boundary planned? ✅ / ❌
2. 404 page planned? ✅ / ❌
3. Image fallbacks planned? ✅ / ❌
4. Data fetch states (loading/error/empty) required? ✅ / ❌
5. Form hardening planned? ✅ / ❌
6. Error tracking planned (client + server)? ✅ / ❌
7. HTTP headers in framework config? ✅ / ❌
8. Auth cookies hardened? ✅ / ❌
9. IDOR prevention — session ID, not URL param? ✅ / ❌
10. Webhook HMAC verification? ✅ / ❌
11. Rate limiting on all sensitive endpoints? ✅ / ❌
12. Full 50-point audit scheduled at M6? ✅ / ❌

Any ❌ = BLOCKER. Do not ask for approval until all are ✅.

---

## PHASE 6: PLAN APPROVAL + REPO CREATION + FILE PRE-FILL + MCP SETUP

Pause and show:

⏸️ WAITING FOR YOUR APPROVAL
Reply with:
  "APPROVED"         → create repo, pre-fill all files, push to GitHub
  "CHANGE [what]"    → update that section and re-present
  "SKIP [section]"   → remove from scope
  "QUESTION: [what]" → clarify first
Say "APPROVED" to trigger. "Looks good" is not enough.

On APPROVED, Claude executes via MCP (no manual steps for Abhi):

1. Create GitHub repo: abhi9632/[project-slug]
   Private: true | Description: [1-line] | Auto-init with README

2. Pre-fill AGENTS.md:
   - All [PROJECT-SPECIFIC] values from approved plan
   - Full stack, DB, auth, deployment, error tracking filled in
   - Directory structure for chosen framework
   - Design tokens from Phase 5
   - Framework-specific rules (researched, not assumed)
   - Security rules adapted to the stack
   - "What not to do" with project-specific lessons

3. Pre-fill CLAUDE.md:
   - Project name + stack-specific workflow
   - Pre-launch checklist adapted to the chosen stack
   - Session 1 pre-populated in progress log

4. Create mcp.json in the project root:
   See MCP SETUP section below for the full template and rules.

5. Commit initial directory structure:
   - .env.example (all variable names, no values)
   - .gitignore for chosen stack
   - README.md stub with project name and setup instructions

6. Output:
   ✅ Repo live at github.com/abhi9632/[project-slug]
   ✅ AGENTS.md, CLAUDE.md, mcp.json pushed
   ✅ Initial structure committed — open in Claude Code and start M0

---

## MCP SETUP

Claude must create a .mcp.json file in the project root on APPROVED.
This file enables Claude Code to directly interact with all services used by the project.

Base template (always include GitHub, always include filesystem):

{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_TOKEN}"
      }
    },
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "."]
    }
  }
}

Add the following entries based on the chosen stack (research current package names):

If Supabase: add @supabase/mcp-server-supabase
If Sanity CMS: add sanity-mcp-server or @sanity/mcp
If Stripe: add stripe-mcp or equivalent
If Vercel: add @vercel/mcp-adapter or equivalent
If Upstash: add @upstash/mcp-server
If Neon / PlanetScale / Turso: research current MCP package for chosen DB

Rules:
- Only include MCPs for services actually used in the approved stack
- Never hardcode real tokens in mcp.json — always use environment variable references like ${VAR_NAME}
- Always include a comment block at the top of the file explaining each entry
- If no MCP server exists for a chosen service, note it clearly and skip that entry
- Research all MCP package names before writing — never guess package names
- After creating mcp.json, tell Abhi:
  "Add your tokens to your shell environment or a local .env.local file.
   Never commit real credentials. mcp.json is already in .gitignore."
- Add mcp.json to .gitignore if it will contain any env var references

---

## LIVE DOCUMENTATION HOOKS

After plan approval, every feature built during development must trigger these updates.
Claude must run these hooks automatically at the end of every completed feature, not just at end of session.

Hook 1 — After any new route, page, or screen is completed:
Update AGENTS.md → Pages & Routes table with the new route, auth status, and components used.

Hook 2 — After any new component is created:
Update AGENTS.md → Component Architecture with the component name, type (STANDARD/CUSTOM), and location.

Hook 3 — After any new API route or server action is created:
Update AGENTS.md → API Routes table with endpoint, method, auth required, rate limited status.

Hook 4 — After any schema change (new table, column, index, relation):
Update AGENTS.md → Database Schema section. Note the change, the reason, and the migration file name.

Hook 5 — After any new environment variable is added:
Update AGENTS.md → Environment Variables table AND update .env.example in the repo.

Hook 6 — After any scope change (feature added or removed from approved plan):
Update CLAUDE.md → Scope Change Log with date, what changed, reason, and that Abhi approved it.

Hook 7 — After every completed session:
Update CLAUDE.md → Progress Log with date, milestone, completed work, files changed, blockers, and next task.
This is already in CLAUDE.md but restated here to reinforce it is non-negotiable.

Hook 8 — After any new third-party service or package is added to the project:
Update AGENTS.md → Project Identity stack section.
Update .env.example with any new variable names.
Update mcp.json if the new service has an MCP server available (research first).

Hook 9 — After any security-relevant change (new auth flow, new webhook, new form, new API):
Re-run the relevant security checklist items from CLAUDE.md Pre-Launch Checklist and mark updated status.
If a new risk is introduced, add it to the project plan Risks & Flags section in AGENTS.md.

Hook 10 — After any design system change (new token, new component variant, colour change):
Update AGENTS.md → Design System section with the new value.

Summary: the .md files must always reflect the current true state of the project.
Never let them fall out of sync. A stale AGENTS.md is as dangerous as no AGENTS.md.

---

## PHASE 0 REFRESH RULE

If more than 30 days have passed since this skill was last used, re-run ALL Phase 0 searches.
Never reuse pricing, versions, or recommendations from memory.
The Karavi lesson: researching the wrong version of a tool mid-project cost weeks.

---

## GLOBAL QUALITY RULES (every project, every session)

1. Every UI must feel intentional — no unstyled components or placeholder layouts in production.
2. Mobile-first is the default — build for small screens, scale up, test on real sizes.
3. Performance is part of the design — images optimised, fonts no layout shift, LCP fast.
4. Every state must be handled — loading, error, empty, success. Blank screens are bugs.
5. Every form must be bulletproof — pending state, error preservation, inline validation.
6. Accessibility is not optional — keyboard nav, ARIA, contrast, touch targets, built in.
7. Security is built in from day one — not audited at the end.
8. Generated code is never trusted blindly — review for hidden endpoints and hardcoded values.
