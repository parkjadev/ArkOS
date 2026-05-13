# ArkOS

**The governed operating system for agentic software development.**

ArkOS is a GitHub template repository that gives an enterprise solo developer everything they need to build production-grade software with AI coding agents from the first commit. Specs, decisions, gates and audit trails ship with the code.

---

## What ArkOS gives you

- **AGENTS.md** — a single source of truth for all agentic IDEs (Copilot, Cursor, Codex, Windsurf, Claude Code)
- **A project constitution** — five non-negotiable principles that survive across sessions and agents
- **EARS-based specs** — testable, traceable requirements before any agent touches a file
- **Nygard ADRs** — architectural decisions that are immutable and auditable
- **Five governance gates** — Research, Plan, Build, Ship, Run — enforced by CI
- **Compliance baselines** — OWASP ASVS v5 L1, Essential Eight ML1, APP 1/5/11, WCAG 2.2 AA
- **A Proof Sheet** — a fillable procurement evidence document generated from the repo

---

## Quickstart

**Time required: under 15 minutes.**

1. Click **"Use this template"** on GitHub to create a new repository from ArkOS.

2. Clone your new repository.

3. Open `.arkos/constitution.md` and read it. It is the project non-negotiables. Edit the process rules if your team differs.

4. Open `AGENTS.md` and replace the placeholder stack section with your actual runtime, framework, language, package manager, and test commands.

5. Configure your IDE adapter:
   - **Claude Code:** `CLAUDE.md` is already wired. Open it to review the Claude-specific notes.
   - **GitHub Copilot:** `.github/copilot-instructions.md` is already wired. No changes needed.
   - **Cursor:** `.cursor/rules/arkos.mdc` is already wired. No changes needed.
   - **Other AGENTS.md-native IDEs (Codex, Windsurf, Amp):** `AGENTS.md` works natively. No adapter needed.

6. Replace the placeholder steps in `.github/workflows/arkos.yml` with your stack's actual lint, typecheck, test, and SBOM commands.

7. Write your first spec in `.arkos/specs/` using the template at `.arkos/specs/_template.md`. Name it `0001-<feature-slug>.md`.

8. Make your first commit. Reference the spec: `feat: initialise project (SPEC-0001)`.

9. Push. CI runs all five gates.

See `QUICKSTART.md` for a detailed walkthrough.

---

## IDE adapters

| IDE | Status | File |
|---|---|---|
| GitHub Copilot | Wired | `.github/copilot-instructions.md` |
| Cursor | Wired | `.cursor/rules/arkos.mdc` |
| Claude Code | Wired | `CLAUDE.md` |
| Codex, Windsurf, Amp | Native | `AGENTS.md` (no adapter needed) |

---

## The five governance gates

| Gate | Question | Enforced by |
|---|---|---|
| Research | Are we solving the right problem? | Spec review |
| Plan | Is the design coherent and contracted? | CI + spec review |
| Build | Is what we built correct, safe and accessible? | CI (automated) |
| Ship | Is this safe to release and traceable? | CI on main branch |
| Run | Can we operate this without surprise? | Runbook + proof sheet |

Gate criteria are defined in `.arkos/gates/`.

---

## Framework documentation

- `docs/framework.md` — the ArkOS v0.1 framework document
- `docs/standards.md` — the standards ArkOS binds to, with versions and rationale
- `QUICKSTART.md` — step-by-step onboarding guide
- `CONTRIBUTING.md` — how to contribute to ArkOS itself

---

## Licence

Apache 2.0. Copyright 2026 ARK360.

ArkOS is an open-source release from ARK360 — building intelligent enterprise systems to amplify human excellence.
