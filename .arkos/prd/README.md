# Product requirements (PRD)

The PRD captures **what** the product is and **why**, before any foundation spec (SPEC-0001) or application code.

## Files

| File | Purpose |
|---|---|
| `_template.md` | Copy structure for new products; do not edit in place |
| `product.md` | The active PRD for this repository (create on greenfield adoption) |

## Workflow

1. Developer describes an idea in the agent (short prompt is fine).
2. Agent runs the interview in [`.arkos/prompts/prd-discovery.md`](../prompts/prd-discovery.md).
3. Agent writes `product.md` from `_template.md` with `status: Draft`.
4. Developer reviews; agent sets `status: Approved` when confirmed.
5. Agent drafts **SPEC-0001** (architecture and scaffold) **from the PRD**, not from memory.
6. Roadmap epics in the PRD become **SPEC-0002+** as separate approved specs.

## Rules

- Do not scaffold stack code until the PRD is **Approved**.
- Do not guess answers to required interview questions; ask or record deferrals in **Open questions**.
- One PRD per repository for the product; major pivots get a new ADR and PRD revision spec.
