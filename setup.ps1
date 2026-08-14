# ============================================================
# Claude-DeepSeek Bridge - Windows PowerShell Installer
# ============================================================

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "Claude-DeepSeek Bridge - Windows Setup" -ForegroundColor Cyan
Write-Host "----------------------------------------" -ForegroundColor Cyan

# --- Step 1: Create command directory ---
$claudeCommandsDir = Join-Path (Get-Location) ".claude\commands"
if (-not (Test-Path $claudeCommandsDir)) {
    New-Item -ItemType Directory -Path $claudeCommandsDir -Force | Out-Null
}
Write-Host "[OK] Initialized .claude\commands\" -ForegroundColor Green

# --- Step 2: Copy slash commands and wrappers ---
$sourceDir = Join-Path (Get-Location) "commands"
if (Test-Path $sourceDir) {
    Copy-Item (Join-Path $sourceDir "deepseek") -Destination (Join-Path $claudeCommandsDir "deepseek") -Force
    Copy-Item (Join-Path $sourceDir "deepseek-pro") -Destination (Join-Path $claudeCommandsDir "deepseek-pro") -Force
    if (Test-Path (Join-Path $sourceDir "deepseek.cmd")) {
        Copy-Item (Join-Path $sourceDir "deepseek.cmd") -Destination (Join-Path $claudeCommandsDir "deepseek.cmd") -Force
    }
    if (Test-Path (Join-Path $sourceDir "deepseek-pro.cmd")) {
        Copy-Item (Join-Path $sourceDir "deepseek-pro.cmd") -Destination (Join-Path $claudeCommandsDir "deepseek-pro.cmd") -Force
    }
    Write-Host "[OK] Installed /deepseek and /deepseek-pro commands with Windows wrappers" -ForegroundColor Green
} else {
    Write-Host "[ERROR] Directory commands\ not found. Ensure execution from repository root." -ForegroundColor Red
    exit 1
}

# --- Step 3: Check Python ---
$pythonCmd = Get-Command python -ErrorAction SilentlyContinue
if (-not $pythonCmd) {
    $pythonCmd = Get-Command python3 -ErrorAction SilentlyContinue
}

if ($pythonCmd) {
    Write-Host "[OK] Python runtime detected: $($pythonCmd.Source)" -ForegroundColor Green
} else {
    Write-Host "[ERROR] Python is required but not found in PATH. Please install Python 3.8+." -ForegroundColor Red
    exit 1
}

# --- Step 4: API Key ---
$currentApiKey = [Environment]::GetEnvironmentVariable("DEEPSEEK_API_KEY", "User")
if (-not $currentApiKey) {
    $currentApiKey = $env:DEEPSEEK_API_KEY
}

if (-not $currentApiKey) {
    Write-Host ""
    Write-Host "DeepSeek API Key Configuration"
    Write-Host "Obtain key at: https://platform.deepseek.com/api_keys"
    Write-Host ""
    $userKey = Read-Host "Enter DeepSeek API key (or leave blank to configure later)"

    if ($userKey -and $userKey.Trim() -ne "") {
        $userKey = $userKey.Trim()
        [Environment]::SetEnvironmentVariable("DEEPSEEK_API_KEY", $userKey, "User")
        $env:DEEPSEEK_API_KEY = $userKey
        Write-Host "[OK] DEEPSEEK_API_KEY persisted to Windows User Environment" -ForegroundColor Green
    } else {
        Write-Host "[INFO] No key entered. Set manually in PowerShell via:" -ForegroundColor Yellow
        Write-Host "    `$env:DEEPSEEK_API_KEY = '<key>'" -ForegroundColor DarkGray
    }
} else {
    Write-Host "[OK] DEEPSEEK_API_KEY already configured" -ForegroundColor Green
}

# --- Step 5: System settings ---
$settingsFile = Join-Path (Get-Location) ".claude\settings.json"
$exampleSettings = Join-Path (Get-Location) ".claude\settings.example.json"

if (-not (Test-Path $settingsFile)) {
    if (Test-Path $exampleSettings) {
        Copy-Item $exampleSettings -Destination $settingsFile -Force
        Write-Host "[OK] Initialized .claude\settings.json" -ForegroundColor Green
    }
} else {
    Write-Host "[INFO] .claude\settings.json exists (preserved)" -ForegroundColor Yellow
}

# --- Step 6: Summary ---
Write-Host ""
Write-Host "[OK] Setup completed successfully." -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Run Claude:  claude"
Write-Host "  2. Usage:       /deepseek [prompt]"
Write-Host "                  /deepseek-pro [complex prompt]"
Write-Host ""
