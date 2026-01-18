# RALPH OS – Meta-Constitution v0.1

_(Layer 0 · Immutable Governance)_

## 전문 (Preamble)

본 Meta-Constitution은 RALPH OS 전반을 지배하는 최상위 규범으로서,  
개별 OS 헌법(Research, Creative, Development, Automation 등)의  
선택, 적용, 분리, 종료 방식을 규정한다.

본 문서는 작업 내용(content)이 아니라  
규칙이 작동하는 방식(rule of rules)을 정의한다.

---

## 제1조 [단일 활성 헌법 원칙 · Single Active Constitution]

1. 모든 실행 세션(Session, Run, Project)은  
   단 하나의 활성 헌법(Active Constitution)만을 가진다.
2. 두 개 이상의 헌법을 동시에 적용하거나,  
   헌법을 혼합하여 해석하는 행위는 허용되지 않는다.
3. 활성 헌법이 명확히 식별되지 않는 세션은  
   실행 자격을 상실한다.

---

## 제2조 [명시적 선언 의무 · Explicit Declaration]

1. 모든 작업은 시작 시 다음을 명시적으로 선언해야 한다.
   - 대상 OS (Target OS)
   - 적용 헌법 ID (Constitution ID)
2. 선언 형식은 인간·AI 모두가 식별 가능해야 하며,  
   선언되지 않은 작업은 자동으로 무효 처리된다.
3. 선언은 해당 세션의 로그와 산출물에 영구적으로 귀속된다.

---

## 제3조 [불변성 · Immutability]

1. 세션이 시작된 이후에는  
   선택된 헌법의 규칙, 판정 기준, 금지 조항을 수정할 수 없다.
2. 헌법을 변경하고자 할 경우:
   - 현재 세션을 종료(Terminate)해야 하며
   - 새로운 헌법 선언과 함께 새 세션을 개시해야 한다.
3. 실행 도중의 규칙 변경은  
   시스템 위반(System Violation)으로 간주한다.

---

## 제4조 [OS 분리 원칙 · Separation of OS]

1. 서로 다른 PASS / FAIL 기준을 갖는 작업은  
   서로 다른 OS로 정의되어야 한다.
2. 대표적 분류는 다음과 같다.
   - Research OS: 검증·재현 가능한 지식 생산
   - Ideation / Creative OS: 탐색·발산·가설 생성
   - Development OS: 실험·수정·구현
   - Automation / Ops OS: 운영·정책·예외 처리
3. 하나의 OS 내부에서는  
   해당 헌법이 정의한 판정 체계만이 유효하다.

---

## 제5조 [지배 우선성 · Supremacy]

1. 본 Meta-Constitution은  
   모든 개별 OS 헌법, Governance Layer, Execution Layer보다  
   우선 적용된다.
2. 하위 규칙이 본 문서와 충돌할 경우,  
   본 Meta-Constitution을 최종 기준으로 한다.

---

## 제6조 [연속성 기록 의무 · Continuity Log Mandate]

1. RALPH OS에서 다음 조건 중 하나라도 해당하는 작업은  
   Continuity Log를 **필수 산출물**로 가진다.
   - 장기간(시간 단절 가능성) 진행되는 프로젝트
   - 복수 프로젝트 병행 상태에서 수행되는 작업
   - AI 협업이 포함되어 컨텍스트 손실 위험이 존재하는 작업
   - 자동화(MCP, Runner, Gate)가 개입된 작업

2. Continuity Log의 목적은 다음과 같다.
   - 프로젝트의 진행 상태를 요약하는 것이 아니라
   - **판단이 내려진 지점과 그 맥락을 복원 가능 상태로 보존**하는 것

3. Continuity Log는 다음 문서가 아니다.
   - 요약 문서
   - 보고서
   - 회의 기록
   - 회고 문서

4. Continuity Log는  
   **프로젝트 인지 상태의 단일 복원 지점  
   (Single Recovery Point of Project Cognition)** 으로 정의된다.

---

## 제7조 [Continuity Log 구성 규격]

1. 모든 Continuity Log는 최소한 다음 항목을 포함해야 한다.
   - 문서의 존재 이유에 대한 명시적 선언
   - 문서를 언제 사용하는지에 대한 사용 시나리오
   - 변경 불가 기록 원칙
   - Phase 기반 타임라인 기록
   - 실행 결과 중심 기록 (의도·계획만 기록하는 행위 금지)
   - 현재 상태에 대한 문장 기반 선언
   - 명확히 수행하지 않은 항목의 선언

2. 위 항목 중 하나라도 누락될 경우  
   해당 문서는 Continuity Log로 인정되지 않는다.

---

## 제8조 [Continuity Log 버전 및 동결 규칙]

1. 모든 Continuity Log는 버전을 가진다. (vX.Y)

2. 특정 시점에 **동결(FROZEN)** 선언된 Continuity Log는  
   이후 수정할 수 없다.

