# RALPH Execution Options v1

This document is the official specification of execution options (①–④).
It defines entry commands, required declarations, and lock conditions.

---

## Option ① — CURSOR-FREE (Cursor + Claude only)

### Purpose

Fast, local editing without RALPH execution contract.

### Entry

No RALPH command.

### Mandatory Declaration Block (human-facing)

```text
MODE: OPTION-① (CURSOR-FREE)
RUN: NONE
MCP: DISABLED
RULE: Step omission = FAIL
```

### Guarantees

- No run folder is created
- No MCP gate is executed

---

## Option ② — RALPH-RUN (Run contract without MCP)

### Purpose

Create a mandatory run context to bind work to artifacts (Intake→Plan→Execute→Validate→Record).

### Entry Command

```powershell
.\ralph.ps1 run <task-name>
```

### Mandatory Declaration Block (human-facing; inside run)

```text
MODE: OPTION-② (RALPH-RUN)
RUN: REQUIRED
MCP: DISABLED
RULE: Step omission = FAIL
```

### Guarantees

- Run folder is created under `spec/execution/agentic/runs/<date>__<task>`
- Scaffold files (00~04) exist

---

## Option ③ — RALPH-RUN+MCP (Run contract + MCP gate)

### Purpose

Run context + automated governance checks via MCP gate.

### Entry Command

```powershell
.\ralph.ps1 run-with-mcp <task-name>
```

### Mandatory Declaration Block (human-facing; inside run)

```text
MODE: OPTION-③ (RALPH-RUN+MCP)
RUN: REQUIRED
MCP: ENABLED
GATE: PRE_SUBMISSION_GATE
RULE: Step omission = FAIL
```

### Guarantees

- Run folder + scaffold exist
- `outputs/mcp_gate.log` is created
- Gate artifacts are produced under `ops/gate/runs/`

---

## Option ④ — AUTONOMOUS (Declared-only; LOCKED)

### Status

DECLARED (LOCKED). Execution is not enabled in v1.

### Purpose

24/7 autonomous operation to produce artifacts with controlled cost/risk and strict governance.

### Entry Command (NOT AVAILABLE)

- None. Any autonomous entry command is forbidden while LOCKED.

### Mandatory Declaration Block (official)

```text
MODE: OPTION-④ (AUTONOMOUS)
RUN: REQUIRED
MCP: REQUIRED
EXECUTION: AUTONOMOUS
STATUS: DECLARED (LOCKED)
LOCK_REASON: Safety, cost, and blast-radius not yet bounded
UNLOCK_REQUIRES:
  - Budget ceiling + rate limits defined
  - Kill-switch + watchdog implemented
  - Sandbox repo/worktree isolation enforced
  - PR-only write path + required checks enforced
  - Incident log + rollback procedure validated
RULE: Step omission = FAIL
```

### Lock Conditions (why locked)

- No bounded budget/rate limits
- No kill-switch / watchdog proven
- No isolated sandbox execution path mandated
- No PR-only write policy enforced by automation
- No incident/rollback drill validated

### Unlock Gate (must all pass)

- Budget/Risk spec published
- Autonomous runner implemented (server or local) with hard limits
- CI + branch protection + PR workflow validated end-to-end
- Recovery/rollback verified with a drill run

---
