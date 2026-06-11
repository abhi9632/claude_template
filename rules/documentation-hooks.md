# rules/documentation-hooks.md — Live documentation hooks

Run these after every completed feature (not just session end). Each row below is the
complete definition for that hook: self-contained, no external lookup needed. The .md
files must always reflect the current true state of the project: a stale AGENTS.md is
as dangerous as none.

| Hook | Trigger | Update |
|------|---------|--------|
| 1 | New page / route | `AGENTS.md` > Pages & Routes |
| 2 | New component | `AGENTS.md` > Component Architecture |
| 3 | New API route / server action | `AGENTS.md` > API Routes |
| 4 | Schema change | `AGENTS.md` > Database Schema + migration note |
| 5 | New env variable | `AGENTS.md` > Environment Variables **and** `.env.example` |
| 6 | Scope change | `HANDOFF.md` > Scope change log (prune oldest into `docs/session-archive.md` past ~5 entries) |
| 7 | End of session | `HANDOFF.md` > Quick resume + Current state snapshot (overwrite) + Session log entry. Write enough context for the next session to resume without re-reading every file: what was built, key decisions, files touched, build status, new blockers, and the next concrete task. Set `HANDOFF_SYNCED_COMMIT` to the final commit hash and commit that update (the `Stop` hook `scripts/handoff-check.sh` checks this). |
| 8 | New service / package | `AGENTS.md` identity + `.env.example` + `.mcp.json` |
| 9 | Security-relevant change | Re-run the affected section(s) of `rules/security.md` (and `rules/pre-launch-checklist.md` if pre-launch) now, not later. Fix any new FAIL immediately if low-effort; otherwise record it with severity in `HANDOFF.md` > Standing blockers (if it blocks launch) or Known failures & fixes (Hook 11, if it is a dead end you worked around). |
| 10 | Design-system change | `AGENTS.md` > Design System **and** `design-system/README.md` |
| 11 | Something failed and you fixed or abandoned it | `HANDOFF.md` > Known failures & fixes (durable; NOT pruned by age). Keep each entry to: symptom, root cause, fix / how to avoid it next time. |

`HANDOFF.md` is auto-loaded into context at the start of every session by the
`SessionStart` hook (`scripts/print-handoff.sh`). It is the live pointer to every other
doc (document map at the top of the file): `CLAUDE.md`, `AGENTS.md`, `rules/*.md`,
`design-system/README.md`, `DEPLOYMENT.md`, `SKILL.md`, `docs/session-archive.md`. Keep
that map and the cross-links accurate when adding or renaming docs.
