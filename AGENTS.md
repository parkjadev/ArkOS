# AGENTS.md

This repository is governed by **ArkOS v0.1**. Read `.arkos/constitution.md` before doing anything else.

## Project

Replace this paragraph with a description of your project: what it is, who uses it, and why it exists. Keep it factual. No marketing copy.

## Tech stack

- Runtime: your runtime (e.g. Node.js 22 LTS)
- Framework: your framework (e.g. Next.js 15)
- Language: your language (e.g. TypeScript strict)
- Database: your database and ORM (e.g. Postgres 16 via Drizzle)
- Package manager: your package manager (e.g. pnpm 9)
- Test runner: your test runner (e.g. Vitest + Playwright)

Replace every line above with your actual stack before your first commit.

## How to work in this repo

1. Read `.arkos/constitution.md`.
2. Read the relevant spec in `.arkos/specs/` for the feature you are working on. If no spec exists, follow the "Starting a new feature" workflow below.
3. Read open ADRs in `.arkos/adr/` that touch the area you are changing.
4. Run the verify command (see Commands below) after every change. It must pass before you finish.
5. Write commits using Conventional Commits format. Imperative mood. Reference the spec ID.

## Starting a new feature (no spec exists yet)

When the user describes a new feature, change, or idea and there is no matching spec in `.arkos/specs/`, do not write code first. Follow this sequence:

1. **Write the spec.** Copy `.arkos/specs/_template.md` to `.arkos/specs/NNNN-<slug>.md` using the next available four-digit ID. Fill in every section: problem, out of scope (at least three items), EARS requirements, acceptance criteria table.
2. **Declare data and trust boundaries.** Set `touches-personal-data` and `trust-boundaries-crossed` in the frontmatter. If either is non-empty, complete the privacy notes (APP 1, 5, 11) and create a STRIDE-lite threat model in `.arkos/threat-models/`.
3. **File ADRs for architectural decisions.** If the feature introduces a new library, framework, external service, persistence model, auth model, or any other choice that future maintainers would want to know the reasoning behind, copy `.arkos/adr/_template.md` to `.arkos/adr/NNNN-<slug>.md` and complete it before writing code.
4. **Define contracts at boundaries.** For any new external interface (HTTP API, message schema, file format), add the schema to `.arkos/contracts/` before implementing either side.
5. **Confirm with the user.** Present the spec, ADRs, and threat model. Set `status: Approved` in the spec frontmatter only after the user accepts.
6. **Then implement.** Write the code, write the tests that map to each REQ in the acceptance criteria table, and update `CHANGELOG.md` under `[Unreleased]`.
7. **Open a PR on a feature branch.** Reference the spec ID in the commit message and PR title (`SPEC-NNNN`). CI runs the plan gate and build gate.

If the user pushes back ("just write the code"), explain that the constitution mandates spec-before-code and offer to write a minimal spec to unblock them. Do not skip the spec.

## Modifying an existing feature

1. Find the spec in `.arkos/specs/`. If the change is in scope of the existing spec, update the spec (new REQ-IDs, new acceptance criteria) and link the PR to it.
2. If the change is out of scope, write a new spec that references the original.
3. If the change reverses or amends an architectural decision, file a new ADR that supersedes the old one. ADRs are immutable; do not edit existing ones.

## Commands

- `<install-command>` - install dependencies
- `<dev-command>` - start local dev server
- `<verify-command>` - run lint, typecheck, unit tests, integration tests, and accessibility checks
- `<sbom-command>` - generate CycloneDX SBOM
- `<a11y-command>` - run accessibility checks (WCAG 2.2 AA) in isolation

Replace each `<placeholder>` with your actual command before your first commit.

## Banned patterns

- Do not use your language's untyped escape hatch (e.g. `any` in TypeScript, `Any` in Python). Use a typed alternative and narrow.
- Do not commit secrets. Use environment files (gitignored) or the configured secret store.
- Do not bypass the repository pattern for data access.
- Do not call an external SDK or API that is not declared as a dependency without first proposing it via an ADR.
- No unstructured debug output (e.g. `console.log`, `print`) in committed code. Use the project logger.
- No bare `TODO` comments. Format: `TODO(#<issue-number>): description`.

Add stack-specific banned patterns here before your first commit.

Some patterns above are enforced by CI via `.arkos/scripts/check-banned-patterns.sh` (the bare-TODO check is universal; the rest depend on file extensions). The remainder are reviewer-enforced.

## Context reading order

1. `.arkos/constitution.md`
2. The spec for the feature you are working on
3. The nearest README to the file being edited
4. Open ADRs that touch the area

## Nested AGENTS.md

This repository uses nested AGENTS.md files per the agents.md specification. The file closest to the file being edited takes precedence.
