# rules/quality.md — Components, accessibility, performance

> Code quality standards (TypeScript strict, zod, no console.log, co-located scripts,
> framework-specific cleanup) live in AGENTS.md -> CODE QUALITY STANDARDS — not here.

## Bundle size discipline

Keep heavy client-side dependencies off the critical path:
- Import only the specific plugins/modules actually used, never the full bundle.
- Load heavy libraries via dynamic `import()` inside a co-located `<script>`,
  gated behind a viewport/intersection check; never in a script that runs on every
  page load regardless of whether the feature is used.
- Set a per-page JS (gzipped) budget and enforce it after touching animation/library
  code (`npm run build`, then check bundle sizes).

## Component authoring

1. One component per file, named after what it renders.
2. Typed `Props` interface.
3. No inline styles: scoped `<style>` or utility classes, using only design tokens.
4. Every interactive element: keyboard support + visible focus + aria-label.
5. Touch targets >=44x44px.
6. No hardcoded user-facing brand text outside config/content files; follow project content rules.
7. Animations respect `prefers-reduced-motion`.
8. Before building a new UI primitive, check `design-system/components/*.prompt.md` for an existing spec.

## Accessibility (MANDATORY)

WCAG 2.1 AA. Skip-to-main link, descriptive alt, labelled inputs, focus-visible,
4.5:1 contrast, logical heading order, ESC-closable modals/menus with focus management.

## Performance (MANDATORY targets)

Lighthouse >=90 mobile (target 100), LCP <2.5s, CLS <0.1. Framework ships minimal JS
by default; heavy libraries load lazily. Images: modern formats (WebP/AVIF), sized,
lazy below fold. Fonts: variable where possible, `font-display: swap`.

## Automated testing gate

Add to CI once the project is past early development:
- **E2E** (e.g. Playwright): key pages return 200, nav works, forms validate, no console errors.
- **Accessibility** (e.g. axe): WCAG AA on key pages.
- **Performance** (e.g. Lighthouse CI): asserts Performance targets above.
- **Broken-link check** against built output.
