## Specification Status

**Status:** Stable (v1.0.0)  
**Scope:** RALPH Core Constitution & Official Profiles  
**Change Policy:**

- Core Constitution (`spec/constitution/`) is **structurally immutable** after v1.0; revisions are managed via versioned releases (e.g., v1.4).
- New capabilities must be introduced via **new profiles or versions**
- Backward-incompatible changes require a **major version bump**

This repository defines the **official, public specification** of the RALPH system.

# RALPH Research OS — Open Spec v1.0

RALPH is a governance-first Research Operating System (Research OS).

RALPH does not trust model intelligence.
RALPH enforces research integrity through constitutional rules, profiles, and verification loops.

## Core Principles

- Constitution > Profile > Model
- Zero inference (no guessing)
- Section isolation (IMRaD discipline)
- Loop-based verification
- Hard failure lock

## What RALPH Is

- NOT a paper generator
- NOT a prompt template
- NOT model-dependent

RALPH is a **research execution OS**.

## Package Contents

- `spec/constitution`: Immutable core rules
- `spec/profiles`: Executable research profiles
- `spec/methods`: Academic framework & methods description
- `vibe-studio/spec-loader`: Reference “Spec Loader” implementation (local)

## Compliance

Any system claiming “RALPH-compliant” MUST:

- Load the constitution as read-only
- Enforce loop + verification rules
- Apply failure lock exactly

## License

Specification: CC-BY 4.0 (recommended)
Reference implementation: MIT / Apache-2.0 (optional)

## Status

RALPH Open Spec v1.0 — STABLE

# pre-commit test

# test-pass

# RALPH Research OS

RALPH Research OS는  
**AI를 어떻게 써야 하는지를 정의하는 작업 방식 OS**입니다.

AI 모델이나 UI가 아니라,  
규칙·실행·검증·로그를 중심으로 한 **불변 코어(Immutable Core)**를 제공합니다.

---

## Core Philosophy

- AI / UI / Tool → Replaceable Shell
- Working Method → Immutable Core
- User → Operator (not prompter)
- Change → Absorbed, not propagated

---

## Why RALPH

AI와 UI는 빠르게 바뀝니다.  
작업 방식까지 함께 바뀌면 생산성은 붕괴됩니다.

RALPH는 변화 속에서도  
**작업의 일관성과 책임 구조를 유지**하기 위해 설계되었습니다.

---

## Execution Environments

RALPH는 단일 UI를 강제하지 않습니다.

### Design & Exploration

- Cursor + Claude

### Orchestration & Validation

- Claude CLI + MCP
- GPT / Gemini 연동 가능

### Governance Core

- Constitution
- Contract Engine
- Failure Classes

---

## Relationship with Vibe Studio

- **RALPH**: 규칙과 작업 방식을 정의하는 OS
- **Vibe Studio**: RALPH 위에서 동작하는 작업장(UI 플랫폼)

RALPH 없는 Vibe Studio 단독 운용은 허용되지 않습니다.

---

## Repository Structure

spec/constitution/ # Immutable core
spec/execution/ # Execution modes
spec/roles/ # Platform separation
docs/external/ # External communication
ops/ # Experiments & proposals

---

## One-Line Summary

> AI는 바뀌어도,  
> 우리의 작업 방식은 바뀌지 않는다.
