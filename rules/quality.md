# rules/quality.md — Code quality, components, accessibility, performance, bundle size

## Code quality
- TypeScript strict mode (`noUncheckedIndexedAccess` on). No `any`: narrow `unknown`.
  No exceptions; if a third-party type genuinely can't be satisfied, isolate it behind
  a typed wrapper with a one-line comment explaining why.
- Validate all external data (forms, env at the edge).
- No `console.log` in production — use the error tracker.
- CSP-safe scripts; no inline event handlers. Tear down listeners/timers on navigation.

## Bundle size discipline
Any animation/scroll/video library (GSAP, Lottie, video players, etc.) must stay off
the critical path: import only the plugins/modules actually used (no full-bundle
default imports), and load them via dynamic `import()` gated behind a viewport or
intersection check, never unconditionally on every page. Per-page JS budget (gzipped)
should stay under ~75KB outside of explicitly heavy, isolated features (embeds,
scroll-video, etc.). After touching such code, check the build output sizes and flag
any new chunk that pushes a page over budget in `HANDOFF.md` > Standing blockers.

## Component authoring
> **RULE 0 (blocking):** invoke `frontend-design` AND `design-taste-frontend` BEFORE
> any front-end/UI code (`rules/frontend-design.md`). No improvised UI: if a design
> system is adopted, follow `design-system/`.

1. One component per file, named after what it renders. 2. Typed `Props` interface.
3. No inline styles — scoped styles or utility classes, using only the project's design
tokens. 4. Every interactive element: keyboard support + visible focus + aria-label.
5. Touch targets >= 44x44px. 6. No hardcoded brand text where avoidable; follow the
content rules in `design-system/README.md` if adopted. 7. Respect
`prefers-reduced-motion`. 8. Before building a new UI primitive (card, tag, badge,
pricing tier, etc.), check `design-system/components/*.prompt.md` for an existing spec
and follow it. If no spec exists yet, design it using `design-taste-frontend`'s
discipline, build it, then write a new spec file and add it to
`design-system/components/` (Hook 2 + Hook 10).

## Accessibility (MANDATORY)
WCAG 2.1 AA. Skip-to-main link, descriptive alt, labelled inputs, focus-visible, 4.5:1
contrast, logical heading order, ESC-closable menus with focus management.

## Performance (MANDATORY targets)
Lighthouse >= 90 mobile (target 100), LCP < 2.5s, CLS < 0.1. Ship minimal JS; load heavy
libs lazily; images WebP/AVIF, sized, lazy below fold; fonts variable + `font-display: swap`.
