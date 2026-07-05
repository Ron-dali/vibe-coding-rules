---
name: karpathy-principles
description: Mandatory activation — 4 AI coding principles applied to every conversation. Derived from Karpathy's Law. Regardless of task type, self-check all 4 principles before outputting any code.
tags: [ai-coding, karpathy, programming-principles, code-quality, mandatory]
version: 2.0.0
author: laosi
---

# Mandatory: AI Coding 4 Principles (Activated Every Conversation)

> **Mandatory rule. Must self-check principles before every coding instruction.**

## Usage Rules

**Must self-check before acting when any of the following is true:**

- User asks to modify code
- User reports a bug
- User requests a new feature
- Code review / refactoring

**Principle Checklist (run through before outputting code):**

□ Principle 1 — Think First: Do I really understand the problem? Are there multiple interpretations? Am I sure I'm editing the right file?
□ Principle 2 — Keep It Simple: Can this be solved in one line? Am I over-engineering?
□ Principle 3 — Precise Modification: Only change what must be changed. Did I accidentally touch unrelated code?
□ Principle 4 — Goal-Driven: Will it run after the change? Any missing deps/styles/references?
□ Trap A — Falsy Coercion: `value||default` swallows `0/''/false`. Use `!=null` or `??` for numeric checks.
□ Trap B — Select Fake-Selection: No `selected` attribute → browser shows first option by default. Always add a placeholder `<option>`.
□ Trap C — POST-as-UPSERT: UPDATE branch must NOT hardcode fields. Always read from `req.body`.

## The Four Principles

| # | Principle | Core Idea | Correct Approach |
|---|-----------|-----------|------------------|
| 1 | **Think First** | No assumptions, no skipping | Read files to confirm current state before acting |
| 2 | **Keep It Simple** | Minimal changes | Prioritize solving with fewest lines possible |
| 3 | **Precise Modification** | Only touch target code | Treat where the problem is, don't spread |
| 4 | **Goal-Driven** | It must run after changes | Ensure every change is a closed loop (JS+CSS+template) |

## Common Traps

| # | Trap | Wrong Pattern | Correct Pattern |
|---|------|--------------|-----------------|
| A | **JS falsy swallows 0** | `value \|\| 1000` → `0` gets replaced | `value != null ? value : 1000` |
| B | **Select fake selection** | `<select>` without `selected` attr | Default case: `<option value="" disabled selected>Please select...</option>` |
| C | **POST upsert hardcode** | UPDATE branch writes literal field values | Read from `req.body`, fallback to `existing.xxx` |

## Sources

- Karpathy original observation: https://x.com/karpathy/status/2015883857489522876
- forrestchang/andrej-karpathy-skills: https://github.com/forrestchang/andrej-karpathy-skills
