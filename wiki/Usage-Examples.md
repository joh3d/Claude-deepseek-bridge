# Usage Examples

Reference examples for common development workflows.

---

## Python & FastAPI

### CRUD Router Implementation

**Prompt to Claude:**
```
Claude, create a FastAPI CRUD router for a blog service:
- Post, Comment, and User SQLAlchemy models
- Full CRUD operations with PATCH and DELETE endpoints
- Pydantic schemas with field validation
- Delegate boilerplate generation to /deepseek
```

**Workflow:** DeepSeek-V4-Flash generates data models, validation schemas, and router endpoints. Claude Opus 5 reviews, adjusts error handling, and integrates into the project.

### Unit Test Generation

```bash
/deepseek Write pytest tests for this FastAPI endpoint. Include: successful creation, schema validation failures, and 404 handler tests. Use pytest fixtures for sample data.
```

### Schema Validation

```bash
/deepseek Create Pydantic models for user registration:
- username (3-20 alphanumeric characters)
- email (RFC-compliant format)
- password (minimum 8 chars, 1 uppercase, 1 digit)
- age (integer range 18-120)
```

---

## TypeScript & React

### UI Component Construction

```bash
/deepseek Build a React search component with:
- Debounced input handler (300ms)
- Loading, error, and empty state representations
- TypeScript strict mode compliance
- Basic CSS classes for responsive layout
```

### TypeScript Migration via Stdin Pipeline

```bash
cat src/utils/helpers.js | /deepseek "Convert this JavaScript utility module to TypeScript with strict type signatures and generic constraints."
```

---

## Database & SQL

### Query Optimization

```bash
/deepseek-pro Analyze and optimize this SQL query.
Target: Orders table (10M rows) and Customers table (500k rows).
Current execution time: 12 seconds. Target: < 500 milliseconds.

SELECT c.name, COUNT(o.id) 
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.created_at > '2025-01-01'
GROUP BY c.name
ORDER BY COUNT(o.id) DESC;
```

### Schema Design

```bash
/deepseek Design a PostgreSQL database schema for a multi-tenant application:
- Organizations and Users with role-based permissions (admin, editor, viewer)
- Project versioning tables
- Audit logging tables with foreign keys and index strategies
```

---

## DevOps & Infrastructure

### Dockerfile Generation

```bash
/deepseek Generate a multi-stage Dockerfile for a Python 3.12 FastAPI service with non-root user execution, layer caching optimization, and container health checks.
```

### CI/CD Pipeline Configuration

```bash
/deepseek Create a GitHub Actions workflow that executes:
1. Automated linting and pytest test execution
2. Docker container image build and vulnerability scanning
3. Registry deployment upon pull request merge
```

---

## Debugging & Code Audits

### Concurrency and Deadlock Analysis

```bash
cat src/worker.py | /deepseek-pro "This async Python worker intermittently deadlocks under high load. Identify race conditions and propose asyncio Lock / Semaphore mitigations."
```

### Static Quality and Performance Audit

```bash
cat src/engine.py | /deepseek-pro "Review this module for:
- Algorithmic performance bottlenecks
- Unbounded memory growth patterns
- Missing exception handling branches
- Propose structured refactoring steps"
```

---

## Full-Stack Delegation Workflow

```
Claude, implement a real-time messaging subsystem:
- FastAPI WebSocket handler -> delegate to /deepseek
- React Chat client component -> delegate to /deepseek
- Database migration script -> delegate to /deepseek
- WebSocket connection concurrency audit -> delegate to /deepseek-pro
- Authentication architecture and message security review -> handled by Claude Opus 5
```

---

## Task Delegation Decision Matrix

| Intended Action | Recommended Command | Model |
|---|---|---|
| Boilerplate generation | `/deepseek` | DeepSeek-V4-Flash |
| Unit and integration tests | `/deepseek` | DeepSeek-V4-Flash |
| Docstrings and type annotations | `/deepseek` | DeepSeek-V4-Flash |
| Syntax and style migration | `/deepseek` | DeepSeek-V4-Flash |
| Concurrency and deadlock analysis | `/deepseek-pro` | DeepSeek-V4-Pro |
| SQL query plan optimization | `/deepseek-pro` | DeepSeek-V4-Pro |
| Structural code refactoring | `/deepseek-pro` | DeepSeek-V4-Pro |
| System architecture and security | Claude Native | Claude Opus 5 |
