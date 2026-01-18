param(
    [string]$RunId = ""
)

# ============================================================
# RALPH Research OS
# PRE_SUBMISSION_GATE INVOKER (HARD-GATED)
# ============================================================

$root = "D:\Projects\MCP\ralph-open-spec"

function Print-ContinuityLogHint {
    $resolver = Join-Path $root "ops\continuity\resolve_continuity_log.ps1"
    if (Test-Path $resolver) {
        Write-Host "[RALPH OS] CONTINUITY_HINT:"
        powershell -ExecutionPolicy Bypass -File $resolver -RepoRoot $root
    } else {
        Write-Host "[RALPH OS] CONTINUITY_HINT: resolver not found -> $resolver"
        Write-Host "[RALPH OS] CONTINUITY_DIR_HINT: $(Join-Path $root 'spec\continuity')"
    }
}

# ------------------------------------------------------------
# [0] HARD BLOCK: Project Name Freeze Check (MANDATORY)
# ------------------------------------------------------------
$continuityCheck = Join-Path $root "ops\continuity\check_project_name_freeze.ps1"

if (!(Test-Path $continuityCheck)) {
    Write-Error "BLOCKED: Continuity name-freeze checker not found."
    Write-Error "Expected: $continuityCheck"
    Print-ContinuityLogHint
    exit 10
}

Write-Host "[RALPH OS] Checking Project Name Freeze..."
& $continuityCheck
if ($LASTEXITCODE -ne 0) {
    Write-Error "BLOCKED: Project Name is not frozen."
    Print-ContinuityLogHint
    exit 11
}

# ------------------------------------------------------------
# [1] Path definitions
# ------------------------------------------------------------
$gateDir = Join-Path $root "ops\gate\runs"
$runner  = Join-Path $root "ops\runner\run_gate_stub.ps1"

if (!(Test-Path $gateDir)) {
    New-Item -ItemType Directory -Path $gateDir | Out-Null
}

# ------------------------------------------------------------
# [2] RUN_ID auto allocation (RUN-XXX)
# ------------------------------------------------------------
if ([string]::IsNullOrWhiteSpace($RunId)) {
    $max = 0
    $files = Get-ChildItem `
        -Path $gateDir `
        -Filter "*__presubmission_gate_result__RUN-*.md" `
        -ErrorAction SilentlyContinue

    foreach ($f in $files) {
        if ($f.Name -match "__presubmission_gate_result__RUN-(\d+)\.md$") {
            $n = [int]$matches[1]
            if ($n -gt $max) { $max = $n }
        }
    }

    $next = $max + 1
    $RunId = "RUN-{0:D3}" -f $next
}

$today = Get-Date -Format "yyyy-MM-dd"

# ------------------------------------------------------------
# [3] HARD overwrite guard
# ------------------------------------------------------------
$preMdPath = Join-Path $gateDir "${today}__presubmission_gate_result__${RunId}.md"

if (Test-Path $preMdPath) {
    Write-Error "BLOCKED: artifact already exists -> $preMdPath"
    Print-ContinuityLogHint
    exit 2
}

# ------------------------------------------------------------
# [4] Invoke Runner
# ------------------------------------------------------------
Write-Host "MCP_TRIGGER: PRE_SUBMISSION_GATE"
Write-Host "RUN_ID: $RunId"
Write-Host "CALL: $runner"

powershell -ExecutionPolicy Bypass -File $runner -RunId $RunId

if ($LASTEXITCODE -ne 0) {
    Write-Error "BLOCKED: runner failed with exit code $LASTEXITCODE"
    Print-ContinuityLogHint
    exit 3
}

# ------------------------------------------------------------
# [5] HARD Gate: verify mandatory artifacts
# ------------------------------------------------------------
$preJsonPath   = Join-Path $gateDir "${today}__presubmission_check.json"
$postMdPath    = Join-Path $gateDir "${today}__postsubmission_gate_result__${RunId}.md"
$summaryMdPath = Join-Path $gateDir "${today}__run_summary__${RunId}.md"

$missing = @()
if (!(Test-Path $preJsonPath))   { $missing += $preJsonPath }
if (!(Test-Path $preMdPath))     { $missing += $preMdPath }
if (!(Test-Path $postMdPath))    { $missing += $postMdPath }
if (!(Test-Path $summaryMdPath)) { $missing += $summaryMdPath }

if ($missing.Count -gt 0) {
    Write-Error "BLOCKED: missing artifacts"
    $missing | ForEach-Object { Write-Host " - $_" }
    Print-ContinuityLogHint
    exit 4
}

# ------------------------------------------------------------
# [6] PASS
# ------------------------------------------------------------
Write-Host "PASS: PRE_SUBMISSION_GATE"
Write-Host "Artifacts:"
Write-Host " - $preJsonPath"
Write-Host " - $preMdPath"
Write-Host " - $postMdPath"
Write-Host " - $summaryMdPath"

exit 0
