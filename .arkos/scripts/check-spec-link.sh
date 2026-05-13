#!/bin/bash
# Verifies that a SPEC-[0-9]+ reference exists in the PR title, PR body, or most recent commit message.
set -euo pipefail

SPEC_PATTERN="SPEC-[0-9]+"
FOUND=false

# Check PR title (set via PR_TITLE env var in CI)
if [[ -n "${PR_TITLE:-}" ]] && echo "$PR_TITLE" | grep -qE "$SPEC_PATTERN"; then
  FOUND=true
fi

# Check PR body (set via PR_BODY env var in CI)
if [[ -n "${PR_BODY:-}" ]] && echo "$PR_BODY" | grep -qE "$SPEC_PATTERN"; then
  FOUND=true
fi

# Check most recent commit message
COMMIT_MSG=$(git log -1 --pretty=%B)
if echo "$COMMIT_MSG" | grep -qE "$SPEC_PATTERN"; then
  FOUND=true
fi

if [[ "$FOUND" == "false" ]]; then
  echo "ERROR: No spec reference found."
  echo "Every PR and commit must reference a spec using the pattern SPEC-[0-9]+"
  echo "Add a reference to the PR title, PR body, or commit message."
  echo "Example: 'feat: add login flow (SPEC-0001)'"
  exit 1
fi

echo "OK: Spec reference found."
exit 0
