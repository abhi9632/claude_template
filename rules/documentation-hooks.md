# rules/documentation-hooks.md — Live documentation hooks

Run these after every completed feature (not just session end). Full definitions in
`SKILL.md`. The .md files must always reflect the current true state of the project — a
stale AGENTS.md is as dangerous as none.

| Hook | Trigger | Update |
|------|---------|--------|
| 1 | New page / route | `AGENTS.md` → Pages & Routes |
| 2 | New component | `AGENTS.md` → Component Architecture |
| 3 | New API route / server action | `AGENTS.md` → API Routes |
| 4 | Schema change | `AGENTS.md` → Database Schema + migration note |
| 5 | New env variable | `AGENTS.md` → Environment Variables **and** `.env.example` |
| 6 | Scope change | `CLAUDE.md` → Scope Change Log |
| 7 | End of session | `CLAUDE.md` → Progress Log |
| 8 | New service / package | `AGENTS.md` identity + `.env.example` + mcp.json |
| 9 | Security-relevant change | re-check `rules/security.md` / `rules/pre-launch-checklist.md` |
| 10 | Design-system change | `AGENTS.md` → Design System |
