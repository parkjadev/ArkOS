#!/bin/bash
# Checks committed/staged files for banned patterns.
#
# Behaviour:
#   In CI (pull request): checks files changed vs the base branch.
#   In CI (push to branch): checks files changed vs the previous commit.
#   In CI (first commit, no HEAD~1): checks every tracked file.
#   Locally: checks staged files only (pre-commit use).
#
# The bare-TODO check runs on non-markdown source and config files.
# Markdown files (.md) are excluded because documentation legitimately
# describes the TODO pattern without meaning to introduce it as a marker.
# The console.log and ': any' checks are JavaScript/TypeScript examples and
# only run on source files matching SOURCE_EXTENSIONS_REGEX below. This avoids
# false positives in markdown and YAML (e.g. prose containing "to: any user").
# Replace or remove these checks for your stack before your first commit.
#
# To add a stack-specific pattern, copy a block inside the SOURCE_EXTENSIONS
# guard below.

set -euo pipefail

# Source file extensions for the stack-specific checks. Edit for your stack.
SOURCE_EXTENSIONS_REGEX='\.(js|jsx|ts|tsx|mjs|cjs)$'

FAILED=false

# Resolve the list of files to check depending on context.
if [[ -n "${CI:-}" ]]; then
  if [[ -n "${GITHUB_BASE_REF:-}" ]]; then
    # Pull request: diff against the base branch.
    git fetch origin "${GITHUB_BASE_REF}" --quiet 2>/dev/null || true
    CHANGED_FILES=$(git diff --name-only --diff-filter=ACM "origin/${GITHUB_BASE_REF}...HEAD" 2>/dev/null || true)
  else
    # Push to branch: diff against the previous commit.
    if git rev-parse HEAD~1 >/dev/null 2>&1; then
      CHANGED_FILES=$(git diff --name-only --diff-filter=ACM HEAD~1 HEAD 2>/dev/null || true)
    else
      # First commit in the repo: check every tracked file.
      CHANGED_FILES=$(git ls-tree -r HEAD --name-only 2>/dev/null || true)
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

  # Universal check: bare TODO without an issue reference.
  # Allowed format: TODO(#123): description
  # Skipped for markdown files where "TODO" appears legitimately in documentation.
  if ! echo "$file" | grep -qE '\.md$'; then
    if grep -nP "TODO(?!\(#[0-9]+\))" "$file" >/dev/null 2>&1; then
      grep -nP "TODO(?!\(#[0-9]+\))" "$file"
      echo "ERROR: Bare TODO in $file. Use TODO(#<issue-number>) format."
      FAILED=true
    fi
  fi

  # Stack-specific checks: only run on source files matching SOURCE_EXTENSIONS_REGEX.
  if echo "$file" | grep -qE "$SOURCE_EXTENSIONS_REGEX"; then

    # Example pattern: unstructured debug output (JavaScript/TypeScript).
    # Replace with your stack's equivalent, or remove if not applicable.
    if grep -n "console\.log" "$file" >/dev/null 2>&1; then
      grep -n "console\.log" "$file"
      echo "ERROR: console.log in $file. Use the project logger."
      FAILED=true
    fi

    # Example pattern: untyped escape hatch (TypeScript).
    # Replace with your stack's equivalent, or remove if not applicable.
    if grep -nE "(^|[^a-zA-Z_]): any($|[^a-zA-Z_])" "$file" >/dev/null 2>&1; then
      grep -nE "(^|[^a-zA-Z_]): any($|[^a-zA-Z_])" "$file"
      echo "ERROR: ': any' type annotation in $file. Use a typed alternative."
      FAILED=true
    fi

  fi

done <<< "$CHANGED_FILES"

if [[ "$FAILED" == "true" ]]; then
  echo ""
  echo "Fix the banned patterns above before committing."
  exit 1
fi

echo "OK: No banned patterns found."
exit 0
