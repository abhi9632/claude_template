# rules/frontend-design.md — RULE 0 + Skill Discovery

## 🔴 RULE 0 — the `frontend-design` skill is MANDATORY

**Before writing ANY line of front-end code, you MUST invoke the `frontend-design`
skill first.** "Front-end code" = any HTML, CSS, utility/Tailwind classes, view-layer
JS/TS, JSX/TSX/`.astro`/`.vue`/`.svelte` markup, component, layout, animation, or
visual/styling change — anything the user sees. If in doubt, it counts.

- Anthropic's official **`frontend-design`** plugin (marketplace `claude-code-plugins`,
  repo `anthropics/claude-code`), enabled in `.claude/settings.json` so it auto-loads
  every session. Invoke via the Skill tool / `/frontend-design`.
- Hard blocker — nothing visual is written until it has run for that piece of work.
- If it won't load, STOP and tell [CLIENT] (usually the network policy must allow GitHub).

**Process:** invoke `frontend-design` → let it set the aesthetic direction (purpose/tone,
typography, colour, motion, spatial composition) → build the markup/styles using this
project's design tokens → cover every visual state (default, hover/focus, loading,
error, empty, success) → respect accessibility and `prefers-reduced-motion`.

## 🟢 SKILL DISCOVERY — `find-skills` before improvising

When a task needs a capability you don't already have a skill for, discover one:
1. `npx skills find "<task or domain>"` (leaderboard: https://skills.sh/).
2. Prefer battle-tested, official skills (high install counts, reputable source).
3. `npx skills add <owner/repo@skill>` → use it.

Install the guided skill once: `npx skills add vercel-labs/skills@find-skills`. Never
hand-roll what a vetted skill already does well; never guess when a skill could tell you.