3. 추가 진행 사항은  
   새로운 버전의 Continuity Log로만 기록한다.

4. 기존 버전은 요약, 병합, 재작성할 수 없다.

---

## 제9조 [적용 범위 · Applicability]

1. 본 규정은 다음에 강제 적용된다.
   - RALPH Research OS
   - RALPH Research OS의 모든 파생 프로젝트
   - Gate / MCP / Runner 기반 자동화 프로젝트
   - 단일 세션을 초과하는 모든 작업

2. 본 규정을 준수하지 않은 작업은  
   **비정상 실행 상태**로 간주한다.

---

## 부칙

부칙 제1조

- 본 문서는 RALPH OS Layer 0에 해당한다.
- 본 문서의 버전은 v0.1 (Minimal & Frozen)으로 한다.
- 본 문서는 확장될 수 있으나,  
  개정은 버전 단위로만 가능하다.

부칙 제2조 [프로젝트 이름 확정 트리거 규칙 · Project Name Freeze Rule]

1. RALPH OS에서 수행되는 모든 프로젝트는
   초기 단계에서 임시 프로젝트명(Placeholder Name)을 사용할 수 있다.

2. 프로젝트 이름은 임의적 판단이나 선언에 의해 고정될 수 없으며,
   사실 기반 트리거(Event Trigger)에 의해서만 확정된다.

3. 다음 사건 중 하나라도 최초로 발생한 시점을
   Project Name Freeze Point로 정의한다.

   A. 외부 참조 발생
   - 투고 대상 저널, 기관, 클라이언트, 외부 파트너가 명시된 경우
   - 공개 저장소 또는 외부 문서에 프로젝트가 참조된 경우

   B. RUN-ID의 외부 산출물 귀속
   - release/ 하위 패키지 생성
   - 제출용 산출물 생성
   - RUN-ID가 외부 파일명 또는 경로에 포함된 경우

   C. Gate 기록 누적
   - 동일 프로젝트에서 RUN 횟수 ≥ 2
   - Pre/Post Gate 결과가 누적 기록된 경우

   D. 시간 기준 자동 고정
   - 임시 프로젝트명 상태로 연속 7일 경과
   - 또는 누적 실제 작업 시간 10시간 초과

4. Project Name Freeze Point 발생 즉시 다음 조치를 이행해야 한다.
   - Continuity Log 파일명을
     <FINAL_PROJECT_NAME>\_CONTINUITY_LOG_v1.0.md 로 변경한다.
   - 문서 본문은 수정하지 않는다.
   - 문서 최하단에 다음 형식의 기록을 1회 추가한다.

   [Name Freeze]
   - Final Project Name: <FINAL_PROJECT_NAME>
   - Freeze Trigger: <A | B | C | D>
   - Date: <YYYY-MM-DD>

5. 프로젝트 이름 고정은 버전 이벤트가 아니며,
   이름 고정만을 이유로 버전을 변경하는 행위는 금지된다.

6. 본 규칙을 위반한 프로젝트는
   식별 무결성 위반(Identity Integrity Violation)으로 간주한다.프로젝트명(Placeholder Name) 을 사용할 수 있다.

프로젝트 이름은 임의적 판단이나 선언에 의해 고정될 수 없으며,
사실 기반 트리거(Event Trigger) 에 의해서만 확정된다.

다음 사건 중 하나라도 최초로 발생한 시점을
Project Name Freeze Point로 정의한다.

A. 외부 참조 발생

투고 대상 저널, 기관, 클라이언트, 외부 파트너가 명시된 경우

공개 저장소 또는 외부 문서에 프로젝트가 참조된 경우

B. RUN-ID의 외부 산출물 귀속

release/ 하위 패키지 생성

제출용 산출물 생성

RUN-ID가 외부 파일명 또는 경로에 포함된 경우

C. Gate 기록 누적

동일 프로젝트에서 RUN 횟수 ≥ 2

Pre/Post Gate 결과가 누적 기록된 경우

D. 시간 기준 자동 고정

임시 프로젝트명 상태로 연속 7일 경과

또는 누적 실제 작업 시간 10시간 초과

Project Name Freeze Point 발생 즉시 다음을 수행해야 한다.

Continuity Log 파일명을
<FINAL_PROJECT_NAME>\_CONTINUITY_LOG_v1.0.md 로 변경

문서 본문은 수정하지 않는다.

최하단에 아래 형식의 기록 1회 추가만 허용한다.

[Name Freeze]

- Final Project Name: <FINAL_PROJECT_NAME>
- Freeze Trigger: <A | B | C | D>
- Date: <YYYY-MM-DD>

프로젝트 이름 고정은 버전 이벤트가 아니며,
이름 고정만을 이유로 버전을 변경하는 행위는 금지된다.

본 규칙을 위반한 프로젝트는
식별 무결성 위반(Identity Integrity Violation) 으로 간주한다.

# TEMP VIOLATION
