---
id: SPEC-NNNN
slug: feature-slug
title: Feature Title
status: Draft # Draft | Approved | Superseded
owner: "@github-handle"
created: YYYY-MM-DD
touches-personal-data: false # true | false
trust-boundaries-crossed: false # true | false
linked-adrs: [] # e.g. [ADR-0001, ADR-0002]
linked-threat-model: null # e.g. .arkos/threat-models/feature-slug.md
---

# SPEC-NNNN: Feature Title

## Problem

<!-- Required. One to three paragraphs. -->
<!-- Answer: What problem does this solve? Who experiences it? Why does it matter? -->
<!-- Do not describe the solution here. Describe the problem only. -->

## Out of scope

<!-- Required. At least three explicit exclusions. -->
<!-- Be specific. Vague exclusions are not exclusions. -->

1. 
2. 
3. 

## Requirements

<!-- Use EARS notation. Every requirement must be independently testable. -->
<!-- Assign a unique REQ-NNN identifier to each requirement. -->
<!-- Include all five EARS patterns where applicable. Remove patterns that do not apply. -->

### Ubiquitous (always true, no trigger)

> REQ-001: The system shall [behaviour].

### Event-driven (triggered by an event)

> REQ-002: WHEN [trigger event] the system shall [behaviour].

### State-driven (active while in a state)

> REQ-003: WHILE [system state] the system shall [behaviour].

### Optional feature (conditional on feature being present)

> REQ-004: WHERE [feature or condition is present] the system shall [behaviour].

### Unwanted behaviour (what must not happen)

> REQ-005: IF [condition] THEN the system shall NOT [behaviour].

## Acceptance criteria

<!-- One row per requirement. Every REQ-NNN must appear exactly once. -->
<!-- Test type: unit | integration | e2e | manual | contract | accessibility -->

| Req | Test | Type |
|---|---|---|
| REQ-001 | | |
| REQ-002 | | |
| REQ-003 | | |
| REQ-004 | | |
| REQ-005 | | |

## Privacy notes

<!-- Required when touches-personal-data is true. -->
<!-- Document APP obligations for this feature. -->

| Principle | Obligation | How addressed |
|---|---|---|
| APP 1 | Open and transparent management of personal information | |
| APP 5 | Notification of collection of personal information | |
| APP 11 | Security of personal information | |

## Accessibility notes

<!-- Required for any feature with a user interface component. -->
<!-- Reference specific WCAG 2.2 AA success criteria that apply. -->

| Criterion | WCAG reference | How addressed |
|---|---|---|
| | | |
