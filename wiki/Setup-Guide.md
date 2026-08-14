# ⚙️ Setup Guide

Complete installation instructions for Windows, macOS, and Linux.

---

## Prerequisites

| Tool | Version | Link | Notes |
|------|---------|------|-------|
| **Claude Code** | Any (Pro recommended) | [claude.ai/code](https://claude.ai/code) | Works with Claude Opus 5 |
| **Python** | 3.8+ | [python.org](https://python.org) | Built-in standard library (zero external pip packages required) |
| **DeepSeek API Key** | Free account | [platform.deepseek.com/api_keys](https://platform.deepseek.com/api_keys) | Pay-per-use at fractions of a cent |

---

## 🚀 Installation

### macOS / Linux / WSL

```bash
# 1. Clone the repo
git clone https://github.com/joh3d/Claude-deepseek-bridge.git
cd Claude-deepseek-bridge

# 2. Run the installer
bash setup.sh
```

### Windows (Native PowerShell)

```powershell
# 1. Clone the repo
git clone https://github.com/joh3d/Claude-deepseek-bridge.git
cd Claude-deepseek-bridge

# 2. Run the PowerShell installer
.\setup.ps1
```

The installer automatically:
- ✅ Creates `.claude/commands/` directory
- ✅ Copies `/deepseek` and `/deepseek-pro` commands (+ Windows `.cmd` wrappers)
- ✅ Prompts for your DeepSeek API key
- ✅ Saves the key permanently in your shell config or Windows User Environment
- ✅ Generates the delegation system prompt in `.claude/settings.json`

---

## 🔄 After Installation

**Restart your terminal** or reload environment:
```bash
# macOS/Linux
source ~/.zshrc   # or source ~/.bashrc

# Windows PowerShell
$env:DEEPSEEK_API_KEY = "your-key-here"
```

Then launch Claude Code:
```bash
claude
```

---

## 🪟 Windows Setup Options

### Option A: PowerShell Installer (Recommended)
Open PowerShell in the repo directory and run:
```powershell
.\setup.ps1
```
The script configures `.claude/commands/`, installs Windows `.cmd` wrappers, sets your User Environment variable, and initializes `.claude/settings.json`.

### Option B: Git Bash / WSL
```bash
git clone https://github.com/joh3d/Claude-deepseek-bridge.git
cd Claude-deepseek-bridge
bash setup.sh
```

---

## 🖥 macOS & Linux Details

```bash
# Check Python version
python3 --version

# Run installer
bash setup.sh

# Reload shell
source ~/.zshrc   # (macOS zsh) or source ~/.bashrc (Linux bash)
```

---

## ✅ Verify Installation

```bash
claude
# In the Claude Code session:
/deepseek Say "Hello World" in Python
```

Expected output:
```python
# DeepSeek Flash responds in <1 second
print("Hello World")
```

---

## 🔄 Uninstall

```bash
# 1. Remove commands
rm -rf .claude/commands/

# 2. Reset settings (optional)
rm .claude/settings.json

# 3. Remove API key from shell config / environment
# In ~/.zshrc or ~/.bashrc, remove the line:
# export DEEPSEEK_API_KEY="..."
```

---

## ❌ Troubleshooting

| Problem | Solution |
|---------|----------|
| `python3 / python: command not found` | Install Python 3.8+ and ensure it is in your system `PATH`. |
| `DEEPSEEK_API_KEY not set` | Set `export DEEPSEEK_API_KEY="sk-..."` (Linux/macOS) or `$env:DEEPSEEK_API_KEY="sk-..."` (Windows). |
| `commands/ directory not found` | Make sure you are executing the setup script from the root of the repository. |
| `.claude/settings.json already exists` | The installer preserves your existing configuration. Check `.claude/settings.example.json` for new updates. |
