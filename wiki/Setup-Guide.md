# Setup Guide

Complete installation and environment configuration for macOS, Linux, and Windows.

---

## Prerequisites

| Component | Minimum Version | Reference | Notes |
|---|---|---|---|
| **Claude Code** | Latest | [claude.ai/code](https://claude.ai/code) | Compatible with Claude Opus 5 |
| **Python** | 3.8+ | [python.org](https://python.org) | Uses built-in standard library (no pip packages required) |
| **DeepSeek API Key** | Active account | [platform.deepseek.com/api_keys](https://platform.deepseek.com/api_keys) | Pay-per-use API access |

---

## Installation

### macOS / Linux / WSL

```bash
# 1. Clone repository
git clone https://github.com/joh3d/Claude-deepseek-bridge.git
cd Claude-deepseek-bridge

# 2. Run installer
bash setup.sh
```

### Windows (Native PowerShell)

```powershell
# 1. Clone repository
git clone https://github.com/joh3d/Claude-deepseek-bridge.git
cd Claude-deepseek-bridge

# 2. Run PowerShell installer
.\setup.ps1
```

The installer automatically:
- Initializes the `.claude/commands/` directory.
- Deploys `/deepseek` and `/deepseek-pro` executable commands along with Windows `.cmd` wrappers.
- Prompts for `DEEPSEEK_API_KEY` and configures environment persistence.
- Initializes `.claude/settings.json` with delegation rules.

---

## Post-Installation Setup

Reload your terminal session:
```bash
# macOS/Linux (zsh / bash)
source ~/.zshrc   # or source ~/.bashrc

# Windows PowerShell
$env:DEEPSEEK_API_KEY = "your-key-here"
```

Start Claude Code:
```bash
claude
```

---

## Windows Installation Options

### Option A: PowerShell Installer (Recommended)
Run the automated installer script:
```powershell
.\setup.ps1
```

### Option B: Git Bash / WSL
Execute via standard bash shell:
```bash
bash setup.sh
```

---

## Verification

Launch Claude Code and test command delegation:
```bash
claude
# In session:
/deepseek Implement a Python function for URL slug generation
```

---

## Uninstallation

```bash
# Remove installed commands
rm -rf .claude/commands/

# Remove local settings (optional)
rm -f .claude/settings.json

# Remove environment variable from shell config
# Delete 'export DEEPSEEK_API_KEY=...' from ~/.zshrc or ~/.bashrc
```

---

## Troubleshooting

| Issue | Resolution |
|---|---|
| `python3 / python: command not found` | Install Python 3.8+ and verify it is available in system `PATH`. |
| `DEEPSEEK_API_KEY not set` | Configure `export DEEPSEEK_API_KEY="sk-..."` (Unix) or `$env:DEEPSEEK_API_KEY="sk-..."` (PowerShell). |
| `commands/ directory not found` | Ensure script execution originates from repository root. |
| `.claude/settings.json already exists` | Existing configuration is preserved; merge updates manually from `.claude/settings.example.json`. |
