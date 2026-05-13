# Constitution

These are the rules that survive across sessions, agents and contributors. If you are about to break one, stop and open an ADR.

## Non-negotiable principles

1. **No silent failures.** Every error is logged, surfaced or handled. Empty catch blocks are a defect.
2. **Tests gate merges.** A red main branch is a P1 incident.
3. **Contracts before code.** Every external interface is defined in `.arkos/contracts/` before implementation lands.
4. **No personal data without a spec.** If a change collects, stores or transmits personal information, the spec must reference APP 1, 5 and 11, and a threat model must exist.
5. **Accessibility is a build gate.** WCAG 2.2 AA failures fail the build.

## Conformance level

- Security: OWASP ASVS v5.0.0 Level 1
- Cyber baseline: ASD Essential Eight ML1
- Privacy: Privacy Act 1988 (Cth), APP 1, 5, 11 minimum coverage
- Accessibility: WCAG 2.2 AA (ISO/IEC 40500:2025)
- SBOM: CycloneDX 1.6+ on every release

## Process

- **Plan before code.** Every non-trivial change has a spec in `.arkos/specs/` before any implementation begins.
- **Issue before branch.** Every branch maps to a tracked issue.
- **Zero-error boot.** The verify command is green on `main`, always.
- **ADRs are immutable.** Supersede; do not edit.
