# docs/skills-setup.md — Vendored skills: install, re-add, troubleshoot

Read this file ONLY when a skill is missing, broken, or needs to be added.
For normal Rule 0 usage, see `rules/frontend-design.md`.

## Install a new skill

```sh
npx skills add <github-url-or-owner/repo> --skill "<skill-name>"
```

This writes the skill to `.agents/skills/<skill-name>/SKILL.md`, symlinks it into `.claude/skills/<skill-name>/` for Claude Code, and records it in `skills-lock.json`.

**Always commit `.agents/skills/` and `skills-lock.json`** — small text files, not node_modules. `.claude/skills/` is gitignored (generated symlinks).

## Re-add symlinks after a fresh clone

Symlinks in `.claude/skills/` may be missing on a fresh container. Recreate:

```sh
mkdir -p .claude/skills
ln -s ../../.agents/skills/<name> .claude/skills/<name>
```

Or re-run the install command above (idempotent against `skills-lock.json`).

## Known limitation — mid-session symlink recreation

The Skill tool's registry is fixed at session start. Symlinks recreated mid-session still raise "Unknown skill" until the next session.

**Working fallback:** read `.agents/skills/frontend-design/SKILL.md` and `.agents/skills/design-taste-frontend/SKILL.md` end to end (Read tool) before any UI work, then proceed. Recreate symlinks anyway so the next session loads normally.

## If a skill is missing from `.agents/skills/` entirely

Re-run the install command and commit the result.

## Recommended skills to vendor at project setup

| Skill | Source |
|-------|--------|
| `frontend-design` | `anthropics/claude-code` |
| `design-taste-frontend` | `Leonxlnx/taste-skill` |
| `find-skills` | `vercel-labs/skills` |
