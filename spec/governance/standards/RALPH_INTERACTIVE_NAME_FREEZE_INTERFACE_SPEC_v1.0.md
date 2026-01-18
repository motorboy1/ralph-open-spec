# RALPH_INTERACTIVE_NAME_FREEZE_INTERFACE_SPEC_v1.0

Status: ACTIVE  
Scope: Local (PowerShell) + Optional CI

## 목적
- Placeholder 프로젝트명 상태에서 “트리거 발생 시” 진행을 강제 차단하고,
- 사용자에게 FINAL_PROJECT_NAME을 입력받아 즉시 동결(freeze)한다.

## 인터페이스 요구사항
- CLI 기반(대화식) 입력 지원:
  - Read-Host로 FINAL_PROJECT_NAME 입력
- 입력이 비어있으면 차단(Block) 유지
- 파일명 변경:
  - <FINAL_PROJECT_NAME>_CONTINUITY_LOG_v1.0.md
- 본문 수정 금지:
  - 단, 하단에 [Name Freeze] 블록 1회 append 허용

## 파일(구현체)
- ops/continuity/freeze_project_name.ps1

## 차단 규칙
- Gate/Runner/Submission 진행 전:
  - Placeholder continuity log 감지 + 트리거 감지 => BLOCK
