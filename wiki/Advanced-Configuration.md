# 🔧 Advanced Configuration

Custom models, custom endpoints, API tuning, and environment configuration.

---

## 🎯 Model & Base URL Overrides

The Bridge supports standard environment variable overrides without modifying source code.

### Environment Variables

| Variable | Default | Purpose |
|---|---|---|
| `DEEPSEEK_API_KEY` | *(Required)* | Your API key from DeepSeek |
| `DEEPSEEK_BASE_URL` | `https://api.deepseek.com` | Custom endpoint (e.g. proxy, OpenRouter, or local) |
| `DEEPSEEK_MODEL` | `deepseek-v4-flash` | Model for `/deepseek` |
| `DEEPSEEK_PRO_MODEL` | `deepseek-v4-pro` | Model for `/deepseek-pro` |

---

## 🌐 Custom Endpoints & Alternative Providers

Any **OpenAI-compatible endpoint** can be used by setting `DEEPSEEK_BASE_URL` and `DEEPSEEK_MODEL`:

### Example: Local Ollama
```bash
export DEEPSEEK_BASE_URL="http://localhost:11434/v1"
export DEEPSEEK_MODEL="qwen2.5-coder"
export DEEPSEEK_PRO_MODEL="deepseek-r1:32b"
```

### Example: OpenRouter
```bash
export DEEPSEEK_BASE_URL="https://openrouter.ai/api/v1"
export DEEPSEEK_API_KEY="sk-or-v1-..."
export DEEPSEEK_MODEL="deepseek/deepseek-chat"
export DEEPSEEK_PRO_MODEL="deepseek/deepseek-r1"
```

---

## 🧠 Custom System Prompts

Edit `.claude/settings.json` or project-level `CLAUDE.md` to customize Claude's delegation behavior:

```json
{
  "systemPrompt": "You are Claude Opus 5, operating inside Claude Code. Your user has a Pro subscription..."
}
```

### Stricter Delegation Policy
Add these constraints to your system prompt:
```
- NEVER delegate authentication, encryption primitives, or financial calculations.
- Always run /deepseek-pro on multi-threaded or async event loop architectures.
- If /deepseek returns code with lint or typing errors, automatically fix it before presenting.
```

### Aggressive Token-Saving Policy
```
- Delegate ALL repetitive code, tests, and documentation to /deepseek.
- Claude Opus 5 reserves tokens strictly for system architecture and final review.
```

---

## ⚡ CLI Flags & Options

Both `/deepseek` and `/deepseek-pro` accept inline CLI flags:

```bash
# Override temperature
/deepseek -t 0.2 "Write strict deterministic regex"

# Disable real-time streaming
/deepseek --no-stream "Generate JSON schema"

# Manage reasoning output on Pro
/deepseek-pro --no-thinking "Review SQL index plan"
/deepseek-pro --only-thinking "Show only the reasoning tree"
```

---

## 📊 Quality & Performance Heuristics

| Model | Streaming Latency | Best Use |
|---|---|---|
| `deepseek-v4-flash` | < 0.5s First Token | Repetitive functions, test cases, JSON/YAML schemas |
| `deepseek-v4-pro` | 1–3s (Reasoning Phase) | Complex logic analysis, algorithmic refactors |
| `Claude Opus 5` | Full Reasoning | Core architecture, final reviews, synthesis |
