# Contributing to ArkOS

ArkOS welcomes contributions from the community. This document explains how to contribute to the framework itself.

If you are using ArkOS in your own project, this file is for you only if you want to propose changes to the framework.

---

## How to propose changes to the framework

All framework changes start with a spec or ADR, not a pull request.

**For minor corrections** (typos, clarifications, broken links):
Open a GitHub issue describing the problem. A spec is not required for corrections.

**For changes to framework behaviour** (new gates, modified templates, new conventions):
1. Open a GitHub issue describing the problem the change solves.
2. Write a spec in `.arkos/specs/` describing the proposed change using EARS notation. Reference the issue.
3. If the change affects an architectural decision (which standard to bind to, which file format to use), file an ADR in `.arkos/adr/`.
4. Open a pull request referencing the spec.

The spec must reach `status: Approved` before the pull request can merge.

---

## The spec-before-PR rule

No pull request may introduce a behaviour change without an approved spec. This applies to all contributors, including maintainers.

The build gate CI check enforces this: every PR must reference a `SPEC-[0-9]+` in the title or body.

---

## ADR requirements for structural changes

A structural change is any change that:

- Adds, removes, or renames a mandatory file in the ArkOS file tree
- Changes which standards ArkOS binds to
- Changes the gate schema in `.arkos/gates/`
- Changes the AGENTS.md template structure

Structural changes require an ADR filed in `.arkos/adr/` before the spec can be approved.

ADRs are immutable. Once accepted, an ADR cannot be edited. To change a decision, file a new ADR that supersedes the old one.

---

## Code of conduct

ArkOS follows the Contributor Covenant v2.1. All contributors are expected to:

- Be respectful in all communication.
- Critique ideas, not people.
- Accept that decisions are made through the spec and ADR process, not by argument volume.

Report conduct concerns to the ARK360 team via `SECURITY.md`.

---

## Commit conventions

All commits must follow Conventional Commits 1.0:

```
<type>(<scope>): <description> (<spec-reference>)
```

Types: `feat`, `fix`, `docs`, `chore`, `refactor`, `test`.

Example: `docs(quickstart): clarify IDE adapter wiring (SPEC-0003)`

---

## Licence

By contributing, you agree that your contributions are licenced under Apache 2.0. Copyright is retained by the contributor; attribution to ARK360 is required as per the licence terms.
