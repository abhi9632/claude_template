# Project Template — HANDOFF · CLAUDE · AGENTS · rules/ · SKILL

Reusable starting point for any new client project built with Claude Code. Drop these
into a fresh repo and the planning skill fills in the rest. Stack-, client- and
host-agnostic: everything project-specific is a clearly marked placeholder.

## The doc model

```
HANDOFF.md   →   CLAUDE.md   →   AGENTS.md            →   rules/*.md
(live state,     (bootstrap,     (project facts +         (the development
 read FIRST       read every      RULES INDEX that         discipline — read
 every session)   session)        points into rules/)      the matching file)
```

| File / folder | Role |
|---------------|------|
| `HANDOFF.md` | **Live state, read FIRST every session** — where we left off, what's next, blockers, a document map, and the rolling session/scope logs. Auto-loaded into context by a SessionStart hook. |
| `CLAUDE.md` | **Per-session bootstrap** (< 200 lines) — identity, session-startup steps, no-em-dash rule, Rule 0 + skill-discovery reminders, decision table, pointer to HANDOFF.md for logging. |
| `AGENTS.md` | **Project facts + RULES INDEX** — identity, structure, tables (pages/components/API/env), design tokens, deployment. References the rule files. |
| `rules/` | **The development discipline** — `frontend-design.md` (Rule 0), `development-workflow.md`, `data-and-forms.md`, `security.md` (rules + audit), `pre-launch-checklist.md`, `quality.md`, `documentation-hooks.md`. |
| `design-system/` | **Durable design-system reference** (once adopted) — `README.md` (intent, content rules), `components/*.prompt.md` specs, `tokens/` reference values. All front-end work follows this. |
| `docs/session-archive.md` | Full history of older sessions/scope changes (reference only; HANDOFF.md prunes into it). |
| `scripts/` | `print-handoff.sh` (load HANDOFF.md at session start), `handoff-check.sh` (Stop-hook sync check), `cloud-git-identity.sh` (set commit identity in a cloud agent). |
| `SKILL.md` | Planning automation — brief/transcript → researched plan → pre-filled docs. Run it first on any new brief. |
| `.claude/settings.json` | Enables the `frontend-design` plugin and wires the SessionStart/Stop hooks above. |

> Rule of thumb: needed *the moment a session starts* → HANDOFF.md (state) / CLAUDE.md
> (rules). A rule you follow *while building* → a file in `rules/` (indexed from
> AGENTS.md). A project *fact* → AGENTS.md. The live "where are we" → HANDOFF.md.

## The standing skill rules baked in

1. **`frontend-design` AND `design-taste-frontend` are mandatory (RULE 0).** Before any
   front-end/UI code, Claude invokes both: Anthropic's official `frontend-design`
   (source `anthropics/claude-code`) and `design-taste-frontend`
   (https://github.com/Leonxlnx/taste-skill) for anti-slop layout/motion/density taste.

2. **`find-skills` for everything else.** When a task needs a capability without an
   existing skill, Claude discovers one (`npx skills find "<task>"`, leaderboard
   https://skills.sh/), then vets and uses it.

3. **Vendor the skills you depend on.** Install each skill once with
   `npx skills add <owner/repo> --skill "<name>"`, then commit `.agents/skills/<name>/`
   + `skills-lock.json` (the `.claude/skills/` symlink is gitignored/regenerated). Then
   the skills load every session with no network/marketplace dependency. Recommended:
   vendor `frontend-design`, `design-taste-frontend`, and `find-skills` at setup. See
   `rules/frontend-design.md` > Vendored skills.

## How to start a new project

1. Create a new repo from these files (everything except SKILL.md can ship as-is; fill
   in the `[PLACEHOLDER]` values as you go).
2. Set your commit identity in `scripts/cloud-git-identity.sh` (replace
   `[YOUR_GITHUB_USERNAME]` / `[YOUR_EMAIL]`), and vendor the standing skills (above).
3. Paste your client brief/transcript and say *"Run the project planning skill."*
   (`SKILL.md` drives Phases 0–6.) On `APPROVED`, the docs get filled in (including
   HANDOFF.md) and the build begins at M0.

## Notes

- **Network:** the environment must allow GitHub (and npm) to vendor the skills with
  `npx skills add`. Once vendored and committed, they load offline. A "Trusted" network
  policy is the easy default at setup time.
- **Cloud agent commit identity:** `scripts/cloud-git-identity.sh` (wired as a
  SessionStart hook) re-applies `git config user.name/email` each session so commits
  show as you, not the agent, even after a container rebuild. Fill in the placeholders.
- **Live context across sessions:** `HANDOFF.md` + the SessionStart/Stop hooks give
  every new session (and every brand-new chat) full context automatically, and remind
  you to update it before stopping. Keep it short; it prunes into
  `docs/session-archive.md`.
- **Staging → production:** see the Deployment section in AGENTS.md; create a per-project
  `DEPLOYMENT.md` with the concrete host + commands.
