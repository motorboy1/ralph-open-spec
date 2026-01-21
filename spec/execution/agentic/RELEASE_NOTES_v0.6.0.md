# Release Notes — v0.6.0 (Execution Options)

## Summary

This release formalizes execution modes for RALPH Research OS and records
validated evidence for Options ② and ③.

---

## Execution Options (v1)

- **Option ① — Cursor-Free**
  - Manual Cursor / Claude usage
  - No RALPH enforcement

- **Option ② — RALPH-RUN**
  - Mandatory run context
  - Proven via smoke test

- **Option ③ — RALPH-RUN + MCP**
  - Run context + MCP gate execution
  - Proven via smoke test

- **Option ④ — AUTONOMOUS**
  - Declared only (LOCKED)
  - Not executable in this release

---

## Smoke Test Evidence

- **Option ②**
  - Run: `2026-01-21__option2-smoke-01`
  - Result: PASS
  - Evidence commit: `5cfc655`

- **Option ③**
  - Run: `2026-01-21__option3-smoke-01`
  - Result: PASS
  - Evidence commit: `5cfc655`

---

## Option ④ Status

**LOCKED**

### Lock Reasons

- Budget / cost ceiling not defined
- Kill-switch & watchdog not implemented
- Sandbox isolation not enforced
- PR-only write path not guaranteed
- Incident & rollback drill not validated

### Unlock Requirements

- Budget + rate limits published
- Kill-switch & watchdog active
- Isolated execution (repo/worktree)
- PR-only CI enforced
- Rollback drill passed
