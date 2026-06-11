# rules/documentation-hooks.md — Live documentation hooks

Run these after every completed feature (not just session end). Each row below is the
complete definition for that hook: self-contained, no external lookup needed. The .md
files must always reflect the current true state of the project: a stale AGENTS.md is
as dangerous as none.

| Hook | Trigger | Update |
|------|---------|--------|
| 1 | New page / route | `AGENTS.md` -> Pages & Routes |
| 2 | New component | `AGENTS.md` -> Component Architecture |
| 3 | New API route / server action | `AGENTS.md` -> API Routes |
| 4 | Schema change | `AGENTS.md` -> Database Schema + migration note |
| 5 | New env variable | `AGENTS.md` -> Environment Variables **and** `.env.example` |
| 6 | Scope change | `HANDOFF.md` -> Scope change log (prune oldest into `docs/session-archive.md` past ~5 entries) |
| 7 | End of session | `HANDOFF.md` -> Quick resume + Current state snapshot (overwrite, describe "now" only) + Session log entry of at most 5 lines. Set `HANDOFF_SYNCED_COMMIT` to the final commit hash and commit that update (the Stop hook `scripts/handoff-check.sh` checks this). The snapshot must only contain what changes session-to-session: build status, active branch, phase/milestone, active warnings. Static stack info lives in AGENTS.md only. |
| 8 | New service / package | `AGENTS.md` -> Project Identity + `.env.example` + `.mcp.json` |
| 9 | Security-relevant change | Re-run the affected section(s) of `rules/security.md` (and `rules/pre-launch-checklist.md` if pre-launch) now, not later. Fix any new FAIL immediately if low-effort; otherwise record it with severity in `HANDOFF.md` -> Infra & access blockers (if it blocks launch and needs external action) or Code failures & fixes (Hook 11, if it is a dead end you worked around in code). |
| 10 | Design-system change | `AGENTS.md` -> Design System **and** `design-system/README.md` |
| 11 | Something failed at the code/build level and you fixed or abandoned it | `HANDOFF.md` -> **Code failures & fixes** (durable; NOT pruned by age). Code/build dead ends only. Infra and access failures (hosting not connected, DSN missing, third-party account issues) go in `HANDOFF.md` -> Infra & access blockers instead. Keep each entry to 2-3 lines: symptom -> root cause -> fix / how to avoid. |

`HANDOFF.md` is auto-loaded into context at the start of every session by the
`SessionStart` hook (`scripts/print-handoff.sh`). The Document map in `HANDOFF.md`
now includes a "When to read" column for every linked doc. Keep those links accurate
when adding or renaming docs.
