# 🧠 Claude‑DeepSeek Bridge Wiki

Welcome to the official wiki! Everything you need to know about installation, configuration, and getting the most out of your Claude Pro subscription protection.

---

## 🚀 Overview

Claude‑DeepSeek Bridge gives Claude Code two powerful slash commands — **`/deepseek`** and **`/deepseek-pro`** — that delegate routine and intermediate tasks to DeepSeek's fastest and most capable models (**DeepSeek-V4-Flash** and **DeepSeek-V4-Pro**). **Claude Opus 5** stays in charge, your token limit stays intact, and you ship **all week long** at top performance.

```
You:      "Claude, build me a FastAPI CRUD"
Claude:   "Delegating to /deepseek — saving your Opus 5 tokens."
          [DeepSeek-V4-Flash delivers boilerplate in <1s]
Claude:   [Reviews & Synthesizes]  "Clean. Integrated."
```

---

## 📑 Pages

| Page | Content |
|------|---------|
| 🏠 **[Home](Home)** | You are here |
| ⚙️ **[Setup Guide](Setup-Guide)** | Full installation walkthrough (macOS, Linux, Windows PowerShell / WSL) |
| 🛠️ **[Slash Commands](Slash-Commands)** | `/deepseek` & `/deepseek-pro` complete reference |
| 💡 **[Usage Examples](Usage-Examples)** | Real-world use cases, prompts, and piping examples |
| 🔧 **[Advanced Configuration](Advanced-Configuration)** | Custom models, custom endpoints, API tuning, and system prompts |

---

## 🔥 The Idea

You pay for Claude Pro. Yet you still hit the wall every Wednesday. This tool ensures that:

- **Routine work** (CRUD, tests, docstrings, regex) → `/deepseek` (**$0.14** in / **$0.28** out per 1M tokens)
- **Intermediate tasks** (refactoring, debugging, SQL) → `/deepseek-pro` (**$0.435** in / **$0.87** out per 1M tokens)
- **Critical work** (architecture, security, review) → stays with **Claude Opus 5** (**$5.00** in / **$25.00** out per 1M tokens)

**You don't downgrade. You load-balance.** 🚀

---

## 🩸 Quick Start

### macOS / Linux / WSL
```bash
git clone https://github.com/joh3d/Claude-deepseek-bridge.git
cd Claude-deepseek-bridge
bash setup.sh
```

### Windows (PowerShell)
```powershell
git clone https://github.com/joh3d/Claude-deepseek-bridge.git
cd Claude-deepseek-bridge
.\setup.ps1
```

Then start Claude Code:
```bash
claude
```

And talk to Claude naturally:
```
/deepseek Write a Python function for email validation
/deepseek-pro Analyze this code for race conditions
```
