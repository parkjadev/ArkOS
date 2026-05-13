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
2. Read the relevant spec in `.arkos/specs/` for the feature you are working on.
3. Read open ADRs in `.arkos/adr/` that touch the area you are changing.
4. Run the verify command (see Commands below) after every change. It must pass before you finish.
5. Write commits using Conventional Commits format. Imperative mood. Reference the spec ID.

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
