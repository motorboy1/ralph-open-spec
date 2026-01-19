# Runbook — Agentic Coding (EXTENDED) v1

## When to use
- refactor / bugfix / feature
- repo-wide consistency update
- doc generation that must pass gates

## Minimal command skeleton
1) Intake
- Define success criterion and failure criterion
2) Plan
- Step list + rollback point
3) Execute
- Smallest diff possible
4) Validate
- checks/tests/consistency
5) Record
- runlog + decision log + commit

## Example success criteria
- Only intended files changed
- Validation command returns success
- Logs written under run folder
