# Vibe Studio × RALPH — Human Guide (EXTENDED) v1

## One-line
RALPH is the governance & validation OS.
Vibe Studio is the workspace UI that activates and visualizes work across models/tools.

## Current reality
- BigTech UIs change frequently; policies may restrict deep integration.
- Therefore, we freeze the method (rules + validation + logs) in RALPH.
- Vibe Studio stays a replaceable shell that can adapt to UI/tool changes.

## Division of responsibilities
### RALPH (Governance Core)
- Constitution (immutable rules)
- Contract Engine (execution constraints, failure classes)
- Validation, logging, traceability
- “DONE claims” require evidence

### Vibe Studio (Workspace UI)
- Task cockpit: prompt workspace, templates, ops visibility
- Human-friendly views: run history, diffs, gates, status
- Routing: which model/tool to use, when
- Collaboration: packaging, sharing, onboarding

## Recommended operating stack
- Cursor + Claude: fastest coding/drafting UI
- Claude CLI + MCP: orchestration + gates + logging
- GPT/Gemini: API-based cross-checkers and alternates (logged)

## Why not unify everything into one UI now
- Integration volatility and policy changes
- Maintenance cost explodes if core rules are tied to a single UI
- Separation makes you insensitive to UI/model churn

## Practical collaboration protocol
- Vibe Studio never bypasses RALPH gates
- Outputs are only “accepted” after validation + logs exist
- External model outputs must record adoption decisions

## Deliverables for Vibe Studio team
- External package (/docs/external/PACKAGE_VIBE_STUDIO_v1)
- This extended guide (/docs/manual/vibe_studio/...)
- Clear decision: “RALPH governs, Vibe Studio activates”
