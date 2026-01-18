# ============================================================
# RALPH OS — Project Name Freeze Checker (HARD BLOCK)
# File: ops/continuity/check_project_name_freeze.ps1
# Behavior:
# - If placeholder continuity log is detected AND freeze trigger is detected
#   => BLOCK with explicit paths + instructions.
# - Optional improvement: if Created: missing, fallback to file creation time for Trigger D.
# Exit codes:
#   0 = OK (can proceed)
#   20 = BLOCKED (name must be frozen)
#   21 = BLOCKED (continuity log missing)
# ============================================================

$root = "D:\Projects\MCP\ralph-open-spec"
$contDir = Join-Path $root "spec\continuity"

if (!(Test-Path $contDir)) {
    Write-Host "CONTINUITY_DIR: $contDir"
    Write-Error "BLOCKED: continuity directory not found."
    exit 21
}

# Find continuity logs
$logs = Get-ChildItem -Path $contDir -File -Filter "*_CONTINUITY_LOG_v1.0.md" -ErrorAction SilentlyContinue

if (!$logs -or $logs.Count -eq 0) {
    Write-Host "CONTINUITY_DIR: $contDir"
    Write-Error "BLOCKED: Continuity Log not found."
    Write-Host "EXPECTED (example): $contDir\<PROJECT_NAME>_CONTINUITY_LOG_v1.0.md"
    exit 21
}

# Detect placeholder naming

$placeholderLogs = @()

foreach ($f in $logs) {

    if (
        $f.Name -match "<PROJECT_NAME>" `
        -or $f.Name -match "PLACEHOLDER" `
        -or $f.Name -match "TBD" `
        -or $f.Name -match "UNNAMED"
    ) {

        $placeholderLogs += $f

    }

}

# If no placeholder logs, we consider name frozen enough for this check.
if ($placeholderLogs.Count -eq 0) {
    Write-Host "PASS: PROJECT_NAME_FROZEN (no placeholder continuity log detected)"
    exit 0
}

# We only enforce blocking if freeze triggers are detected.
# Triggers (A–D) are evaluated from repository observable evidence.

# ---------- Trigger A: External reference (not machine-detectable here reliably) ----------
# We won't auto-detect A in script; reserve for manual governance.
$triggerA = $false

# ---------- Trigger B: Release package exists ----------
$releaseDir = Join-Path $root "release\submission"
$triggerB = $false
if (Test-Path $releaseDir) {
    $packages = Get-ChildItem -Path $releaseDir -Directory -ErrorAction SilentlyContinue
    if ($packages -and $packages.Count -gt 0) { $triggerB = $true }
}

# ---------- Trigger C: Gate runs >= 2 ----------
$gateRunsDir = Join-Path $root "ops\gate\runs"
$triggerC = $false
if (Test-Path $gateRunsDir) {
    $runFiles = Get-ChildItem -Path $gateRunsDir -File -Filter "*__presubmission_gate_result__RUN-*.md" -ErrorAction SilentlyContinue
    if ($runFiles -and $runFiles.Count -ge 2) { $triggerC = $true }
}

# ---------- Trigger D: Time-based (7 days since Created or file creation time) ----------
# For placeholder log, parse "Created: YYYY-MM-DD" if present; else fallback to file creation time. (recommended improvement)
$triggerD = $false
$triggerDDetail = ""

# Evaluate D using the FIRST placeholder log (the active one by convention)
$active = $placeholderLogs | Sort-Object LastWriteTime -Descending | Select-Object -First 1
$content = Get-Content -Path $active.FullName -ErrorAction SilentlyContinue

$createdDate = $null
foreach ($line in $content) {
    if ($line -match "^\s*Created:\s*(\d{4}-\d{2}-\d{2})\s*$") {
        try { $createdDate = [datetime]::ParseExact($matches[1], "yyyy-MM-dd", $null) } catch {}
        break
    }
}

if ($createdDate -eq $null) {
    # fallback: file creation time
    $createdDate = $active.CreationTime
    $triggerDDetail = "Created field missing -> fallback to file CreationTime: $($active.CreationTime.ToString('yyyy-MM-ddTHH:mm:ss'))"
}

$days = (New-TimeSpan -Start $createdDate -End (Get-Date)).Days
if ($days -ge 7) {
    $triggerD = $true
    if ($triggerDDetail -eq "") { $triggerDDetail = "Created: $($createdDate.ToString('yyyy-MM-dd'))" }
}

# Decide trigger label
$triggerLabel = ""
if ($triggerA) { $triggerLabel = "A" }
elseif ($triggerB) { $triggerLabel = "B" }
elseif ($triggerC) { $triggerLabel = "C" }
elseif ($triggerD) { $triggerLabel = "D" }

# If no triggers detected, do NOT block; allow early stage placeholder.
if ($triggerLabel -eq "") {
    Write-Host "WARN: placeholder continuity log detected but no freeze triggers (A–D) detected."
    Write-Host "CONTINUITY_DIR: $contDir"
    Write-Host "PLACEHOLDER_LOG: $($active.FullName)"
    exit 0
}

# HARD BLOCK
Write-Host "CONTINUITY_DIR: $contDir"
Write-Host "PLACEHOLDER_LOG: $($active.FullName)"
Write-Host "TRIGGER_DETECTED: $triggerLabel"
if ($triggerLabel -eq "D" -and $triggerDDetail -ne "") {
    Write-Host "TRIGGER_D_DETAIL: $triggerDDetail"
}
Write-Error "BLOCKED: Project Name must be frozen before proceeding."
Write-Host "ACTION_REQUIRED: Rename continuity log file to <FINAL_PROJECT_NAME>_CONTINUITY_LOG_v1.0.md"
Write-Host "EXAMPLE_TARGET: $contDir\<FINAL_PROJECT_NAME>_CONTINUITY_LOG_v1.0.md"

exit 20
