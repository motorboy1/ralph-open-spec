# Agentic Mode Spec (EXTENDED) v1.1

## Purpose (expanded)
Agentic Mode is not “auto-writing”.
It is an execution protocol that guarantees:
- traceability (diffs)
- validation (checks)
- reproducibility (logs)
- recoverability (small commits, clear rollback points)

## Standard Loop (MANDATORY)
0. Intake
- Inputs, constraints, scope, success condition
1. Plan
- Small steps, rollback points, what will be validated
2. Execute
- Minimal diffs, avoid mixing concerns
3. Validate
- Run checks, verify constraints, ensure logs exist
4. Commit & Log
- Commit message, tag/notes if needed, runlog + decision log

## Fail policy (expanded)
FAIL if:
- any stage is skipped
- validation is missing
- logs are missing
- unrelated changes are mixed into the same commit

## Required artifacts (expanded)
- diff/patch: what changed
- runlog: what was done, by whom/what, when
- decision log: what choices made and why
- failure log: what failed and how to reproduce

## External model calls
Allowed for:
- cross-validation (e.g., compare interpretations)
- alternative generation (e.g., different rewrite)
- specialized tasks
Mandatory logging:
- input prompt
- output
- adoption decision (used/not used + why)

## Practical checklists
- Before execute: scope is one sentence?
- During execute: changes are minimal and focused?
- Before commit: validation evidence exists?
