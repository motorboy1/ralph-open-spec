# Human-in-the-Loop Workflow v1.0

(A4 One-Page Checklist)

## 목적

여러 AI 결과물을 **사람이 통제**하며 비교·선별·정제하기 위한
표준 작업 루틴이다.
실시간 통합이나 자동 최종생성은 수행하지 않는다.

---

## 0. 준비

- [ ] 동일한 Task 문서를 확정(FROZEN)
- [ ] Constitution / Mixer 버전 확인
- [ ] 출력 포맷 요구사항 명시

---

## 1. 개별 AI 실행

(Claude / GPT / Gemini / Perplexity / Grok)

각 AI에 **동일 Task** 입력

- [ ] Claude 결과 수집
- [ ] GPT 결과 수집
- [ ] Gemini 결과 수집
- [ ] Perplexity 결과 수집
- [ ] Grok 결과 수집

저장 규칙:

- 파일명: `{AI}_{task_id}_raw.md`
- 위치: `ops/mixer/runs/{date}/`

---

## 2. 1차 인간 판단 (선별)

- [ ] 각 결과를 **내용 변경 없이** 읽기
- [ ] 강점 표시 (✔)
- [ ] 치명적 결함 표시 (✖)
- [ ] 후보 2~3개 선택

산출물:

- 선택된 초안만 유지
- 나머지는 보관만 함 (삭제 금지)

---

## 3. Mixer 선택

작업 목적에 따라 **하나만 선택**

- Conservative Mixer
  → 최소 변경 / 안전 우선
- Synthesizer Mixer
  → 인간이 고른 초안 간 논리 병합
- Adjudicator Mixer
  → 충돌 판단 / 기준 명시
- Editor Mixer
  → 문장·표현만 다듬기

- [ ] 선택한 Mixer 기록

---

## 4. Mixer 실행

- [ ] 선택된 초안만 입력
- [ ] “절대 통합 생성 금지” 규칙 유지
- [ ] 결과 저장

저장 규칙:

- 파일명: `{Mixer}_{task_id}_v1.md`
- 위치: `ops/mixer/runs/{date}/`

---

## 5. 최종 인간 검토

- [ ] 논리 변경 여부 확인
- [ ] 의도 훼손 여부 확인
- [ ] 불필요한 AI 흔적 제거

결정:

- [ ] 채택
- [ ] 재편집 (Editor Mixer만 허용)
- [ ] 폐기

---

## 6. 종료 규칙

- AI에게 “최종본 생성”을 맡기지 않는다.
- 최종 결정권은 항상 사람에게 있다.
- 모든 중간 산출물은 보존한다.

---

## 원칙 요약

- AI는 제안한다.
- 사람은 선택한다.
- Mixer는 정제한다.
- 최종 책임은 인간이다.
