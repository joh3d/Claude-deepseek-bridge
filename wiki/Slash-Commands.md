# 🛠️ Slash Commands

Complete reference for `/deepseek` and `/deepseek-pro`.

---

## `/deepseek` — Flash-Fast, Dirt-Cheap

| Property | Value |
|----------|-------|
| **Model** | `deepseek-v4-flash` (DeepSeek-V4-Flash) |
| **Latency** | < 1 second |
| **Cost** | **$0.14** input / **$0.28** output per 1M tokens *(Cache hit: $0.0028)* |
| **Context Window** | 1M tokens |
| **Timeout** | 60 seconds |
| **Temperature** | 0.7 (default) |
| **Streaming** | Enabled by default (real-time SSE) |

### Best For

| Task | Quality vs Opus 5 |
|------|-------------------|
| CRUD Boilerplate (FastAPI, Django, Express, Go) | 98% |
| Docstrings, Typing & Code Comments | 98% |
| Unit Tests (pytest, vitest, jest, go test) | 92% |
| Regex Patterns & String Parsing | 95% |
| Style Formatting & Lint Fixes | 99% |
| Config Files (Docker, CI/CD, K8s, YAML) | 95% |
| First Code Drafts & Mock Data | 95% |

### Options & Flags

```bash
/deepseek --help               # Show usage & options
/deepseek --model <name>       # Override model (default: deepseek-v4-flash)
/deepseek --no-stream          # Disable token-by-token streaming
/deepseek --temperature 0.3    # Set sampling temperature
```

### Direct & Piped Examples

```bash
# Direct prompt
/deepseek Generate Pydantic models for a blog post with title, content, tags, and published_at

# Piped stdin input
git diff | /deepseek "Summarize changes into a release changelog"
cat schema.sql | /deepseek "Generate TypeScript interfaces for these tables"
```

---

## `/deepseek-pro` — Deeper Reasoning, High Performance

| Property | Value |
|----------|-------|
| **Model** | `deepseek-v4-pro` (DeepSeek-V4-Pro) |
| **Latency** | 2–5 seconds |
| **Cost** | **$0.435** input / **$0.87** output per 1M tokens *(Cache hit: $0.0036)* |
| **Context Window** | 1M tokens |
| **Timeout** | 120 seconds |
| **Temperature** | 0.5 (default) |
| **Reasoning Support** | Formatted output of `reasoning_content` (thinking tokens) |

### Best For

| Task | Quality vs Opus 5 |
|------|-------------------|
| Multi-file Refactoring & Structural Audits | 94% |
| Debugging Hypotheses & Edge Cases | 95% |
| SQL Query Optimization & Indexing | 94% |
| Data Pipeline & Memory Bottlenecks | 92% |
| Concurrency, Race Condition & Deadlock Checks | 93% |
| Performance Profiling & Algorithmic Optimization | 93% |

### Options & Flags

```bash
/deepseek-pro --help           # Show usage & options
/deepseek-pro --model <name>   # Override model (default: deepseek-v4-pro)
/deepseek-pro --no-thinking    # Hide thinking tokens (show final answer only)
/deepseek-pro --only-thinking  # Show reasoning process only
/deepseek-pro --no-stream      # Disable token streaming
```

### Direct & Piped Examples

```bash
# Direct prompt
/deepseek-pro Analyze this async code for race conditions and deadlocks

# Piped stdin input
cat database/query.sql | /deepseek-pro "Optimize this query and explain the execution plan"
cat src/worker.py | /deepseek-pro --no-thinking "Find potential memory leaks in buffer reuse"
```

---

## 🚫 What Stays with Claude Opus 5

These high-value tasks are **never** delegated:

- **System Architecture & Design** – tech stack choices, core modularity, API boundaries
- **Critical Security Audits** – authentication, token signing, cryptographic primitives
- **Core Business Logic** – complex financial, domain, or state invariants
- **Final Code Review & Synthesis** – quality control before commit/merge

---

## 💰 Cost Comparison (Per 1M Tokens)

| Command | Input (1M) | Output (1M) | Savings vs Opus 5 Output |
|---|---|---|---|
| `/deepseek` (V4 Flash) | **$0.14** | **$0.28** | **~89× cheaper** |
| `/deepseek-pro` (V4 Pro) | **$0.435** | **$0.87** | **~28× cheaper** |
| Claude Opus 5 | **$5.00** | **$25.00** | *Baseline* |
