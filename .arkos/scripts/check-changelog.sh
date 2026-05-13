#!/bin/bash
# Verifies that CHANGELOG.md was updated in the current PR or push.
#
# Behaviour:
#   In CI (pull request): checks CHANGELOG.md was modified vs the base branch.
#   In CI (push to branch): checks CHANGELOG.md was modified vs the previous commit.
#   In CI (first commit, no HEAD~1): requires CHANGELOG.md to exist and be non-empty.
#   Locally: checks whether CHANGELOG.md is staged.

set -euo pipefail

FOUND=false

if [[ -n "${CI:-}" ]]; then
  if [[ -n "${GITHUB_BASE_REF:-}" ]]; then
    # Pull request: diff against the base branch.
    git fetch origin "${GITHUB_BASE_REF}" --quiet 2>/dev/null || true
    if git diff --name-only "origin/${GITHUB_BASE_REF}...HEAD" 2>/dev/null | grep -q "^CHANGELOG\.md$"; then
      FOUND=true
    fi
  elif git rev-parse HEAD~1 >/dev/null 2>&1; then
    # Push to a branch: diff against the previous commit.
    if git diff --name-only HEAD~1 HEAD 2>/dev/null | grep -q "^CHANGELOG\.md$"; then
      FOUND=true
    fi
  else
    # First commit: CHANGELOG.md must exist and be non-empty.
    if [[ -s "CHANGELOG.md" ]]; then
      FOUND=true
    fi
  fi
else
  # Local: check staged files.
  if git diff --cached --name-only 2>/dev/null | grep -q "^CHANGELOG\.md$"; then
    FOUND=true
  fi
fi

if [[ "$FOUND" == "false" ]]; then
  echo "ERROR: CHANGELOG.md was not updated."
  echo "Every release commit must include a new entry in CHANGELOG.md."
  echo "Add an [Unreleased] or versioned entry following Keep a Changelog conventions."
  exit 1
fi

echo "OK: CHANGELOG.md was updated."
exit 0
