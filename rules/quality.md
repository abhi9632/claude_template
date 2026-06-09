# rules/quality.md — Code quality, components, accessibility, performance

## Code quality
- TypeScript strict where applicable; no `any` — narrow `unknown`.
- Validate all external data (forms, env at the edge).
- No `console.log` in production — use the error tracker.
- CSP-safe scripts; no inline event handlers. Tear down listeners/timers on navigation.

## Component authoring
> **RULE 0 (blocking):** invoke `frontend-design` BEFORE any front-end/UI code
> (`rules/frontend-design.md`). No improvised UI.

1. One component per file, named after what it renders. 2. Typed `Props` interface.
3. No inline styles — scoped styles or utility classes. 4. Every interactive element:
keyboard support + visible focus + aria-label. 5. Touch targets ≥ 44×44px.
6. No hardcoded brand text where avoidable. 7. Respect `prefers-reduced-motion`.

## Accessibility (MANDATORY)
WCAG 2.1 AA. Skip-to-main link, descriptive alt, labelled inputs, focus-visible, 4.5:1
contrast, logical heading order, ESC-closable menus with focus management.

## Performance (MANDATORY targets)
Lighthouse ≥ 90 mobile (target 100), LCP < 2.5s, CLS < 0.1. Ship minimal JS; load heavy
libs lazily; images WebP/AVIF, sized, lazy below fold; fonts variable + `font-display: swap`.
