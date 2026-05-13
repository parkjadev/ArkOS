#!/bin/bash
# Verifies that CHANGELOG.md was modified in the most recent commit.
set -euo pipefail

if ! git diff --name-only HEAD~1 2>/dev/null | grep -q "^CHANGELOG\.md$"; then
  echo "ERROR: CHANGELOG.md was not updated."
  echo "Every release commit must include an entry in CHANGELOG.md."
  echo "Add a [Unreleased] or versioned entry following Keep a Changelog conventions."
  exit 1
fi

echo "OK: CHANGELOG.md was updated."
exit 0
