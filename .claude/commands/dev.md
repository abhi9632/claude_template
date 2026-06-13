# /dev — Start a coding session

Load project context and orient for development work.

## Steps

1. Read `HANDOFF.md` in full — understand current state, last completed work, next task, blockers, and any known failures.
2. Read `CLAUDE.md` — confirm non-negotiables, git workflow, and rules index.
3. Confirm orientation by stating in one short paragraph:
   - Active branch
   - Last completed task
   - What you are about to work on next
   - Any active blockers
4. State which rules files apply to the upcoming work based on the RULES INDEX in CLAUDE.md. For example:
   - UI/front-end work? → "Rule 0 applies: I will invoke frontend-design + design-taste-frontend before writing any markup or styles."
   - Security-relevant change? → "I will read rules/security.md before touching this."
   - New component? → "I will read rules/quality.md for a11y and bundle standards."
   - If the task is not yet known, state: "I will confirm which rules apply once [CLIENT] describes the task."
5. Wait for [CLIENT]'s instruction before writing any code.

> Do NOT pre-load any rules files at this step — just name them.
> Rules load on demand mid-task per the RULES INDEX. Naming them here creates a
> verbal commitment that cannot be skipped later.
> Do NOT summarise the entire project history — one short orientation paragraph only.
