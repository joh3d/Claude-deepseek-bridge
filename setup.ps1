# ============================================================
#  Claude-DeepSeek Bridge — Windows PowerShell Installer
#  Protects your Claude Pro subscription from the Wednesday wall.
# ============================================================

$ErrorActionPreference = "Stop"

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Host ""
Write-Host "================================================" -ForegroundColor Cyan
Write-Host "   Claude-DeepSeek Bridge -- Windows Setup      " -ForegroundColor Cyan
Write-Host "   Protect your Pro subscription.               " -ForegroundColor Cyan
Write-Host "================================================" -ForegroundColor Cyan
Write-Host ""

# --- Step 1: Create command directory ---
$claudeCommandsDir = Join-Path (Get-Location) ".claude\commands"
if (-not (Test-Path $claudeCommandsDir)) {
    New-Item -ItemType Directory -Path $claudeCommandsDir -Force | Out-Null
}
Write-Host "[+] Created .claude\commands\" -ForegroundColor Green

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
    Write-Host "[+] Installed /deepseek and /deepseek-pro commands with Windows wrappers" -ForegroundColor Green
} else {
    Write-Host "[-] Could not find commands\ directory. Are you in the repo root?" -ForegroundColor Red
    exit 1
}

# --- Step 3: Check Python ---
$pythonCmd = Get-Command python -ErrorAction SilentlyContinue
if (-not $pythonCmd) {
    $pythonCmd = Get-Command python3 -ErrorAction SilentlyContinue
}

if ($pythonCmd) {
    Write-Host "[+] Python detected: $($pythonCmd.Source)" -ForegroundColor Green
} else {
    Write-Host "[-] Python is required but not found in PATH. Please install Python 3.8+." -ForegroundColor Red
    exit 1
}

# --- Step 4: API Key ---
$currentApiKey = [Environment]::GetEnvironmentVariable("DEEPSEEK_API_KEY", "User")
if (-not $currentApiKey) {
    $currentApiKey = $env:DEEPSEEK_API_KEY
}

if (-not $currentApiKey) {
    Write-Host ""
    Write-Host "DeepSeek API Key" -ForegroundColor Yellow
    Write-Host "Get one at: https://platform.deepseek.com/api_keys"
    Write-Host "(Free account, pay-per-use at fractions of a cent.)"
    Write-Host ""
    $userKey = Read-Host "Paste your DeepSeek API key (or press enter to skip)"

    if ($userKey -and $userKey.Trim() -ne "") {
        $userKey = $userKey.Trim()
        [Environment]::SetEnvironmentVariable("DEEPSEEK_API_KEY", $userKey, "User")
        $env:DEEPSEEK_API_KEY = $userKey
        Write-Host "[+] DEEPSEEK_API_KEY saved to Windows User Environment" -ForegroundColor Green
    } else {
        Write-Host "[!] No key entered. Set it manually later in PowerShell via:" -ForegroundColor Yellow
        Write-Host "    `$env:DEEPSEEK_API_KEY = 'your-key-here'" -ForegroundColor DarkGray
    }
} else {
    Write-Host "[+] DeepSeek API key already configured" -ForegroundColor Green
}

# --- Step 5: System settings ---
$settingsFile = Join-Path (Get-Location) ".claude\settings.json"
$exampleSettings = Join-Path (Get-Location) ".claude\settings.example.json"

if (-not (Test-Path $settingsFile)) {
    if (Test-Path $exampleSettings) {
        Copy-Item $exampleSettings -Destination $settingsFile -Force
        Write-Host "[+] Created .claude\settings.json with delegation rules" -ForegroundColor Green
    }
} else {
    Write-Host "[!] .claude\settings.json already exists -- left untouched." -ForegroundColor Yellow
}

# --- Done ---
Write-Host ""
Write-Host "================================================" -ForegroundColor Green
Write-Host "   Setup complete!                              " -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Start Claude Code:  claude"
Write-Host "  2. Try:  /deepseek Write a Python function to validate email addresses"
Write-Host "  3. Try:  /deepseek-pro Analyze this code for race conditions"
Write-Host ""
Write-Host "Claude Opus 4.7 stays in charge. DeepSeek handles the grind." -ForegroundColor Cyan
Write-Host "Your Pro subscription just started lasting the whole week." -ForegroundColor Cyan
Write-Host ""
