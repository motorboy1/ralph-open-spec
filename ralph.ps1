<#
RALPH Research OS — Execution Bootstrap

Purpose:
- Create a mandatory run context for any executable task
- Optionally execute MCP pipeline within run context

Usage:
.\ralph.ps1 run <task-name>
.\ralph.ps1 run-with-mcp <task-name>
.\ralph.ps1 status
#>

param (
    [Parameter(Mandatory=$true)]
    [ValidateSet("run","run-with-mcp","status")]
    [string]$Mode,

    [Parameter(Mandatory=$false)]
    [string]$TaskName
)

# ---- STATUS: read-only / NO RUN CREATION ---------------------

if ($Mode -eq "status") {

    Write-Host ""
    Write-Host "[RALPH] STATUS CHECK" -ForegroundColor Cyan
    Write-Host "------------------------------"

    Write-Host "Cursor rules (.cursorrules): " -NoNewline
    Write-Host (Test-Path ".cursorrules")

    Write-Host "Cursor folder (.cursor/):   " -NoNewline
    Write-Host (Test-Path ".cursor")

    Write-Host "Snippets (.cursor/snippets/): " -NoNewline
    Write-Host (Test-Path ".cursor\snippets")

    Write-Host ""

    Write-Host "Option ① Cursor-Free:        AVAILABLE"
    Write-Host "Option ② RALPH-RUN:          AVAILABLE"
    Write-Host "Option ③ RALPH-RUN+MCP:      AVAILABLE"

    Write-Host "Option ④ AUTONOMOUS:         DECLARED (LOCKED)" -ForegroundColor DarkGray

    Write-Host "  └─ LOCK REASON:"
    Write-Host "     - Budget / cost ceiling not defined"
    Write-Host "     - Kill-switch & watchdog not implemented"
    Write-Host "     - Sandbox isolation not enforced"
    Write-Host "     - PR-only write path not guaranteed"
    Write-Host "     - Incident & rollback drill not validated"

    Write-Host "  └─ UNLOCK REQUIRES:"
    Write-Host "     - Budget + rate limits published"
    Write-Host "     - Kill-switch & watchdog active"
    Write-Host "     - Isolated execution (repo/worktree)"
    Write-Host "     - PR-only CI enforced"
    Write-Host "     - Rollback drill passed"

    Write-Host ""
    Write-Host "[RALPH] STATUS CHECK COMPLETE"

    exit 0
}


# ---- Guard (run modes only) ----------------------------------
if (-not $TaskName -or $TaskName.Trim() -eq "") {
    Write-Host "[RALPH] ERROR: TaskName is required." -ForegroundColor Red
    exit 1
}

# ---- Context ------------------------------------------------
$Root = Get-Location
$Date = Get-Date -Format "yyyy-MM-dd"
$RunId = "${Date}__${TaskName}"
$RunBase = Join-Path $Root "spec\execution\agentic\runs"
$RunDir  = Join-Path $RunBase $RunId

# ---- Create Run ---------------------------------------------
if (Test-Path $RunDir) {
    Write-Host "[RALPH] Run already exists: $RunId" -ForegroundColor Yellow
} else {
    New-Item -ItemType Directory -Path $RunDir | Out-Null
    Write-Host "[RALPH] Created run: $RunId" -ForegroundColor Green
}

# ---- Scaffolding --------------------------------------------
$Files = @{
    "00_INTAKE.md"  = "# Intake`n`n## Goal`n- `n`n## Constraints`n- "
    "01_PLAN.md"    = "# Plan`n`n## Steps`n- "
    "02_EXECUTE.md" = "# Execute`n`n## Actions`n- "
    "03_VALIDATE.md"= "# Validate`n`n## Result`n- PENDING`n"
    "04_RECORD.md"  = "# Record`n`n## Summary`n- `n`n## Final Decision`n- `n`n## Commit Message`n- "
}

foreach ($File in $Files.Keys) {
    $Path = Join-Path $RunDir $File
    if (-not (Test-Path $Path)) {
        $Files[$File] | Out-File -FilePath $Path -Encoding utf8
        Write-Host "  + $File"
    }
}

# ---- Mode: run ----------------------------------------------
if ($Mode -eq "run") {

    Write-Host ""
    Write-Host "[RALPH] Run context ready (mode: run)." -ForegroundColor Cyan
    Write-Host "Location: $RunDir"
    Write-Host "Next: Open 00_INTAKE.md and define the task goal."
    exit 0
}

# ---- Mode: run-with-mcp -------------------------------------
if ($Mode -eq "run-with-mcp") {

    Write-Host ""
    Write-Host "[RALPH] Run-with-MCP mode activated." -ForegroundColor Cyan

    $OutputsDir = Join-Path $RunDir "outputs"
    if (-not (Test-Path $OutputsDir)) {
        New-Item -ItemType Directory -Path $OutputsDir | Out-Null
        Write-Host "  + outputs/"
    }

    $GateScript = Join-Path $Root "ops\mcp\runtime\invoke_presubmission_gate.ps1"
    $GateLog    = Join-Path $OutputsDir "mcp_gate.log"

    if (-not (Test-Path $GateScript)) {
        Write-Host "[RALPH] ERROR: Missing MCP gate script." -ForegroundColor Red
        Write-Host "Expected: $GateScript"
        exit 1
    }

    Write-Host "[RALPH] Executing MCP gate..." -ForegroundColor Cyan
    & $GateScript *>&1 | Tee-Object -FilePath $GateLog

    if (-not (Test-Path $GateLog)) {
        Write-Host "[RALPH] FAIL: MCP gate produced no output." -ForegroundColor Red
        exit 1
    }

    Write-Host "[RALPH] MCP gate completed. Output captured." -ForegroundColor Green
    Write-Host "Outputs: $GateLog"
    Write-Host ""
    Write-Host "[RALPH] Run-with-MCP completed successfully." -ForegroundColor Green
    exit 0
}
