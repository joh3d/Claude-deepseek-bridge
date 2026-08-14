# 💡 Usage Examples

Real-world use cases — copy, paste, and ship.

---

## 🐍 Python / FastAPI

### CRUD Endpoints

**Prompt to Claude:**
```
Claude, build me a FastAPI CRUD for a blog system with:
- Post, Comment, User models
- Full CRUD including PATCH and DELETE
- Pydantic schemas with validation
- Use /deepseek for the boilerplate part
```

**Result:** DeepSeek-V4-Flash generates models, schemas, and CRUD routers in <1s. Claude Opus 5 reviews and integrates.

### Unit Tests

```bash
/deepseek Write pytest tests for this FastAPI endpoint. Include: happy path, validation errors, 404 case. Test data via pytest fixtures.
```

### Data Validation

```bash
/deepseek Create Pydantic models for a user registration form:
- username (3-20 chars, alphanumeric)
- email (valid format)
- password (min 8 chars, 1 uppercase, 1 number)
- age (18-120)
```

---

## 🔷 TypeScript / React

### Component + Handler

```bash
/deepseek Build a React search component with:
- Debounced input (300ms)
- Loading/error/empty states
- TypeScript strict mode
- Basic Tailwind styling
```

### Type Conversion via Pipe

```bash
cat src/utils/helpers.js | /deepseek "Convert this JavaScript utility file to TypeScript with strict types and proper generics."
```

---

## 🗄️ SQL / Database

### Query Optimization

```bash
/deepseek-pro Analyze and optimize this SQL query.
I have 10M rows in orders and 500K in customers.
Current execution time: 12s. Target: <500ms.

SELECT c.name, COUNT(o.id) 
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.created_at > '2025-01-01'
GROUP BY c.name
ORDER BY COUNT(o.id) DESC;
```

### Schema Design

```bash
/deepseek Design a PostgreSQL schema for a multi-tenant SaaS:
- Users with roles (admin, editor, viewer)
- Projects with versioning
- Activity log
- Include indexes and foreign keys
```

---

## 🐳 Docker / DevOps

### Dockerfile

```bash
/deepseek Generate a Dockerfile for a Python 3.12 FastAPI app. Multi-stage build, optimize for size. Include healthcheck.
```

### CI/CD Pipeline

```bash
/deepseek Create a GitHub Actions workflow for:
1. Run tests (pytest)
2. Build Docker image
3. Push to registry
4. Deploy to staging
```

---

## 🔍 Debugging / Refactoring

### Find Race Conditions

```bash
cat src/worker.py | /deepseek-pro "I have an async Python function that intermittently deadlocks. Identify race conditions and suggest lock/semaphore fixes."
```

### Code Smell & Performance Audit

```bash
cat src/engine.py | /deepseek-pro "Review this module for:
- Performance bottlenecks
- Memory leaks
- Unhandled exceptions
- Suggest concrete refactoring steps"
```

---

## 🌐 Full Stack Load-Balancing Workflow

```
Claude, I need a complete real-time chat application:
- FastAPI WebSockets Backend → /deepseek for router & models
- React Chat Frontend → /deepseek for UI components
- Database Migrations → /deepseek for Alembic scripts
- Connection Concurrency Audit → /deepseek-pro
- System Architecture & Auth Security → handled by Claude Opus 5
```

---

## 📋 Quick Reference Cards

### When to use `/deepseek` (Flash)?

| Say this... | ...when you need |
|-------------|------------------|
| "Boilerplate" | CRUD, models, schemas |
| "Tests" | Unit/integration tests |
| "Documentation" | Docstrings, type annotations |
| "Format" | Style fixes, TypeScript conversion |
| "Draft" | First version of configs/scripts |

### When to use `/deepseek-pro`?

| Say this... | ...when you need |
|-------------|------------------|
| "Analyze" | Performance, security profiling |
| "Optimize" | SQL queries, algorithms |
| "Find the bug" | Race conditions, deadlocks, leaks |
| "Refactor" | Improve code structure & modularity |
| "Why is this slow?" | Bottleneck identification |
