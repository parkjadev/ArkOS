#!/bin/bash
# Checks committed/staged files for banned patterns.
#
# Behaviour:
#   In CI (pull request): checks all files changed vs the base branch.
#   In CI (push to branch): checks all files changed vs the previous commit.
#   Locally: checks staged files only (pre-commit use).
#
# The bare-TODO check is universal. The console.log and ': any' checks are
# examples for JavaScript/TypeScript projects. Replace or remove them for
# your stack before your first commit.
#
# To add a stack-specific pattern, copy the block format below:
#
#   if grep -rn "your-pattern" "$file" 2>/dev/null; then
#     echo "ERROR: description — $file"
#     FAILED=true
#   fi

set -euo pipefail

FAILED=false

# Resolve the list of files to check depending on context.
if [[ -n "${CI:-}" ]]; then
  if [[ -n "${GITHUB_BASE_REF:-}" ]]; then
    # Pull request: diff against the base branch.
    git fetch origin "${GITHUB_BASE_REF}" --quiet 2>/dev/null || true
    CHANGED_FILES=$(git diff --name-only --diff-filter=ACM "origin/${GITHUB_BASE_REF}...HEAD" 2>/dev/null || true)
  else
    # Push to branch: diff against the previous commit.
    # Guard against the first commit in a repo (no HEAD~1).
    if git rev-parse HEAD~1 >/dev/null 2>&1; then
      CHANGED_FILES=$(git diff --name-only --diff-filter=ACM HEAD~1 HEAD 2>/dev/null || true)
    else
      CHANGED_FILES=$(git diff --name-only --diff-filter=ACM HEAD 2>/dev/null || true)
    fi
  fi
else
  # Local: check staged files only.
  CHANGED_FILES=$(git diff --cached --name-only --diff-filter=ACM 2>/dev/null || true)
fi

if [[ -z "$CHANGED_FILES" ]]; then
  echo "OK: No files to check."
  exit 0
fi

while IFS= read -r file; do
  [[ -f "$file" ]] || continue

  # Skip binary files.
  if ! file "$file" 2>/dev/null | grep -q "text"; then
    continue
  fi

  # Universal: bare TODO without an issue reference.
  # Allowed format: TODO(#123): description
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
  # Python example: grep -n ": Any" "$file"
  if grep -n ": any" "$file" 2>/dev/null; then
    echo "ERROR: ': any' type annotation found in $file (see line above). Use a typed alternative."
    FAILED=true
  fi

done <<< "$CHANGED_FILES"

if [[ "$FAILED" == "true" ]]; then
  echo ""
  echo "Fix the banned patterns above before committing."
  exit 1
fi

echo "OK: No banned patterns found."
exit 0
