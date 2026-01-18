# RALPH Repository Hygiene Standard v1.0 (FROZEN)

## Principle

The repository distinguishes between:

- GOVERNED artifacts (must be versioned)
- OPERATIONAL artifacts (runtime-generated, not versioned)

## Versioned (MUST be tracked)

- spec/\*\*
- ops/mcp/\*\*
- ops/runner/\*\*
- ops/validator/\*\*
- ops/state/\*\*
- ops/gate/contracts/\*\*
- ops/gate/triggers/\*\*
- ops/gate/runtime/\*\*
- ops/gate/receipts/\*\* (schemas & examples only)

## Ignored (MUST NOT be tracked)

- ops/gate/runs/\*\*
- ops/mixer/runs/\*\*
- vibe-studio/runtime/\*\*
- release/journal/\*\*
- release/whitepaper/\*\*

## Deletion Policy

- Old constitution versions (< current) are archived or removed once superseded.
- Only the latest active constitution is kept in `spec/constitution/`.

## Enforcement

Any commit violating this standard is INVALID.
