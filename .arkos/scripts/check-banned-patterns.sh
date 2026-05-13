#!/bin/bash
# Checks staged files for banned patterns.
#
# The TODO check is universal. The two stack-specific checks below are
# examples for JavaScript/TypeScript projects. Replace or remove them for
# your stack before your first commit.
#
# To add a pattern:
#   grep -n "your-pattern" "$file" && echo "ERROR: description" && FAILED=true
set -euo pipefail

FAILED=false

# Get list of staged files
STAGED_FILES=$(git diff --cached --name-only --diff-filter=ACM 2>/dev/null || true)

if [[ -z "$STAGED_FILES" ]]; then
  echo "OK: No staged files to check."
  exit 0
fi

while IFS= read -r file; do
  # Skip binary files
  if ! file "$file" 2>/dev/null | grep -q "text"; then
    continue
  fi

  # Universal: bare TODO without an issue reference.
  # Allow TODO(#123) format only.
  if grep -nP "TODO(?!\(#[0-9]+\))" "$file" 2>/dev/null; then
    echo "ERROR: Bare TODO found in $file (see line above). Use TODO(#<issue-number>) format."
    FAILED=true
  fi

  # Stack-specific example: unstructured debug output (JavaScript/TypeScript).
  # Replace with the equivalent for your stack, or remove if not applicable.
  # Python example: grep -n "^print(" "$file"
  if grep -n "console\.log" "$file" 2>/dev/null; then
    echo "ERROR: console.log found in $file (see line above). Use the project logger."
    FAILED=true
  fi

  # Stack-specific example: untyped escape hatch (TypeScript).
  # Replace with the equivalent for your stack, or remove if not applicable.
  # Python example: grep -n ": Any" "$file" (from typing import Any)
  if grep -n ": any" "$file" 2>/dev/null; then
    echo "ERROR: ': any' type annotation found in $file (see line above). Use a typed alternative."
    FAILED=true
  fi

done <<< "$STAGED_FILES"

if [[ "$FAILED" == "true" ]]; then
  echo ""
  echo "Fix the banned patterns above before committing."
  exit 1
fi

echo "OK: No banned patterns found."
exit 0
