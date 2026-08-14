# Claude Code Configuration: Claude-DeepSeek Bridge

This repository provides slash command extensions (`/deepseek` and `/deepseek-pro`) for Claude Code to load-balance token consumption between Claude Opus 5 and DeepSeek models (**DeepSeek-V4-Flash** and **DeepSeek-V4-Pro**).

## Objective
Preserve Claude Pro subscription rate limits by delegating routine boilerplate, unit tests, and intermediate reasoning tasks to DeepSeek models, while retaining Claude Opus 5 for system architecture, critical security logic, and final code synthesis.

---

## Delegation Heuristics

| Model | Command | Target Workload | Cost Efficiency |
|---|---|---|---|
| **DeepSeek-V4-Flash** | `/deepseek` | CRUD endpoints, docstrings, boilerplate, regex, unit test suites, style formatting, basic scripts | ~89x lower cost vs. Opus 5 |
| **DeepSeek-V4-Pro** | `/deepseek-pro` | Multi-file refactoring, concurrency analysis, deep bug investigation, SQL query optimization | ~28x lower cost vs. Opus 5 |
| **Claude Opus 5** | *(Claude Native)* | High-level system architecture, core business logic, critical security audits, final code review | Premium reasoning & verification |

---

## Command Usage & Examples

- **Direct Execution**:
  ```bash
  /deepseek Write a FastAPI router for user authentication with JWT.
  ```
- **Analytical Reasoning**:
  ```bash
  /deepseek-pro Analyze the race conditions in this asynchronous event loop handler.
  ```
- **Context via Pipeline / Stdin**:
  ```bash
  git diff | /deepseek "Write concise release notes based on these changes"
  cat src/engine.py | /deepseek-pro "Identify memory leak risks in buffer allocations"
  ```

---

## Configuration & Environment

- `DEEPSEEK_API_KEY`: API access key for DeepSeek (`https://platform.deepseek.com/api_keys`).
- `DEEPSEEK_BASE_URL`: Optional custom base URL (default: `https://api.deepseek.com`).
- `DEEPSEEK_MODEL`: Model identifier for `/deepseek` (default: `deepseek-v4-flash`).
- `DEEPSEEK_PRO_MODEL`: Model identifier for `/deepseek-pro` (default: `deepseek-v4-pro`).

---

## Quality Control Policy
Claude Opus 5 must review, sanitize, and verify all output returned from DeepSeek commands before finalizing changes or presenting them to the user.
