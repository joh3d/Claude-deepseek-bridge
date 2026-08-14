# Claude Code Guidelines: Claude-DeepSeek Bridge

This repository provides slash command extensions (`/deepseek` and `/deepseek-pro`) for Claude Code to load-balance token consumption between Claude Opus 4.7 and DeepSeek models.

## 🎯 Primary Objective
Protect the user's Claude Pro subscription limit by delegating routine boilerplate, unit tests, and reasoning-heavy intermediate tasks to DeepSeek, while reserving Claude Opus 4.7 for system architecture, critical security, and final review.

---

## ⚡ Delegation Heuristics

| Model | Command | Best Suited Tasks | Cost Efficiency |
|---|---|---|---|
| **DeepSeek Flash** | `/deepseek` | CRUD endpoints, docstrings, boilerplate, regex, unit test mocks, formatting, basic scripts | ~100x cheaper than Opus |
| **DeepSeek Pro** | `/deepseek-pro` | Complex refactoring, concurrency analysis, deep bug hunting, SQL optimization | ~35x cheaper than Opus |
| **Claude Opus 4.7** | *(stays with Claude)* | High-level system architecture, core business logic, critical security audits, final code review | Premium reasoning & synthesis |

---

## 🛠️ Command Usage & Examples

- **Direct Prompting**:
  ```bash
  /deepseek Write a FastAPI router for user authentication with JWT.
  ```
- **Reasoning Prompting**:
  ```bash
  /deepseek-pro Analyze the race conditions in this asynchronous event loop handler.
  ```
- **Context via Pipe / Stdin**:
  ```bash
  git diff | /deepseek "Write concise release notes based on these changes"
  cat src/engine.py | /deepseek-pro "Identify memory leak possibilities in buffer allocation"
  ```

---

## ⚙️ Configuration & Environment

- `DEEPSEEK_API_KEY`: API key for DeepSeek (`https://platform.deepseek.com/api_keys`).
- `DEEPSEEK_BASE_URL`: Optional custom base URL (default: `https://api.deepseek.com`).
- `DEEPSEEK_MODEL`: Model name for `/deepseek` (default: `deepseek-v4-flash`).
- `DEEPSEEK_PRO_MODEL`: Model name for `/deepseek-pro` (default: `deepseek-v4-pro`).

---

## 🔒 Quality Control Principle
Claude Opus 4.7 must review, sanitize, and verify all output returned from DeepSeek commands before finalizing changes or presenting them to the user.
