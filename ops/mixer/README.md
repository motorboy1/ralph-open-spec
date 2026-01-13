# RALPH Mixer System v1.0

This directory contains standardized Mixer prompts and a human-in-the-loop workflow
for combining outputs from multiple AI systems (GPT, Claude, Gemini, Perplexity, Grok).

This system is **NOT** a real-time unified prompt UI.
It is a post-generation comparison, refinement, and decision framework.

---

## 1. Mixer Types (v1.0)

All Mixers operate under the following **non-negotiable rule**:

> ❗ Absolute Rule:  
> Mixers MUST NOT generate a new integrated draft from scratch.  
> They may only compare, select, reorder, or minimally edit provided materials.

### 1. Conservative Mixer

- Purpose: Select the safest, most conservative option
- Behavior: No synthesis, no creative expansion
- Typical use: Academic writing, governance documents

### 2. Synthesizer Mixer

- Purpose: Combine strengths of multiple outputs
- Behavior: Merge overlapping ideas without altering intent
- Constraint: Structural synthesis only, no new claims

### 3. Adjudicator Mixer

- Purpose: Decide which output is superior and why
- Behavior: Comparative evaluation with explicit criteria
- Output: Decision + rationale

### 4. Editor Mixer

- Purpose: Micro-level editing only
- Behavior: Grammar, clarity, tone smoothing
- Constraint: No logical or structural changes

---

## 2. Human-in-the-Loop Workflow (v1.0)

1. Run the same frozen task on multiple AI systems
2. Save each raw output **without editing**
3. Select an appropriate Mixer
4. Apply Mixer prompt to the collected outputs
5. Human reviews the result
6. Optional: Final micro-edit using Editor Mixer

> ⚠ Final authorship and judgment always remain with the human operator.

---

## 3. Design Philosophy

- ❌ No real-time multi-AI orchestration
- ❌ No automatic “best answer” generation
- ✅ Explicit comparison
- ✅ Traceable decision-making
- ✅ Context preservation over time

This system is designed for **Contextual Engineering**, not automation maximalism.
