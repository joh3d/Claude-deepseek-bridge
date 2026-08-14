# Claude-DeepSeek Bridge Wiki

Documentation and technical reference for the Claude-DeepSeek Bridge.

---

## Overview

Claude-DeepSeek Bridge provides two slash commands — `/deepseek` and `/deepseek-pro` — to delegate routine and intermediate coding tasks to DeepSeek models (**DeepSeek-V4-Flash** and **DeepSeek-V4-Pro**). **Claude Opus 5** remains the primary orchestrator, maintaining code quality and preserving weekly rate limits on Claude Pro subscriptions.

```
User:     "Claude, build a FastAPI CRUD endpoint for user management"
Claude:   "Delegating boilerplate to /deepseek to preserve Opus 5 tokens."
          [DeepSeek-V4-Flash generates router, models, and schemas]
Claude:   [Reviews, validates, and integrates code into workspace]
```

---

## Documentation Index

| Document | Description |
|---|---|
| **[Home](Home)** | Overview and introduction |
| **[Setup Guide](Setup-Guide)** | Installation on macOS, Linux, and Windows (PowerShell / WSL) |
| **[Slash Commands](Slash-Commands)** | Detailed reference for `/deepseek` and `/deepseek-pro` |
| **[Usage Examples](Usage-Examples)** | Production use cases, prompt patterns, and pipeline examples |
| **[Advanced Configuration](Advanced-Configuration)** | Custom endpoints, model overrides, and system prompt tuning |

---

## Architecture Principles

- **Routine Implementation** (CRUD, unit tests, docstrings, regex) -> `/deepseek` (**$0.14** in / **$0.28** out per 1M tokens)
- **Intermediate Reasoning** (Refactoring, query optimization, debugging) -> `/deepseek-pro` (**$0.435** in / **$0.87** out per 1M tokens)
- **Critical Logic & Architecture** (System design, security, final review) -> **Claude Opus 5** (**$5.00** in / **$25.00** out per 1M tokens)

---

## Quick Start

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

Launch Claude Code:
```bash
claude
```

Execute slash commands:
```
/deepseek Write a Python function for email validation
/deepseek-pro Analyze this async worker for race conditions
```
