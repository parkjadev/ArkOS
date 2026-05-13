# ArkOS Quickstart

Follow these steps to make your first governed commit. No other file is required.

**Estimated time: 15 minutes.**

---

## Step 1 — Create your repository from the template

1. Go to the ArkOS template repository on GitHub.
2. Click **"Use this template"** then **"Create a new repository"**.
3. Name your repository and set visibility.
4. Click **"Create repository"**.

Clone your new repository:

```
git clone https://github.com/<your-org>/<your-repo>.git
cd <your-repo>
```

---

## Step 2 — Read the constitution

Open `.arkos/constitution.md`. Read it fully. It contains the five non-negotiable principles that govern every change in this repository.

Edit the process rules at the bottom if your team has different conventions. Do not edit the non-negotiable principles without opening an ADR.

---

## Step 3 — Personalise AGENTS.md

Open `AGENTS.md`. Replace each placeholder section with your project's actual values:

- **Project:** Write one paragraph describing what this project is, who uses it, and why it exists.
- **Tech stack:** Replace the placeholder entries with your actual runtime, framework, language, package manager, and test runner.
- **Commands:** Replace the placeholder commands with the actual commands for your stack.
- **Banned patterns:** Add any project-specific patterns that must not appear in committed code.

Keep `AGENTS.md` under 150 lines. If it exceeds that, move detail into nested `AGENTS.md` files closer to the code.

---

## Step 4 — Configure your IDE adapter

**Claude Code**

`CLAUDE.md` is already wired. Open it to review the Claude Code-specific notes. Add or remove notes as needed. Do not copy content from `AGENTS.md` into `CLAUDE.md`.

**GitHub Copilot**

`.github/copilot-instructions.md` is already wired. No changes needed for basic use.

**Cursor**

`.cursor/rules/arkos.mdc` is already wired. No changes needed for basic use.

**Codex, Windsurf, Amp, Gemini CLI, or any other AGENTS.md-native IDE**

`AGENTS.md` works natively. No adapter file is needed.

---

## Step 5 — Wire your verify command

Open `.github/workflows/arkos.yml`. Replace each placeholder step with your stack's actual command:

```
# Find lines that start with: echo "REPLACE:
# Replace them with your stack's actual commands.
```

Common replacements:

| Placeholder | Node.js example | Python example |
|---|---|---|
| Install dependencies | `pnpm install --frozen-lockfile` | `pip install -r requirements.txt` |
| Lint | `pnpm lint` | `ruff check .` |
| Typecheck | `pnpm typecheck` | `mypy .` |
| Unit tests | `pnpm test:unit` | `pytest tests/unit` |
| Integration tests | `pnpm test:integration` | `pytest tests/integration` |
| Accessibility tests | `pnpm test:a11y` | `pa11y-ci` |

For the SBOM step, replace the placeholder with the appropriate CycloneDX tool for your stack:
- Node.js: `pnpm exec cyclonedx-npm --output-file sbom.cdx.json`
- Python: `cyclonedx-py --output sbom.cdx.json`
- Other stacks: see the CycloneDX documentation.

---

## Step 6 — Write your first spec

Copy the spec template:

```
cp .arkos/specs/_template.md .arkos/specs/0001-<feature-slug>.md
```

Open the new file and fill in every field:

1. Set `id: SPEC-0001` and `slug: <feature-slug>`.
2. Write a `## Problem` section: one paragraph, who benefits, why this exists.
3. Write `## Out of scope` with at least three explicit exclusions.
4. Write your requirements using EARS patterns. At least one of: WHEN, IF, WHILE, WHERE.
5. Fill in the acceptance criteria table: one row per requirement, mapped to a test.
6. If the feature touches personal data, complete the Privacy notes section.
7. If the feature has a UI, complete the Accessibility notes section.
8. Set `status: Approved` when the spec is ready.

---

## Step 7 — Make your first commit

Stage your personalised files and commit using Conventional Commits format with a spec reference:

```
git add AGENTS.md .arkos/constitution.md .arkos/specs/0001-<feature-slug>.md
git commit -m "feat: initialise project with ArkOS governance (SPEC-0001)"
```

The commit message must include `SPEC-[0-9]+`. The plan gate script checks for this.

---

## Step 8 — Push and verify

```
git push origin main
```

Watch the CI workflow run in your repository's Actions tab. All four jobs must pass:

1. **plan-gate** — checks for the spec reference
2. **build-gate** — runs lint, typecheck, tests, accessibility, contracts, banned patterns
3. **ship-gate** — generates SBOM, checks CHANGELOG, runs SAST and dependency scan (main branch only)
4. **run-readiness** — prints the run gate checklist (human sign-off required)

Fix any failures before moving to implementation.

---

## Next steps

- Write your second spec for the next feature.
- File an ADR for any significant architectural decision.
- Before production: complete the run readiness checklist in `.arkos/proof-sheet.md`.
- For procurement: fill in `.arkos/proof-sheet.md` and share it with the reviewer.

Questions or issues: see `CONTRIBUTING.md`.
