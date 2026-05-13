#!/bin/bash
# Checks staged files for banned patterns: console.log, `: any`, and bare TODO (without issue reference).
set -euo pipefail

FAILED=false

# Get list of staged files (text files only)
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

  # Check for console.log
  if grep -n "console\.log" "$file" 2>/dev/null; then
    echo "ERROR: console.log found in $file (line above)"
    FAILED=true
  fi

  # Check for TypeScript `: any`
  if grep -n ": any" "$file" 2>/dev/null; then
    echo "ERROR: ': any' type found in $file (line above). Use 'unknown' and narrow."
    FAILED=true
  fi

  # Check for bare TODO without an issue reference (allow TODO(#123) format)
  if grep -nP "TODO(?!\(#[0-9]+\))" "$file" 2>/dev/null; then
    echo "ERROR: Bare TODO found in $file (line above). Use TODO(#<issue-number>) format."
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
