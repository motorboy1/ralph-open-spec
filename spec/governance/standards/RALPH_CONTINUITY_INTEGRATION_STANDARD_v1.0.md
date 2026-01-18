# RALPH_CONTINUITY_INTEGRATION_STANDARD_v1.0

Status: ACTIVE  
Scope: RALPH OS (Layer 0/Execution Hooks)

## 목적
- Gate / Runner / CI / Git Hook에서 실패 시, 사용자가 즉시 “복귀 지점(Continuity Log)”으로 이동할 수 있게 한다.
- 실패 원인을 설명하지 않는다. “복원 경로”를 출력하는 것이 목적이다.

## 강제 규칙
- 어떤 BLOCKED/FAIL 이든, 가능하면 Continuity Log 경로를 출력해야 한다.
- Continuity Log 탐색은 다음 우선순위를 따른다:
  1) spec/continuity/*_CONTINUITY_LOG_v1.0.md (최신 수정)
  2) repo 전체에서 *_CONTINUITY_LOG_v1.0.md (최신 수정)

## 구현 훅 지점
- ops/mcp/runtime/invoke_presubmission_gate.ps1
- ops/runner/* (gate runner류)
- .git/hooks/pre-commit
- .github/workflows/* (CI)

## 표준 출력 포맷
- CONTINUITY_LOG: <ABS_PATH or NOT_FOUND>
- CONTINUITY_DIR_HINT: <ABS_PATH>

## 파일
- ops/continuity/resolve_continuity_log.ps1 (Single Responsibility)
