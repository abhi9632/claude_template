# rules/security.md — Security rules & production audit

Claude owns this; [CLIENT] is liaison, not security reviewer. Flag any gap before "done".

## Security rules — mandatory for all features

1. Global error boundary + tracker capture; custom 404; no stack traces to users.
2. Custom 404 — present, on-brand, no data fetching.
3. Safe image fallbacks — remote images via SafeImage (or framework equivalent);
   descriptive alt; lazy below fold.
4. Data fetch states — loading/error/empty on every fetch.
5. Form hardening — pending disable, input preserved on error, inline + near-button
   errors, server-side re-validation, honeypot.
6. HTTP security headers — HSTS, X-Frame-Options, X-Content-Type-Options, Referrer-Policy,
   Permissions-Policy, CSP. securityheaders.com grade B is a gate.
7. Webhook HMAC — verify before processing. (N/A if no inbound webhooks.)
8. Rate limiting — auth, forms, payments, AI, admin endpoints.
9. Open redirect guard — allowlist validation on redirect targets.
10. Auth cookies — HttpOnly + Secure + SameSite; never localStorage. If auth is
    delegated to a third party (Acuity, Auth0, Clerk, etc.), verify their cookies meet
    this bar: log into the live portal, check devtools > Application > Cookies for
    HttpOnly/Secure/SameSite flags. Record the result (PASS/FAIL + date) in the
    Production security audit's Auth & Authz row; if FAIL, raise it with the provider
    and log it in `HANDOFF.md` > Standing blockers — it is not a code fix on this side.
11. Env var security — secrets never client-prefixed/in client code; all names in
    `.env.example`; `.env*` git-ignored; no real tokens in mcp.json.
12. CORS — restrict to approved origins; no `*`.
13. Input validation — validate/sanitise all external input server-side.
14. Dependency scanning — run `npm audit` (or equivalent) before every production
    deploy and periodically during development. Any HIGH/CRITICAL advisory must be
    fixed or explicitly accepted with a written reason before promoting to production;
    record the outcome in the Production audit's Deps & AI row.
15. Production audit gate — full audit (below) + adversarial recheck before launch.
    BLOCKED until no CRITICAL/HIGH remain.

## Production security audit (run before any production deploy; recheck after fixes)

For every item mark PASS / FAIL / NOT APPLICABLE. For every FAIL: severity
(CRITICAL/HIGH/MEDIUM/LOW), file + line, vulnerability, exploit path, exact fix.

Secrets & Exposure: exposed DB creds · public .env · hardcoded keys · build logs leaking
secrets · leaked git history · secrets in frontend bundles · logs with tokens/emails/pw.
Auth & Authz: missing/weak auth · missing authz · users accessing others' data ·
unprotected admin routes · broken password reset · weak sessions · weak/reused JWT
secrets · IDOR · APIs trusting user IDs/roles · poor tenant isolation.
Database & Storage: open permissions · misconfigured Firebase/Supabase/S3 · excessive perms.
Infra & Deploy: debug pages · stack traces exposed · permissive CORS · missing rate
limits · public staging · default creds · source maps exposed · internal dashboards
reachable · missing headers · cookie flags · sensitive data unencrypted.
App Vulns: client-side-only checks · missing input validation · SQL/NoSQL injection ·
XSS (stored/reflected/DOM) · CSRF · insecure uploads · path traversal · SSRF · webhooks
without HMAC · payment checks only on frontend.
Deps & AI: vulnerable/outdated deps · prompt injection · AI tools accessing data without checks.
Ops & Governance: no audit logs · no monitoring/alerting · no backup/restore · code not reviewed.

After fixes, adversarially recheck: direct URL access to protected routes · tampered
IDs/roles/tenant/prices · backend endpoints called without the UI · frontend bundles
inspected for secrets · stale sessions/JWTs/reset links · server-side enforcement of
auth, billing, tenant isolation.

Output: 1) GO/NO-GO 2) findings table (status + severity) 3) exact fixes (file, line,
change) 4) manual verification steps for [CLIENT] 5) blockers sorted by severity.
