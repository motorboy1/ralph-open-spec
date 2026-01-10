# Vibe Studio — RALPH Spec Loader (Reference)

This is a reference “Spec Loader” module that:
1) Reads a RALPH spec folder from local disk (Node backend)
2) Validates the key JSON files exist
3) Exposes a simple JSON summary for the UI
4) Renders the loaded spec in a basic React panel

## Minimal API
- GET /api/ralph/spec?root=<path>
