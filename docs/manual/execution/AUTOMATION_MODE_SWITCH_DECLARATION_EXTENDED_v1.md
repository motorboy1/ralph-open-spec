# Automation Mode Switch Declaration (EXTENDED) v1

## What this is
This is the human-facing explanation of why and how we run RALPH in automation-first mode.

## Core rule (summary)
From tag constitution/v1.4 onward:
- Human decides scope/constraints and approves gates.
- System executes, validates, logs, and produces reproducible artifacts.

## Why we separate Core vs Extended
- Core docs in /spec must be short, stable, and agent-friendly.
- Extended docs in /docs/manual can include narrative, examples, and training material.

## Non-negotiables (interpretation guide)
1) Constitution / Contract Engine rules override UI convenience  
   - If a UI wants to skip validation/logging, UI must yield.
2) Agentic loop must be followed  
   - Intake → Plan → Execute → Validate → Commit/Log
3) No completion claims without evidence  
   - Evidence = validation outputs + run logs + diff/commit trace

## Execution surfaces (practical meaning)
- Cursor + Claude: fast drafting, refactoring, design exploration
- Claude CLI + MCP: orchestration, repeatable execution, gating, logs
- GPT/Gemini via adapters: optional cross-checkers (must log I/O and adoption decision)

## Typical workflow example
- Draft in Cursor (fast)
- Run validation + produce logs via CLI/MCP (strict)
- Commit only validated artifacts

## When to refuse automation
- If inputs are incomplete (PENDING)
- If spec/core rules would be violated
- If outputs cannot be validated or logged
