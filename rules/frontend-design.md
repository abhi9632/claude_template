# rules/frontend-design.md — RULE 0 + Skill Discovery

## 🔴 RULE 0 — `frontend-design` AND `design-taste-frontend` are MANDATORY

**Before writing ANY line of front-end code, invoke BOTH skills in order:**

1. **`frontend-design`** — Anthropic's official front-end design skill.
2. **`design-taste-frontend`** — anti-slop layout/typography/motion/spacing taste skill.

Both should be vendored at `.agents/skills/<name>/SKILL.md`. Invoke via the Skill tool.
If a skill won't load (symlinks missing in fresh container), read `.agents/skills/frontend-design/SKILL.md` and `.agents/skills/design-taste-frontend/SKILL.md` end to end as fallback — Rule 0 still applies in full. For install/troubleshoot, see `docs/skills-setup.md`.

"Front-end code" = any HTML, CSS, Tailwind classes, view-layer JS/TS, JSX/TSX/`.astro`/`.vue`/`.svelte` markup, component, layout, animation, or visual/styling change. If in doubt, it counts.

- Hard blocker — nothing visual is written until BOTH have run.
- If this project has adopted a design system (`design-system/README.md`), it is the source of truth for palette, typography, tokens, and component specs. `design-taste-frontend` early sections do NOT override it — use its layout/motion/density discipline on top of the existing system. If no design system exists yet, both skills set the direction together; record the result in `design-system/README.md` (Hook 10).
- If a skill genuinely won't load, tell [CLIENT] but proceed using `design-system/` so work isn't blocked.

**Process:** invoke `frontend-design` → invoke `design-taste-frontend` → if design system exists, follow `design-system/README.md`; do not improvise palette, type, or spacing → build using only this project's design tokens → for new components, check `design-system/components/*.prompt.md`; if none, design from foundations, build it, write `<ComponentName>.prompt.md` in the same format, add to Components table (Hook 10) → cover every visual state (default, hover/focus, loading, error, empty, success) → respect accessibility and `prefers-reduced-motion` → follow content rules from `design-system/README.md`.

## 🟡 VENDORED SKILLS

Vendor `frontend-design`, `design-taste-frontend`, and `find-skills` at project setup so they survive fresh containers with no network dependency. All load automatically via the Skill tool once `.agents/skills/` is on disk.

For install commands, re-add steps, and troubleshoot, see `docs/skills-setup.md`.

## 🟢 SKILL DISCOVERY — `find-skills` before improvising

When a task needs a capability you don't have a skill for:
1. Invoke the vendored `find-skills` skill, or run `npx skills find "<task>"` (leaderboard: https://skills.sh/).
2. Prefer battle-tested, official skills (high install counts, reputable source).
3. Vendor and commit it via `docs/skills-setup.md` install steps so it loads every session.

Never hand-roll what a vetted skill already does well.
