# RALPH GOVERNANCE — Research OS

## Version 1.1 (Frozen)

FREEZE STATUS: ACTIVE  
EFFECTIVE DATE: 2026-01-18  
CHANGE POLICY: VERSIONED ONLY  
GOVERNED BY: RALPH_META_CONSTITUTION_v0.1

---

## 1. Scope

This governance document defines the mandatory control layer between:

- Constitution layer (normative rules)
- Execution layer (automation, runners, agents)

It applies to all research-related workflows including:

- Manuscript preparation
- Submission
- Revision
- Response to reviewers
- Archival and audit logging

---

## 2. Governance Layers

### 2.1 Pre-Submission Gate (Hard Gate)

Purpose:

- Block submission unless minimum research integrity conditions are met.

Artifacts (mandatory):

- `YYYY-MM-DD__presubmission_check.json`
- `YYYY-MM-DD__presubmission_gate_result__RUN-XXX.md`

Conditions (ALL required):

- Methods integrity declared
- Statistical consistency checked
- Ethics compliance stated
- Figures/Tables consistency confirmed

Failure:

- Any unmet condition → SUBMISSION BLOCKED

---

### 2.2 Post-Submission Gate (Hard Gate)

Purpose:

- Lock submission state and preserve evidence.

Artifacts (mandatory):

- `YYYY-MM-DD__postsubmission_gate_result__RUN-XXX.md`

Conditions:

- Submission completed
- Version hash recorded
- No overwrite of pre-submission artifacts

Failure:

- Missing artifact → RUN INVALID

---

### 2.3 Run Summary (Soft Gate)

Purpose:

- Provide human-readable overview of the run.

Artifacts:

- `YYYY-MM-DD__run_summary__RUN-XXX.md`

---

## 3. Automation Interface

### 3.1 Gate Runner (Minimum Contract)

Gate Runner MUST:

- Generate all mandatory artifacts
- Use RUN-based isolation
- Prevent overwrite of previous runs
- Emit PASS / FAIL explicitly

Minimum viable implementation:

- Local script (PowerShell / Python)
- MCP-based runner (optional)

---

## 4. Versioning Rules

- Governance documents are immutable once frozen.
- Changes require:
  - New version number
  - Explicit CHANGELOG
  - New EFFECTIVE DATE

---

## 5. Audit & Traceability

- All runs must be traceable by RUN ID.
- Artifacts must not be manually edited after generation.
- Git history serves as secondary audit trail.

---

## CHANGELOG

### v1.1 — 2026-01-18

- Added formal Gate Runner contract (Section 3)
- Formalized Pre/Post Submission Gate separation
- Standardized artifact naming with RUN isolation
- Validated automation via RUN-003 stub execution

### v1.0 — 2026-01-18

- Initial governance freeze
- Defined core gate concepts
