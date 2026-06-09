# Project Template — CLAUDE · AGENTS · rules/ · SKILL

Reusable starting point for any new client project built with Claude Code. Drop these
into a fresh repo and the planning skill fills in the rest.

## The three-layer doc model

```
CLAUDE.md   →   AGENTS.md            →   rules/*.md
(bootstrap)     (project facts +         (the development
 read every      RULES INDEX that         discipline — read
 session)        points into rules/)      the matching file)
```

| File / folder | Role |
|---------------|------|
| `CLAUDE.md` | **Per-session bootstrap** (< 200 lines) — identity, session-startup steps, Rule 0 + skill-discovery reminders, decision table, the Progress/Scope logs. |
| `AGENTS.md` | **Project facts + RULES INDEX** — identity, structure, tables (pages/components/API/env), design tokens, deployment. References the rule files. |
| `rules/` | **The development discipline** — `frontend-design.md` (Rule 0), `development-workflow.md`, `data-and-forms.md`, `security.md` (rules + audit), `pre-launch-checklist.md`, `quality.md`, `documentation-hooks.md`. |
| `SKILL.md` | Planning automation — brief/transcript → researched plan → pre-filled docs. Run it first on any new brief. |
| `.claude/settings.json` | Enables the `frontend-design` skill in every session (local + cloud). |

> Rule of thumb: needed *the moment a session starts* → CLAUDE.md. A rule you follow
> *while building* → a file in `rules/` (indexed from AGENTS.md). A project *fact* →
> AGENTS.md.

## The two standing skill rules baked in

1. **`frontend-design` is mandatory (RULE 0).** Before any front-end/UI code, Claude
   invokes Anthropic's official `frontend-design` skill. Enabled via
   `.claude/settings.json` (marketplace `claude-code-plugins`, repo `anthropics/claude-code`),
   so it auto-loads — no manual install.

2. **`find-skills` for everything else.** When a task needs a capability without an
   existing skill, Claude discovers one on the go:
   - `npx skills find "<task or domain>"` (leaderboard: https://skills.sh/)
   - `npx skills add <owner/repo@skill>` to install the best fit
   - Install the guided skill once: `npx skills add vercel-labs/skills@find-skills`

## How to start a new project

1. Create a new repo from these files.
2. Paste your client brief/transcript and say *"Run the project planning skill."*
   (`SKILL.md` drives Phases 0–6.)
3. On `APPROVED`, the docs get filled in and the build begins at M0.

## Notes

- **Network:** the environment must allow GitHub (and npm) so `frontend-design` and the
  `npx skills` registry can be fetched. A "Trusted" network policy is the easy default.
- **Cloud agent commit identity:** if commits should show as you (not the agent), add a
  `SessionStart` hook in `.claude/settings.json` that sets `git config user.name/email`.
- **Staging → production:** see the Deployment section in AGENTS.md; create a per-project
  `DEPLOYMENT.md` with the concrete host + commands.
