# RALPH_CI_PARITY_STANDARD_v1.0

Status: ACTIVE  
Scope: Local CI + GitHub Actions

## 목적
- 로컬(local_ci.ps1)과 GitHub Actions(ralph-ci.yml)이 동일한 규칙을 강제한다.
- “로컬에서는 통과, CI에서는 실패” 같은 분기 금지.

## 최소 강제 항목
- Project Name Freeze 검사 강제:
  - ops/continuity/check_project_name_freeze.ps1
- Continuity Log 경로 힌트 출력 가능(권장):
  - ops/continuity/resolve_continuity_log.ps1

## 실패 처리
- Warn 금지
- Block(Exit code != 0)만 허용
