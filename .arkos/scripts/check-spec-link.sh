#!/bin/bash
# Verifies that a SPEC-[0-9]+ reference exists in the PR title, PR body, or
# any commit message included in this PR / push.
#
# Behaviour:
#   In CI (pull request): scans PR_TITLE, PR_BODY, and every commit message in
#                         the PR (origin/GITHUB_BASE_REF..HEAD).
#   In CI (push to main): scans every commit message new on this push
#                         (HEAD~1..HEAD), falling back to HEAD if HEAD~1 missing.
#   Locally: scans the most recent commit message only.

set -euo pipefail

SPEC_PATTERN="SPEC-[0-9]+"
FOUND=false

# PR title / body (set as env vars by the workflow on pull_request events).
if [[ -n "${PR_TITLE:-}" ]] && echo "$PR_TITLE" | grep -qE "$SPEC_PATTERN"; then
  FOUND=true
fi
if [[ -n "${PR_BODY:-}" ]] && echo "$PR_BODY" | grep -qE "$SPEC_PATTERN"; then
  FOUND=true
fi

# Commit messages in scope.
if [[ "$FOUND" == "false" ]]; then
  if [[ -n "${GITHUB_BASE_REF:-}" ]]; then
    # Pull request: every commit message in the PR.
    git fetch origin "${GITHUB_BASE_REF}" --quiet 2>/dev/null || true
    COMMIT_RANGE="origin/${GITHUB_BASE_REF}..HEAD"
  elif git rev-parse HEAD~1 >/dev/null 2>&1; then
    # Push to a branch: every commit message new in this push.
    COMMIT_RANGE="HEAD~1..HEAD"
  else
    # First commit: just check HEAD.
    COMMIT_RANGE="HEAD"
  fi

  if git log "$COMMIT_RANGE" --pretty=%B 2>/dev/null | grep -qE "$SPEC_PATTERN"; then
    FOUND=true
  fi
fi

if [[ "$FOUND" == "false" ]]; then
  echo "ERROR: No spec reference found."
  echo "Every PR and commit must reference a spec using the pattern SPEC-[0-9]+"
  echo "Add a reference to the PR title, PR body, or a commit message."
  echo "Example: 'feat: add login flow (SPEC-0001)'"
  exit 1
fi

echo "OK: Spec reference found."
exit 0
