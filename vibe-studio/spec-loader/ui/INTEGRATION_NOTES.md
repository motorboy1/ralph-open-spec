# Vibe Studio Integration Notes (Practical)

## Goal
Show “RALPH Spec” as a selectable Profile in the UI.

## Wiring
1) Start the local server:
   - `node vibe-studio/spec-loader/server/index.js`
2) In Vibe Studio, add a panel route:
   - `/spec-loader`
3) Render:
   - `SpecLoaderPanel rootPath="D:/Projects/MCP/ralph-open-spec"`

## Future
- Add JSON schema validation (AJV)
- Add version selector
- Add diff viewer for spec versions
