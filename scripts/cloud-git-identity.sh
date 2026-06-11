#!/usr/bin/env bash
# Runs on every session start/resume (wired via .claude/settings.json SessionStart
# hook). Re-applies the commit identity so it survives container rebuilds: the
# environment setup script only runs once and its config is lost when the cloud
# container is reclaimed. See DEPLOYMENT.md.
set -euo pipefail

git config --global user.name "[YOUR_GITHUB_USERNAME]"
git config --global user.email "[YOUR_EMAIL]"

# In the cloud the platform defaults to signing commits with Anthropic's key
# (which forces the committer identity). Turn signing off so commits go out under
# your identity above. Local machines keep their own signing settings untouched.
if [ "${CLAUDE_CODE_REMOTE:-}" = "true" ]; then
  git config --global commit.gpgsign false
fi

exit 0
