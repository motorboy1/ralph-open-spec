# RALPH Research OS — Gate Automation Standard v1.1 (FROZEN)

## Scope

This document declares the official, frozen standard for submission governance
within RALPH Research OS.

## Components

- Governance Constitution (v1.x)
- Pre-Submission Gate (automatic)
- Post-Submission Gate
- Run-based Artifact Generation
- MCP-triggered Gate Invocation

## Execution Flow

1. Manuscript reaches PRE_SUBMISSION state
2. MCP trigger invokes Gate Runner automatically
3. Gate Runner generates immutable artifacts
4. Missing or failed artifacts BLOCK submission

## Verified Runs

- RUN-005
- RUN-006

## Artifact Contract

Required artifacts per run:

- presubmission_check.json
- presubmission_gate_result\_\_RUN-XXX.md
- postsubmission_gate_result\_\_RUN-XXX.md
- run_summary\_\_RUN-XXX.md

## Freeze Declaration

As of 2026-01-18, this standard is FROZEN.
Changes require a new version (v1.2+).
