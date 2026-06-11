# rules/frontend-design.md — RULE 0 + Skill Discovery

## 🔴 RULE 0 — `frontend-design` AND `design-taste-frontend` are MANDATORY

**Before writing ANY line of front-end code, you MUST invoke BOTH of these skills,
in order:**

1. **`frontend-design`** — Anthropic's official front-end design skill (source:
   `anthropics/claude-code`).
2. **`design-taste-frontend`** — anti-slop layout/typography/motion/spacing taste
   skill (source: https://github.com/Leonxlnx/taste-skill).

Both should be **vendored in this repo** at `.agents/skills/<name>/SKILL.md`
(symlinked into `.claude/skills/<name>/` for Claude Code's Skill tool), see "Vendored
skills" below. Invoke both via the Skill tool / `/frontend-design` and
`/design-taste-frontend`. The vendored copies are the guaranteed path; they load every
session with no network dependency. The `frontend-design` marketplace plugin entry in
`.claude/settings.json` is a legacy fallback and can be removed once vendoring is
confirmed working.

"Front-end code" = any HTML, CSS, utility/Tailwind classes, view-layer JS/TS,
JSX/TSX/`.astro`/`.vue`/`.svelte` markup, component, layout, animation, or
visual/styling change, anything the user sees. If in doubt, it counts.

- Hard blocker: nothing visual is written until BOTH have run for that piece of work.
- If this project has adopted a design system (`design-system/README.md`), it is the
  source of truth for palette, typography, tokens and component specs.
  `design-taste-frontend`'s brief-inference / aesthetic-dial guidance (its early
  sections) does NOT override that: use it for the layout/motion/density/anti-default
  discipline (its later sections) on top of the existing design system, not to pick a
  new aesthetic. If no design system exists yet, `frontend-design` and
  `design-taste-frontend` set the direction together, and the result should be recorded
  in `design-system/README.md` (Hook 10).
- If a skill genuinely won't load (vendored copy missing AND marketplace fails), STOP
  and tell [CLIENT], but proceed using `design-system/` (if it exists) so work isn't
  blocked, see "Vendored skills" troubleshooting below.

**Process:** invoke `frontend-design` -> invoke `design-taste-frontend` -> if this
project has a design system (`design-system/README.md`), follow it: do not improvise a
different aesthetic, typography, colour, motion or spatial composition -> build the
markup/styles using ONLY this project's design tokens (mirrored in
`design-system/tokens/` if adopted) -> for new components, check
`design-system/components/*.prompt.md` for an existing spec before inventing one. If
no spec exists yet (new component, the folder is empty, or no design system is
adopted), design it from `design-system/README.md` foundations (or from
`design-taste-frontend`'s discipline alone if no design system exists), build it, then
write a new `<ComponentName>.prompt.md` in `design-system/components/` following the
`_TEMPLATE.prompt.md` pattern and add it to the Components table in
`design-system/README.md` (Hook 2 + Hook 10) so the next session reuses it instead of
reinventing it -> cover every visual state (default, hover/focus, loading, error,
empty, success) -> respect accessibility and `prefers-reduced-motion` -> follow this
project's content rules (casing, voice, punctuation) from `design-system/README.md`
if adopted.

## 🟡 VENDORED SKILLS — install once, commit, never re-fetch at runtime

Every external skill this project depends on (`frontend-design`,
`design-taste-frontend`, `find-skills`) should be vendored in-repo so it survives
across sessions and fresh containers without depending on network access or the plugin
marketplace at session start (a marketplace plugin can fail with "Unknown skill" in a
fresh cloud container with no prior install):

- Install: `npx skills add <github-url-or-owner/repo> --skill "<skill-name>"`. This
  writes the portable skill to `.agents/skills/<skill-name>/SKILL.md`, symlinks it into
  `.claude/skills/<skill-name>/` for Claude Code, and records it in `skills-lock.json`.
- **Commit `.agents/skills/` and `skills-lock.json`**, small text files, not
  `node_modules`. `.claude/skills/` is a generated symlink directory and should be
  gitignored.
- The skill is then available via the Skill tool by name (e.g. `frontend-design`,
  `design-taste-frontend`, `find-skills`) every session, with zero install step.
- Recommended on every project: vendor `frontend-design` (from
  `anthropics/claude-code`), `design-taste-frontend` (from `Leonxlnx/taste-skill`), and
  `find-skills` (from `vercel-labs/skills`) at project setup. All three then show up in
  the Skill tool's available-skills list automatically once `.agents/skills/` is on
  disk.
- Troubleshooting "Unknown skill" / non-zero exit: confirm `.agents/skills/<name>/
  SKILL.md` exists (committed). If `.claude/skills/<name>` (the symlink Claude Code's
  loader uses) is missing, e.g. on a fresh clone, recreate it with
  `mkdir -p .claude/skills && ln -s ../../.agents/skills/<name> .claude/skills/<name>`,
  or just re-run the install command above (idempotent against `skills-lock.json`). If
  a skill is missing from `.agents/skills/` entirely, re-run the install command and
  commit the result.

## 🟢 SKILL DISCOVERY — `find-skills` before improvising

`find-skills` should be vendored (see above), invoke it via the Skill tool, no install
step needed. When a task needs a capability you don't already have a skill for:
1. `npx skills find "<task or domain>"` (leaderboard: https://skills.sh/), or use the
   vendored `find-skills` skill directly.
2. Prefer battle-tested, official skills (high install counts, reputable source).
3. `npx skills add <owner/repo> --skill "<skill-name>"` -> vendor and commit it (see
   "Vendored skills" above) so it loads every session with no re-install -> use it.

Never hand-roll what a vetted skill already does well; never guess when a skill could
tell you.
