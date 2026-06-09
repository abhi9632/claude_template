# rules/data-and-forms.md — Data fetching & forms

## Data fetching — every fetch handles all three states

- **Loading** — a skeleton matching the content shape (never blank / bare spinner).
- **Error** — a clear message + Retry; never swallow silently.
- **Empty** — a friendly message + helpful call to action.

Returning `null` on loading is unacceptable. A silent `catch` with only `console.log` is
a production bug — capture to the error tracker.

## Forms — every form must

- Disable the submit button and show a loading state while pending.
- **Preserve all user-entered values on error** — never reset the form.
- Show a clear error message near the submit button on failure.
- Show inline validation errors next to each field.
- Re-validate all inputs **server-side** regardless of client validation, with a honeypot.

> Any new form is a security-relevant change → also re-check `rules/security.md`
> (rate limiting, input validation, CORS) and run the documentation hooks.
