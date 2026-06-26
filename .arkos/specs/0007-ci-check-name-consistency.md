---
id: SPEC-0007
slug: ci-check-name-consistency
title: Align CI job names with documented branch-protection contexts
status: Approved
owner: "@ark360-hq"
created: 2026-06-26
touches-personal-data: false
trust-boundaries-crossed: false
linked-adrs: []
linked-threat-model: null
---

# SPEC-0007: Align CI job names with documented branch-protection contexts

## Problem

`QUICKSTART.md` instructs adopters to enable branch protection on `main` by requiring the
status checks `plan-gate` and `build-gate`, and the same short identifiers are used to refer
to the gates throughout `README.md`, `AGENTS.md`, the workflow's own header comments, and
`SPEC-0001`'s acceptance criteria. However, `.github/workflows/arkos.yml` overrides each
job's `name:` with a long descriptive string (for example `Plan gate - spec reference
check`). GitHub matches required status checks on the check-run name, which equals the job's
`name:` when set. As a result, a contributor who follows the documentation and requires
`plan-gate` / `build-gate` gets required checks that never match the running checks: they sit
permanently as "Expected" and no pull request can merge. The documented identifiers and the
actual check-run names must agree.

## Out of scope

1. Changing what any gate verifies. The gate scripts and per-step commands are untouched.
2. The per-step `name:` fields inside jobs (for example "Lint", "Check spec reference").
   Only the four job-level names change.
3. Adding, removing, or reordering CI gates.
4. Enabling branch protection itself, which is an operational repository setting rather than
   a source change.

## Requirements

### Ubiquitous (always true, no trigger)

> REQ-001: The four CI gate jobs shall produce check-run names equal to their job
> identifiers (`plan-gate`, `build-gate`, `ship-gate`, `run-readiness`), matching the
> required-status-check contexts documented in `QUICKSTART.md` and `README.md`.

### Unwanted behaviour (what must not happen)

> REQ-002: IF a contributor configures branch protection with the documented `plan-gate` and
> `build-gate` contexts THEN the required checks shall NOT remain in a permanently unmatched
> "Expected" state.

## Acceptance criteria

| Req | Test | Type |
|---|---|---|
| REQ-001 | `gh pr checks` on this PR shows the check names `plan-gate` and `build-gate` (not the long descriptive strings); `git grep -nE "^\s{4}name:" .github/workflows/arkos.yml` returns no job-level name override for the four gates | manual |
| REQ-002 | Branch protection requiring contexts `plan-gate` and `build-gate` binds to the running checks once enabled | manual |

## Accessibility notes

| Criterion | WCAG reference | How addressed |
|---|---|---|
| CI configuration change | N/A | No user interface component; CI workflow metadata only. |
