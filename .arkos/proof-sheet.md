# ArkOS Proof Sheet — <Project Name>

This codebase was built under **ArkOS v0.1** governance.
The complete evidence trail is in the repository.

Fill in the `<placeholder>` fields before presenting this document to a procurement reviewer.

---

## Conformance summary

| Domain | Standard | Level | Evidence |
|---|---|---|---|
| Application security | OWASP ASVS v5.0.0 | Level 1 | `.arkos/specs/`, SAST report in CI |
| Cyber hygiene | ASD Essential Eight | ML1 | Attestation in `.arkos/proof-essential-eight.md` |
| Privacy | Privacy Act 1988 (Cth), APP 1, 5, 11 | Compliant for scope | Privacy notes in each spec |
| Accessibility | WCAG 2.2 AA (ISO/IEC 40500:2025) | Compliant | axe-core CI report; manual audit report |
| Supply chain | CycloneDX SBOM 1.6+ | Current | `sbom.cdx.json` per release, attached as CI artefact |
| Change management | Conventional Commits 1.0 + Keep a Changelog 1.1 | Mandatory | `CHANGELOG.md`, `.arkos/adr/` |

---

## What ArkOS governance guarantees

1. Every change has an EARS-based, testable, traceable spec.
2. Every architecturally significant decision has an ADR.
3. Every feature touching personal data has a privacy review (APP 1, 5, 11).
4. Every feature crossing a trust boundary has a STRIDE-lite threat model.
5. Every release ships with a CycloneDX SBOM and clean SAST and dependency report.
6. Every PR is gated by CI for lint, typecheck, tests, accessibility, and contracts.
7. Every release updates a Keep-a-Changelog CHANGELOG.md.

---

## Run readiness checklist

Complete this checklist before promoting to production. CI cannot automate all run gate criteria.

- [ ] SLOs are defined in the runbook with numeric targets
- [ ] Runbook covers health checks, common alerts, and rollback procedure
- [ ] Structured logging is wired; one metric per SLO; one alert per failure mode
- [ ] On-call rotation is recorded in the runbook

---

## Out of scope for this version

IRAP; Essential Eight ML2+; SLSA L3+; ISO 27001 full ISMS; SOC 2 Type II.

These are available in later versions of ArkOS or as a separately scoped engagement through ARK360.

---

## Contact

- Coordinated disclosure: see `SECURITY.md`
- Project owner: `<name>`
- Last review: `<date>`
