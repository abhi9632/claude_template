# [PROJECT NAME] Design System (reference copy)

Status: [NOT ADOPTED / ADOPTED, DATE]. This file is the durable, in-repo reference for
this project's design system: palette, typography, spacing, motion, content rules and
component specs. Once a design system is adopted (e.g. from a design handoff bundle,
or defined from scratch with `frontend-design` + `design-taste-frontend`, see
`rules/frontend-design.md`), record it here so any future session or agent can see the
full system without needing external files.

**Rule: every colour, font, radius, shadow, spacing and motion value used anywhere in
this codebase MUST trace back to [the project's canonical token file or config, e.g.
`src/styles/global.css`, `tailwind.config.ts`].** This folder documents the design
intent behind those tokens; `tokens/` (if present) holds reference copies of original
values, kept for context, not imported directly.

Until a design system is adopted, this file stays as a placeholder. `frontend-design`
and `design-taste-frontend` are still mandatory before any front-end code (Rule 0);
they help establish this system rather than follow an existing one.

---

## The brand in one breath

[PROJECT-SPECIFIC: one short paragraph describing what the product/brand is and the
feeling it should evoke. If there are multiple distinct sub-brands, products, or
"worlds" within the project, describe each:]

| World / area | Feeling | Palette | Voice |
|---------------|---------|---------|-------|
| [PROJECT-SPECIFIC] | [PROJECT-SPECIFIC] | [PROJECT-SPECIFIC] | [PROJECT-SPECIFIC] |

Audience: [PROJECT-SPECIFIC, who this is for and what they expect].

---

## Content rules (apply everywhere: copy, UI, docs, commit messages)

- **Tone:** [PROJECT-SPECIFIC, e.g. professional, playful, technical, calm].
- **Person:** [PROJECT-SPECIFIC, how the product/brand refers to itself and the
  reader].
- **Casing:** [PROJECT-SPECIFIC, sentence case vs Title Case for headlines, buttons,
  nav, eyebrows].
- **Sentence shape:** [PROJECT-SPECIFIC, short and declarative vs long-form, any
  recurring patterns].
- **Avoid:** [PROJECT-SPECIFIC, words, tones or punctuation to avoid].
- **Glyphs:** [PROJECT-SPECIFIC, any house style for bullets, links, separators, em
  dash policy, emoji policy].
- **Locale:** [PROJECT-SPECIFIC, language/region, currency, spelling conventions].

---

## Visual foundations (see [canonical token file] for exact values)

- **Colour:** [PROJECT-SPECIFIC, primary/secondary/accent roles, neutrals, and when
  each is used].
- **Type:** [PROJECT-SPECIFIC, font roles such as display/heading/body, how they're
  loaded (self-hosted vs CDN), and any CSP implications].
- **Spacing & layout:** [PROJECT-SPECIFIC, base spacing scale, container widths,
  vertical rhythm].
- **Radius:** [PROJECT-SPECIFIC, radius scale and where each size is used].
- **Shadows:** [PROJECT-SPECIFIC, shadow scale, tint, elevation levels].
- **Motion:** [PROJECT-SPECIFIC, easing curves, durations, reduced-motion handling].
- **Hover/press:** [PROJECT-SPECIFIC, interaction feedback conventions].

---

## Iconography

[PROJECT-SPECIFIC, icon set used (e.g. Lucide, Heroicons), stroke width and sizing
conventions, and any brand motif/mark, including where its source asset lives.]

---

## Typography decision log

[PROJECT-SPECIFIC, record any font choices or substitutions made during the project
and when/why they were resolved, so future sessions don't re-litigate it. Delete this
section if not needed.]

---

## Token mapping: design-system names -> canonical token file

[PROJECT-SPECIFIC, if a design-system bundle or `tokens/` reference uses different
names than the project's canonical token file (for example bare `--accent` vs
`--color-accent`), document the mapping/prefixing convention here so anyone porting a
snippet from `components/*.prompt.md` or `tokens/` uses the correct name. Delete this
section if there is only one set of token names.]

---

## Components (specs in `components/*.prompt.md`)

Reference specs for this project's component library. One `.prompt.md` file per
component: a short description of when to use it and which variants exist, an example
usage snippet, and a `Props` summary. Build components to spec, one component per
file, typed `Props`, scoped styles, tokens only. See
`design-system/components/_TEMPLATE.prompt.md` for the format.

| Component | Spec | Status |
|-----------|------|--------|
| [PROJECT-SPECIFIC] | `components/[Name].prompt.md` | TODO |

Hook 2 (new component) and Hook 10 (design-system change) keep this table and
`AGENTS.md` > Component Architecture in sync.

---

## Assets

[PROJECT-SPECIFIC, logo/mark files and where they live, favicon status, and any other
brand assets and their source.]
