# rules/pre-launch-checklist.md — Pre-launch checklist

Every box ticked before any deployment. (Security deep-dive: `rules/security.md`.
Deploy mechanics: `DEPLOYMENT.md`.)

## Foundations
- [ ] Error boundary working — fallback UI, not a blank page
- [ ] 404 page working — unknown routes land here
- [ ] SafeImage used everywhere — no raw `<img>` tags remain
- [ ] Error tracking verified — test error seen in dashboard, test route deleted
- [ ] Skeleton components built and used for every loading state

## Data & Forms
- [ ] Every fetch has loading, error, and empty states
- [ ] Every form: pending-disable, error preservation, inline validation, server-side re-validation
- [ ] All user-scoped queries use session ID

## Security
- [ ] HTTP security headers in place (securityheaders.com — grade B minimum)
- [ ] Auth cookies HttpOnly + Secure + SameSite
- [ ] All webhooks verify HMAC signature
- [ ] Rate limiting on all sensitive endpoints
- [ ] No secrets in client bundles · CORS restricted · open-redirect guard · CSP tested
- [ ] `.env.example` current · mcp.json uses env-var references (no hardcoded tokens)

## Environment
- [ ] All env vars set in the hosting dashboard (per environment)
- [ ] Error tracker environment set to production · source maps uploaded privately
- [ ] Debug pages and test routes removed · staging not publicly accessible

## Documentation (run all hooks first — `rules/documentation-hooks.md`)
- [ ] AGENTS.md Pages & Routes / Component Architecture / API Routes / DB Schema current
- [ ] AGENTS.md Environment Variables matches `.env.example`
- [ ] mcp.json includes all services added during development
