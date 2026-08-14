# Advanced Configuration

Custom endpoints, model overrides, API tuning, and delegation policies.

---

## Model & Endpoint Overrides

Environment variables allow modifying models and API endpoints without altering script source code.

### Environment Variables

| Variable | Default | Description |
|---|---|---|
| `DEEPSEEK_API_KEY` | *(Required)* | API key for authentication |
| `DEEPSEEK_BASE_URL` | `https://api.deepseek.com` | Base URL for API requests |
| `DEEPSEEK_MODEL` | `deepseek-v4-flash` | Model identifier for `/deepseek` |
| `DEEPSEEK_PRO_MODEL` | `deepseek-v4-pro` | Model identifier for `/deepseek-pro` |

---

## Alternative Providers & Local Models

Any **OpenAI-compatible API endpoint** can be used by configuring `DEEPSEEK_BASE_URL` and `DEEPSEEK_MODEL`.

### Local Ollama
```bash
export DEEPSEEK_BASE_URL="http://localhost:11434/v1"
export DEEPSEEK_MODEL="qwen2.5-coder"
export DEEPSEEK_PRO_MODEL="deepseek-r1:32b"
```

### OpenRouter
```bash
export DEEPSEEK_BASE_URL="https://openrouter.ai/api/v1"
export DEEPSEEK_API_KEY="sk-or-v1-..."
export DEEPSEEK_MODEL="deepseek/deepseek-chat"
export DEEPSEEK_PRO_MODEL="deepseek/deepseek-r1"
```

---

## System Prompt Customization

Modify `.claude/settings.json` or workspace `CLAUDE.md` to calibrate Claude's delegation behavior:

```json
{
  "systemPrompt": "You are Claude Opus 5, operating inside Claude Code. Your user has a Claude Pro subscription..."
}
```

### Strict Delegation Policy
Enforce explicit constraints:
```
- Do not delegate cryptographic primitives, authentication middleware, or payment transactions.
- Run /deepseek-pro on multi-threaded or asynchronous code before finalizing.
- Verify syntax and linter compliance on all delegated responses before presenting to the user.
```

### High-Efficiency Token Policy
```
- Delegate all repetitive boilerplate, unit tests, and documentation generation to /deepseek.
- Reserve Claude Opus 5 token allocation strictly for architecture, integration, and final review.
```

---

## Command Flags & Invocation Options

Both `/deepseek` and `/deepseek-pro` support CLI flags:

```bash
# Set sampling temperature
/deepseek -t 0.2 "Write a strict regular expression for ISO-8601 dates"

# Disable streaming output
/deepseek --no-stream "Generate JSON schema definitions"

# Manage reasoning output on Pro
/deepseek-pro --no-thinking "Review database index strategy"
/deepseek-pro --only-thinking "Output reasoning tree only"
```

---

## Runtime Performance Profiles

| Model | Streaming Latency | Workload Domain |
|---|---|---|
| `deepseek-v4-flash` | < 0.5s First Token | Repetitive functions, test suites, schemas |
| `deepseek-v4-pro` | 1–3s (Reasoning Phase) | Architectural analysis, query optimization |
| `Claude Opus 5` | Full Synthesis | System architecture, critical review, integration |
