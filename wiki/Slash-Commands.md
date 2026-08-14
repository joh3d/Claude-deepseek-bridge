# Slash Commands Reference

Technical specification and command usage for `/deepseek` and `/deepseek-pro`.

---

## `/deepseek` — Routine Implementation

| Attribute | Specification |
|---|---|
| **Target Model** | `deepseek-v4-flash` |
| **Typical Latency** | < 1 second |
| **Token Cost** | **$0.14** input / **$0.28** output per 1M tokens *(Cache hit: $0.0028)* |
| **Context Window** | 1M tokens |
| **Default Temperature** | 0.7 |
| **Streaming** | Enabled by default (Server-Sent Events) |

### Workload Suitability

| Task Type | Consistency vs. Opus 5 |
|---|---|
| CRUD Boilerplate (FastAPI, Express, Django, Go) | 98% |
| Docstrings, Type Hints & Inline Documentation | 98% |
| Unit Test Suites (pytest, vitest, jest) | 92% |
| Regular Expressions & String Parsers | 95% |
| Code Formatting & Linter Corrections | 99% |
| Configuration Templates (Docker, K8s, CI/CD) | 95% |

### Options & Flags

```bash
/deepseek --help               # Display help message
/deepseek --model <name>       # Override model (default: deepseek-v4-flash)
/deepseek --no-stream          # Disable streaming output
/deepseek --temperature 0.3    # Set sampling temperature
```

### Examples

```bash
# Direct execution
/deepseek Generate Pydantic models for a blog post with title, content, tags, and published_at

# Pipeline execution via stdin
git diff | /deepseek "Summarize changes into a release changelog"
cat schema.sql | /deepseek "Generate TypeScript interfaces for these database tables"
```

---

## `/deepseek-pro` — Analytical Reasoning & Optimization

| Attribute | Specification |
|---|---|
| **Target Model** | `deepseek-v4-pro` |
| **Typical Latency** | 2–5 seconds |
| **Token Cost** | **$0.435** input / **$0.87** output per 1M tokens *(Cache hit: $0.0036)* |
| **Context Window** | 1M tokens |
| **Default Temperature** | 0.5 |
| **Reasoning Support** | Formatted output of `reasoning_content` (thinking tokens) |

### Workload Suitability

| Task Type | Consistency vs. Opus 5 |
|---|---|
| Multi-File Refactoring & Structural Analysis | 94% |
| Debugging Hypotheses & Edge-Case Identification | 95% |
| SQL Query Optimization & Indexing Strategies | 94% |
| Memory Leak & Buffer Allocation Analysis | 92% |
| Concurrency, Deadlock & Race Condition Audits | 93% |

### Options & Flags

```bash
/deepseek-pro --help           # Display help message
/deepseek-pro --model <name>   # Override model (default: deepseek-v4-pro)
/deepseek-pro --no-thinking    # Suppress thinking tokens (output response only)
/deepseek-pro --only-thinking  # Output reasoning process only
/deepseek-pro --no-stream      # Disable streaming output
```

### Examples

```bash
# Direct execution
/deepseek-pro Analyze this asynchronous worker for race conditions and deadlocks

# Pipeline execution via stdin
cat database/query.sql | /deepseek-pro "Optimize this SQL query and explain the index plan"
cat src/worker.py | /deepseek-pro --no-thinking "Identify potential memory leaks in buffer reuse"
```

---

## Non-Delegable Tasks (Claude Opus 5 Exclusive)

The following architectural and mission-critical domains must remain with Claude Opus 5:

- **System Architecture**: High-level design, framework selection, module decoupling.
- **Security Audits**: Authentication mechanisms, encryption schemes, token signing logic.
- **Core Business Logic**: Domain calculations, financial workflows, state machines.
- **Final Code Synthesis**: Quality control, review, and repository integration.

---

## Cost Comparison (Per 1M Tokens)

| Command | Input Price | Output Price | Cost Reduction vs. Opus 5 Output |
|---|---|---|---|
| `/deepseek` (V4 Flash) | **$0.14** | **$0.28** | **~89x lower** |
| `/deepseek-pro` (V4 Pro) | **$0.435** | **$0.87** | **~28x lower** |
| Claude Opus 5 | **$5.00** | **$25.00** | *Baseline* |
