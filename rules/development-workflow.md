# rules/development-workflow.md — How to build a feature

## Feature build order

0. If it has any UI → **invoke `frontend-design` before writing markup/styles (Rule 0,
   see `rules/frontend-design.md`)**.
1. Define types and interfaces.
2. Write the validation schema for all inputs.
3. Data layer — scope every query to the session user ID (never a URL param). (N/A if no DB.)
4. Server layer — auth/validation check as the first line; re-validate input server-side.
5. Build the UI with all states: loading, error, empty, success — **after Rule 0**.
6. Tick off the relevant items in `rules/security.md`.
7. Manually test the happy path and at least one error path.
8. Run the applicable `rules/documentation-hooks.md` before the next feature.

## Before writing any component, confirm

- Front-end/visual? → **Rule 0 first.**  New route? → run Hook 1 after.
- Fetches data? → loading/error/empty states (`rules/data-and-forms.md`).
- Has a form? → see `rules/data-and-forms.md`.
- Renders images? → SafeImage/fallback.  Webhooks/payments? → HMAC server-side.
- User-scoped data? → session ID only.  Missing a capability? → `find-skills`.

## Week One — foundations (must exist before feature work)

1. **Global error boundary** — friendly fallback + Try Again, sends full error to the
   tracker. (Static sites: client error capture + custom 404 = the boundary.)
2. **Custom 404** — friendly, on-brand, button home, no data fetching.
3. **Safe Image component** — placeholder on failure, descriptive alt; audit raw `<img>`.
4. **Error tracking** — client + server capture, env tag, release = git SHA, source maps
   private. Verify: throw on a temp route → confirm in dashboard → delete → commit.
5. **Skeleton components** — text/card/table/avatar; every loading state uses one.
