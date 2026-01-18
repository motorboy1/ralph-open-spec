param(
  [string]$RepoRoot = "D:\Projects\MCP\ralph-open-spec"
)

function Find-ContinuityLog {
  param([string]$Root)

  $primary = Join-Path $Root "spec\continuity"
  $candidates = @()

  if (Test-Path $primary) {
    $candidates += Get-ChildItem -Path $primary -Filter "*_CONTINUITY_LOG_v1.0.md" -File -ErrorAction SilentlyContinue
  }

  if ($candidates.Count -eq 0) {
    $candidates += Get-ChildItem -Path $Root -Recurse -Filter "*_CONTINUITY_LOG_v1.0.md" -File -ErrorAction SilentlyContinue
  }

  if ($candidates.Count -eq 0) { return $null }

  # 가장 최근 수정 파일 우선
  return ($candidates | Sort-Object LastWriteTime -Descending | Select-Object -First 1).FullName
}

$log = Find-ContinuityLog -Root $RepoRoot

if ($null -eq $log) {
  Write-Host "CONTINUITY_LOG: NOT_FOUND"
  Write-Host "CONTINUITY_DIR_HINT: $(Join-Path $RepoRoot 'spec\continuity')"
  exit 0
}

Write-Host "CONTINUITY_LOG: $log"
exit 0
