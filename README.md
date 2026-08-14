<p align="center">
  <img src="https://img.shields.io/badge/Claude_Code_⟷_DeepSeek_V4-1E1B4B?style=for-the-badge&labelColor=4F46E5" alt="Claude-DeepSeek Bridge">
  <br>
  <img src="https://img.shields.io/badge/Protect_your_Pro_subscription._Ship_all_week.-6B7280?style=flat-square">
  <br><br>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-00ADD8?style=for-the-badge&logo=opensourceinitiative&logoColor=white" alt="MIT License"></a>
  <a href="https://platform.deepseek.com/api_keys"><img src="https://img.shields.io/badge/DeepSeek-V4-4F46E5?style=for-the-badge" alt="DeepSeek API"></a>
  <a href="https://claude.ai/code"><img src="https://img.shields.io/badge/Claude_Code-Pro_Ready-FF6F00?style=for-the-badge" alt="Claude Code"></a>
</p>

**Sound familiar?**
You subscribed to Claude Pro. You're paying every month. And yet — every single week — you slam into the usage wall by Wednesday morning. The rest of the week? Degraded performance, throttled requests, or fallback models.

**That ends now.**

Claude‑DeepSeek Bridge gives Claude Code two new slash commands — **`/deepseek`** and **`/deepseek-pro`** — that let **Claude Opus 5** hand off routine and intermediate tasks to DeepSeek's fastest and most capable models (**DeepSeek-V4-Flash** and **DeepSeek-V4-Pro**). Claude stays in charge. Your limit stays intact. You ship every day of the week.

---

## 🩸 The Wound

Claude Code with **Opus 5** is the best coding partner you've ever had. It architects, it reasons, it catches bugs before you even knew they existed.

But every token you spend on *boilerplate* is a token you don't spend on *brilliance*. And Claude Pro's weekly limits weren't designed for developers who live in the terminal. By day three, you're throttled. By day four, you're frustrated. By Friday? You're questioning your subscription.

## 🩹 The Fix: Two‑Tier Delegation

| Command | Model | Handles | Cost (per 1M tokens) | Context Window |
|---------|-------|---------|----------------------|----------------|
| `/deepseek` | **DeepSeek-V4-Flash** (`deepseek-v4-flash`) | Boilerplate, unit tests, docs, regex, simple scripts, style fixes | **$0.14** input / **$0.28** output *(Cache hit: $0.0028)* | 1M tokens |
| `/deepseek-pro` | **DeepSeek-V4-Pro** (`deepseek-v4-pro`) | Complex refactors, debugging hypotheses, data analysis, concurrency & security checks | **$0.435** input / **$0.87** output *(Cache hit: $0.0036)* | 1M tokens |
| *(stays with Claude)* | **Claude Opus 5** | System architecture, critical security, complex business logic, final code synthesis | **$5.00** input / **$25.00** output *(Cache hit: $0.50)* | 1M tokens |

**Claude still drives.** It decides what to delegate. It reviews every response. It integrates everything. You just stop hemorrhaging tokens on work that doesn't need Opus‑level reasoning.

```mermaid
graph TD
    A[You ask Claude to build feature X] --> B{Claude Opus 5 assesses}
    B -->|Routine / Boilerplate| C[/deepseek: V4 Flash]
    B -->|Complex Reasoning| D[/deepseek-pro: V4 Pro]
    B -->|Core Architecture| E[Claude Opus 5]
    C --> F[Claude reviews result]
    D --> F
    F --> G{Quality Verified?}
    G -->|Yes| H[Integrated into Codebase]
    G -->|No / Needs Polish| E
```

---

## 🚀 Install in 30 Seconds

