# Changelog

All notable changes to ArkOS are documented in this file.

This project follows [Keep a Changelog 1.1](https://keepachangelog.com/en/1.1.0/) and [Semantic Versioning 2.0](https://semver.org/).

---

## [0.1.0] - 2026-05-13

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
