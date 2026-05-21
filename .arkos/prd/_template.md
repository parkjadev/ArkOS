---
product: "<Product name>"
slug: "<product-slug>"
status: Draft
owner: "@github-handle"
created: YYYY-MM-DD
source_prompt: "<Paste or summarise the developer's original idea in one paragraph>"
touches-personal-data: false
trust-boundaries-crossed: false
proposed-stack: "<e.g. dotnet | nextjs | unknown>"
linked-foundation-spec: SPEC-0001
---

# PRD: <Product name>

## One-line value proposition

<!-- One sentence: who benefits and what changes for them. -->

## Problem

<!-- Two to four paragraphs. Who has the problem today? What is painful or risky? Why now? -->

## Users and jobs to be done

| User / role | Job to be done | Pain today |
|---|---|---|
| | | |

## MVP outcome

<!-- Single measurable outcome for the first release (90-day horizon if applicable). -->

## MVP capabilities

<!-- Bullets or table. Each row should map to a future SPEC-0002+ epic where possible. -->

| Priority | Capability | Notes | Proposed spec |
|---|---|---|---|
| P0 | | | SPEC-0002 |
| P0 | | | SPEC-0003 |
| P1 | | | SPEC-0004 |

## Non-goals

<!-- Required: at least three explicit exclusions for MVP and v1. -->

1. 
2. 
3. 

## Stack and technical constraints

| Area | Choice / constraint | Rationale |
|---|---|---|
| Runtime / language | | |
| UI surfaces | | |
| Hosting / cloud | | |
| Integrations | | |
| Mobile | | |

## Privacy and data (APP 1, 5, 11)

<!-- If personal information is involved: what data, why collected, retention, access. If none, state "No personal data in MVP." -->

- **Personal data in scope:** 
- **Collection purpose (APP 3):** 
- **Notice and consent (APP 1):** 
- **Security safeguards (APP 11):** 

## Trust boundaries

<!-- Auth, external APIs, on-prem devices, operator vs resident, etc. Set touches-personal-data and trust-boundaries-crossed in frontmatter. -->

| Boundary | Description | MVP exposure |
|---|---|---|
| | | |

## Accessibility (WCAG 2.2 AA)

<!-- Which surfaces must meet AA in MVP? Known constraints? -->

## Success metrics

| Metric | Target | How measured |
|---|---|---|
| | | |

## Roadmap after MVP

<!-- Ordered epics for SPEC-0002 onwards. Keep titles short; detail lives in specs later. -->

1. 
2. 
3. 

## Open questions

<!-- Deferred clarifications with owner and date. Empty when PRD is Approved. -->

| Question | Owner | Target date |
|---|---|---|
| | | |

## Approval

- [ ] Product owner reviewed
- [ ] Non-goals explicit and agreed
- [ ] MVP scope fits one foundation PR (SPEC-0001) plus follow-on specs
- [ ] `status` set to `Approved` in frontmatter