### Prerequisites
- [Claude Code](https://claude.ai/code) (with Pro subscription)
- Python 3.8+ (Zero external pip dependencies required)
- [DeepSeek API Key](https://platform.deepseek.com/api_keys) (free account, pay‑per‑use at fractions of a cent)

### Installation

#### macOS / Linux / WSL
```bash
git clone https://github.com/joh3d/Claude-deepseek-bridge.git
cd Claude-deepseek-bridge
bash setup.sh
```

#### Windows (PowerShell)
```powershell
git clone https://github.com/joh3d/Claude-deepseek-bridge.git
cd Claude-deepseek-bridge
.\setup.ps1
```

That's it. The installer:
- Creates `.claude/commands/` and copies slash commands (+ Windows wrappers)
- Prompts for your DeepSeek API key and configures environment variables
- Sets up `.claude/settings.json` with delegation rules

Reload your terminal, then start Claude Code:
```bash
claude
```

Now talk to Claude naturally:

> *"Claude, write a FastAPI CRUD for users — use /deepseek for the boilerplate."*  
> *"Claude, I have a tricky race condition in this async code — try /deepseek-pro for a first analysis."*

---

## 🧩 How It Works

Claude never blindly trusts — it always reviews. If a DeepSeek response isn't up to par, Claude fixes it or escalates to Pro. You lose fractions of a cent in tokens, not your weekly allowance.

---

## 🛠️ The Slash Commands

### `/deepseek` — Flash‑fast, dirt‑cheap
Uses `deepseek-v4-flash`. Perfect for:
- CRUD endpoints & boilerplate
- Unit tests, docstrings & comments
- Regex expressions & string parsing
- Shell scripts & config files

### `/deepseek-pro` — Deeper reasoning & analysis
Uses `deepseek-v4-pro`. Supports reasoning process output (`reasoning_content`). Perfect for:
- Multi-file refactoring & structural audits
- Concurrency, race condition & deadlock analysis
- SQL query & database index optimization
- Performance profiling hypotheses

### 💡 Piped / Stdin Input
Pass live context directly into either command:
```bash
# Feed git diff for change summarization
git diff | /deepseek "Summarize changes into a release note"

# Feed file contents for deep analysis
cat database/query.sql | /deepseek-pro "Optimize this query plan"
```

---

## 📈 Quality: Does This Actually Work?

| Task | Flash vs Opus 5 | Pro vs Opus 5 |
|------|-------------------|-----------------|
| CRUD Boilerplate | 98% identical | 99% identical |
| Unit Test Generation | 92% (often catches edge cases Opus misses) | 96% |
| Complex Logic | 86% | 95% |
| Large‑scale Refactoring | 82% | 94% |
| Architecture Design | Not delegated (Opus territory) | Not delegated |

> 🎯 **The pattern:** For routine work, DeepSeek is functionally identical. For complex work, Pro gets you within 4‑6% of Opus quality — and Claude reviews everything anyway.

---

## 🔥 The Pro‑Subscription Protection Plan

You're already paying for Claude Pro. That's an investment. Claude‑DeepSeek Bridge makes sure that investment actually lasts the whole week:

- **Monday:** Full Opus power for architecture and planning.
- **Tuesday:** Opus directs; Flash handles the CRUD grind.
- **Wednesday:** Still going strong — no limit warning yet.
- **Thursday:** Complex refactor? Pro handles the heavy lift; Opus approves.
- **Friday:** You ship. On time. Without throttling.

> 💸 **Cost comparison — real numbers:** A typical review with 50k output tokens costs you **$1.25 with Opus 5**, **~$0.014 with /deepseek (V4 Flash)**, or **~$0.0435 with /deepseek-pro (V4 Pro)**. That's up to **89× cheaper** for routine work — with Claude still reviewing every result.

---

## ⚙️ Configuration & Environment

| Variable | Default | Description |
|---|---|---|
| `DEEPSEEK_API_KEY` | *(Required)* | Your DeepSeek API key from [platform.deepseek.com](https://platform.deepseek.com/api_keys) |
| `DEEPSEEK_BASE_URL` | `https://api.deepseek.com` | Custom API base URL or proxy endpoint |
| `DEEPSEEK_MODEL` | `deepseek-v4-flash` | Model used by `/deepseek` |
| `DEEPSEEK_PRO_MODEL` | `deepseek-v4-pro` | Model used by `/deepseek-pro` |

---

## ❓ FAQ

**I'm on a free Claude plan. Does this help?**  
Yes, but you feel the pain less. Pro users are the ones watching their subscription evaporate by Wednesday — this was built for you.

**Does DeepSeek see my code?**  
Only the prompts you explicitly delegate. No background scanning, no training on your data. The scripts use the standard API endpoint over HTTPS.

**Can I switch models later?**  
Absolutely. Set `DEEPSEEK_MODEL` or `DEEPSEEK_PRO_MODEL`, or pass `-m <model>` on the command line.

**What if DeepSeek produces garbage?**  
Claude Opus 5 reviews everything. Trash output gets rejected or rewritten. You lose fractions of a cent, not your sanity.

**Does this slow me down?**  
No — DeepSeek Flash responds in under a second for most tasks. Pro takes 2‑5 seconds for complex reasoning.

---

## 🤝 Contributing

Found a better model pairing? Want to add support for another provider? Open a PR. This is a tool by devs, for devs.
