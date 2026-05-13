# Changelog

All notable changes to ArkOS are documented in this file.

This project follows [Keep a Changelog 1.1](https://keepachangelog.com/en/1.1.0/) and [Semantic Versioning 2.0](https://semver.org/).

---

## [Unreleased]

### Added

- `.arkos/specs/0001-arkos-template-build.md` - canonical spec for the v0.1 build that all post-build commits reference
- `permissions: contents: read` at workflow level for least-privilege CI
- Pre-flight checks table and "Starting a new feature" workflow in `AGENTS.md` so the agent actively prompts the user through the constitution rather than relying on CI failures
- Stack-agnostic enforcement scoping in `check-banned-patterns.sh` (SOURCE_EXTENSIONS_REGEX prevents false positives in markdown / YAML)
- First-commit handling in `check-banned-patterns.sh` and `check-changelog.sh`
- PR-range commit scanning in `check-spec-link.sh` so merge commits are handled correctly
- New gate criterion CRT-004 (spec reference in PR) on the plan gate; CRT-017 (CHANGELOG updated) on the build gate
- `QUICKSTART.md` "What is not in this workflow" section making the deployment boundary explicit
- Top-of-file comment in `arkos.yml` explaining the governance-only / no-deployment posture

### Changed

- `AGENTS.md` repositioned as an active-enforcer instruction set, not a passive reference
- IDE adapters (`CLAUDE.md`, `.cursor/rules/arkos.mdc`, `.github/copilot-instructions.md`) reinforce the active-enforcer framing
- `check-changelog.sh` moved from `ship-gate` to `build-gate` so PRs enforce CHANGELOG updates pre-merge instead of post-merge
- Banned-pattern checks on `console.log` and `: any` scoped to `.js/.jsx/.ts/.tsx/.mjs/.cjs` source files only
- SAST and dependency scan workflow steps converted to commented placeholders (CodeQL requires an init step; users now have explicit guidance)
- `proof-sheet.md` evidence column annotated "after wiring" for placeholder CI steps
- `.arkos/arkos.yml` `created` field is now a `<YYYY-MM-DD>` placeholder rather than the hard-coded build date
- `CHANGELOG.md` 0.1.0 link converted to `<your-org>/<your-repo>` placeholder
- PR template banned-pattern checklist item now references `AGENTS.md` instead of hardcoding JS-specific patterns
- `QUICKSTART.md` first-commit budget reconciled from 15 minutes to 30 to 60 minutes; full CI wiring stated as "an afternoon"
- `QUICKSTART.md` first-commit flow switched from `push origin main` to feature branch + pull request, consistent with branch-protected repositories
- Em dashes removed from all files except `docs/framework.md` (preserved verbatim per REQ-049)

### Fixed

- YAML parse failure in `arkos.yml` workflow caused by inline comments between step keys and by unquoted colons in placeholder echo strings
- `check-banned-patterns.sh` silently passing in CI because it scanned the (always-empty) staging area instead of the diff
- `check-changelog.sh` crashing on the first commit of a fresh repository (no `HEAD~1`)
- `check-spec-link.sh` missing merge commits where the spec reference appears in an earlier commit on the branch
- `proof-sheet.md` referencing a non-existent `.arkos/proof-essential-eight.md` file

### Added

- `AGENTS.md` - portable agent instruction file, single source of truth for all agentic IDEs
- `CLAUDE.md` - Claude Code adapter with @import pointer to AGENTS.md
- `.cursor/rules/arkos.mdc` - Cursor adapter pointing to AGENTS.md
- `.github/copilot-instructions.md` - GitHub Copilot adapter pointing to AGENTS.md
- `.arkos/constitution.md` - project constitution with five non-negotiable principles
- `.arkos/arkos.yml` - framework configuration file
- `.arkos/specs/_template.md` - EARS-based spec template
- `.arkos/adr/_template.md` - Nygard ADR template
- `.arkos/adr/0001-agents-md-as-portable-instruction-standard.md` - ADR: AGENTS.md as the portable standard
- `.arkos/adr/0002-ears-as-requirements-notation.md` - ADR: EARS as requirements notation
- `.arkos/adr/0003-apache-2-licence.md` - ADR: Apache 2.0 licensing
- `.arkos/threat-models/_template.md` - STRIDE-lite threat model template
- `.arkos/runbooks/_template.md` - operational runbook template
- `.arkos/gates/research.yml` - Research gate criteria
- `.arkos/gates/plan.yml` - Plan gate criteria
- `.arkos/gates/build.yml` - Build gate criteria
- `.arkos/gates/ship.yml` - Ship gate criteria
- `.arkos/gates/run.yml` - Run gate criteria
- `.arkos/scripts/check-spec-link.sh` - CI script: spec reference check
- `.arkos/scripts/check-changelog.sh` - CI script: CHANGELOG update check
- `.arkos/scripts/check-banned-patterns.sh` - CI script: banned pattern check
- `.arkos/proof-sheet.md` - procurement evidence template
- `.github/workflows/arkos.yml` - CI workflow enforcing all governance gates
- `.github/ISSUE_TEMPLATE/feature.md` - feature issue template
- `.github/ISSUE_TEMPLATE/bug.md` - bug report template
- `.github/pull_request_template.md` - PR checklist template
- `docs/framework.md` - ArkOS v0.1 framework document
- `docs/standards.md` - standards reference with versions and rationale
- `docs/adr/` - framework-level ADRs mirrored for documentation
- `README.md` - repository overview and quickstart
- `QUICKSTART.md` - standalone onboarding guide
- `CONTRIBUTING.md` - contribution guidelines
- `SECURITY.md` - coordinated disclosure policy
- `LICENSE` - Apache 2.0

---

[0.1.0]: https://github.com/<your-org>/<your-repo>/releases/tag/v0.1.0
