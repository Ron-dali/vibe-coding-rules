# 🛡️ Vibe Coding Rules V2.7.0

[![Version](https://img.shields.io/badge/version-2.7.0-blue)](https://github.com/Ron-dali/vibe-coding-rules)
[![License](https://img.shields.io/badge/license-Apache%202.0-green)](./LICENSE)
[![Platform](https://img.shields.io/badge/platform-CodeBuddy%20%7C%20Cursor%20%7C%20Windsurf-orange)](https://github.com/Ron-dali/vibe-coding-rules)

[中文文档 / Chinese Documentation](./README_CN.md)

> **AI's biggest enemy is itself — it forgets the bugs it fixed yesterday, falls into the same traps over and over.**
>
> 6 self-evolving Skills that install code discipline into AI agents. Not about writing faster — about writing code that *stays fixed*.

---

## 🎯 What Problem Does This Solve?

If you code with AI, you **will** hit all 5 of these pain points:

| # | Pain | What Happens |
|:--|:--|:--|
| 1 | 🧠 **AI Amnesia** | Bug fixed yesterday? Back today. Fix module B, silently break module A. You won't know until users complain. |
| 2 | 🔁 **Repeat Traps** | Same mistakes — `\|\|` eats `0`, `<select>` missing placeholder — repeated 5 times. AI has no "learn from pain" ability. |
| 3 | 📝 **No Trace** | No changelog. What did I touch? What did I break? No starting point for debugging. |
| 4 | 🧪 **No Regression** | One CSS line → whole layout broken. Manual regression testing is exhausting. Skipping it is terrifying. |
| 5 | 🗺️ **Lost in Code** | Open a file — what's coupled to it? How was it last modified? Where are the landmines? Every edit is an expedition. |

**Vibe Coding Rules turns all 5 into automated workflows. You don't need to know how to code. The AI remembers, checks, and tests for you.**

---

## ⚡ How It Works — A Real Scenario

You say: **"Fix the save button on the settings page"**

Here's what happens step by step:

### Step 1: 🧠 Understand + Breadcrumb Pre-scan (coding-principles auto-triggered)

The AI doesn't jump straight into coding. It pauses:

- Opens `settings.js` and finds the 🍞 breadcrumb header:
  ```
  @COUPLED: server/routes/settings.js, public/js/validation.js
  @BUGFIX 2026-06-20: Form field name mismatch causing silent save failure
  ```
- The AI instantly knows: don't just fix the frontend — check the backend route and validation too. And don't revert the field name fix from last time.

**Before writing a single line, the AI already knows the full impact scope.**

### Step 2: ⚡ Write Code (Safe Terminal)

If API verification is needed, `safe-terminal-executor` auto-wraps curl/wget commands into Node scripts with timeout protection — no more hanging on network calls.

### Step 3: 🔍 28-Rule Self-Check (self-check auto-triggered)

Code is written, but the AI doesn't say "done" yet. It checks 28 rules:

- ✅ `||` didn't eat a numeric `0`? (Trap A)
- ✅ `<select>` has a placeholder option? (Trap B)
- ✅ POST upsert doesn't hardcode fields? (Trap C)
- ✅ Dual-entry HTML `<script>` tags synced on both sides?
- ✅ 🍞 breadcrumbs updated?
- ... 28 rules total, run automatically.

**Code isn't "good enough." It passes 28 rules.**

### Step 4: 🧪 Auto-Test (web-testing auto-triggered)

Code is written, rules are checked — but **the AI opens a browser and verifies**:

- DOM assertion: Is the save button there? Is it clickable?
- Screenshot diff: Did the layout break vs. last screenshot?
- OCR check: Is the text on the page correct?

**One CSS line won't silently destroy your layout. The AI checks with its own eyes.**

### Step 5: 📝 Changelog (changelog auto-written)

Everything passes? Auto-record:

- Which files changed
- Lines added / deleted
- 28-rule pass rate
- Any new rules promoted (from observation to hard rule)

### Step 6: ✅ Closed Loop

```
coding-principles (pre-code check)
  → write code (safe execution)
    → self-check (28 rules)
      → web-testing (browser verification)
        → changelog (change record)
          → ✅ delivered
```

**You say one sentence. The AI handles the rest in a closed loop.**

---

## 🛠️ The 6 Skills

| Skill | What It Does |
|:--|:--|
| 🥇 **coding-principles** | Pre-code: 5 principles + 🍞 breadcrumb pre-scan + 3 auto-trap detection |
| 🛡️ **safe-terminal-executor** | Safe terminal: all network commands wrapped with timeout + forced exit |
| 🔍 **self-check** | Post-code: 28 rules + integrity gate + 🍞 breadcrumb seeding + trust-tiered growth |
| 🧪 **web-testing** | Auto-test: DOM assertion + screenshot diff + OCR verification |
| 📝 **changelog** | Auto changelog: what changed + rule growth detection |
| 🚀 **pipeline-init** | One-click bootstrap: conversational Q&A → complete pipeline in 1 minute |

---

## 🍞 The Breadcrumb System — The Soul of V2.5

This is the **core mechanism**. Every time code changes, the AI plants breadcrumbs in file headers:

```javascript
/*
 * ─── 🍞 AI Breadcrumb Navigation ────────────────────
 * Tag legend: @COUPLED=coupled file @GOTCHA=trap @BUGFIX=bug fix @MAGIC=magic number
 *             @DEPENDS=external dependency @ASSUME=assumption @TODO=todo @WHY=design rationale
 *             @PERF=performance @CONTRACT=interface contract 📖=documentation reference
 *
 * Breadcrumbs (what depends on this):
 *   @COUPLED sync field changes with: public/js/chat-core.js#L200, server/routes/chat.js
 *   📖 see: docs/architecture/chat-system.md
 *   @BUGFIX 2026-07-01: mobile overflow layout collapse, fix: add overflow-x:hidden to container
 *   @GOTCHA: state machine reset in openTab(), changing order causes double-init
 * ────────────────────────────────────────────────
 */
```

**Pre-scan**: Open a file → read 🍞 first → know couplings & past pitfalls → don't repeat mistakes

**Post-seed**: Auto-update 🍞 after changes → next AI that opens this file has a complete map

---

## 🎚️ Progressive Adoption (V2.7)

Not every change needs all 6 Skills. A 3-line CSS fix ≠ a new feature.

| Level | Trigger | Skills | Use Case |
|:--|:--|:--|:--|
| **L1 · Light** | ≤ 3 files, ≤ 30 lines changed | 5 principles check | Bug fixes, text edits, CSS tweaks |
| **L2 · Standard** | 3-10 files, or touches routing/data flow | L1 + 28-rule self-check | Cross-module bugs, medium changes |
| **L3 · Full** | > 10 files, or new feature/refactor | L1 + L2 + auto-test + changelog | New features, architecture changes |

**No context waste.** A 3-line CSS fix doesn't trigger the full test suite.

---

## 📦 Install

```bash
# CodeBuddy / Cursor / Windsurf
openclaw skills install @ron-dali/vibe-coding-rules

# Or manual clone
git clone https://github.com/Ron-dali/vibe-coding-rules.git
```

After install, tell your AI: **"Initialize pipeline"** — it auto-detects your project and configures everything.

**Start using in 30 seconds. Zero programming knowledge required.**

---

## 🎯 Who Is This For?

| If You | Why You Need This |
|:--|:--|
| 🐣 **AI-coder, non-programmer** | Your code-discipline exoskeleton — AI stops reckless edits, auto-verifies after |
| 💻 **Solo dev / indie maker** | You ARE your QA — these 6 Skills ARE your QA team |
| 🏢 **Small team + AI** | Unified quality standard, less code review overhead |
| 🤖 **Heavy AI agent user** | Agent gets smarter over time — rules grow, nothing forgotten |

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────┐
│        User says one thing              │
│      "Fix the save button"              │
└──────────────────┬──────────────────────┘
                   │
      ┌────────────▼────────────┐
      │  🥇 coding-principles    │
      │  Pre: 5 principles + 🍞   │
      └────────────┬────────────┘
                   │
      ┌────────────▼────────────┐
      │  🛡️ safe-terminal        │
      │  Safe network commands   │
      └────────────┬────────────┘
                   │
      ┌────────────▼────────────┐
      │  ✏️ Write Code           │
      └────────────┬────────────┘
                   │
      ┌────────────▼────────────┐
      │  🔍 self-check           │
      │  Post: 28 rules + gate   │
      └────────────┬────────────┘
                   │
      ┌────────────▼────────────┐
      │  🧪 web-testing          │
      │  DOM + screenshot + OCR  │
      └────────────┬────────────┘
                   │
      ┌────────────▼────────────┐
      │  📝 changelog            │
      │  Changelog + growth      │
      └────────────┬────────────┘
                   │
              ✅ Closed Loop
```

---

## 🚀 Core Features

| Feature | Description |
|:--|:--|
| 🍞 **Breadcrumb Memory** | Auto-record couplings + historical pitfalls in file headers — AI never forgets |
| 🔄 **Self-Growing Rules** | Repeated pitfalls auto-promote to hard rules; false positives auto-retire |
| 🎚️ **Progressive Adoption** | L1/L2/L3 matched to change size — no context waste |
| 🛑 **Integrity Gate** | Critical violations block immediately — problems don't propagate |
| 🌍 **Cross-Platform** | Works with CodeBuddy, Cursor, Windsurf |
| 🔄 **Failure Recovery** | Multi-violation grouped recovery, delivery unblocked |
| 🔌 **Template-Free** | Pure prompt + pipeline.json, no framework lock-in |

---

## 📖 Author's Story

**I don't know how to code. Not a single line.**

45 days. Pure AI coding tools. Built a **140,000-line**, 3-platform (Web + Desktop + MiniApp) product from scratch — [TangBuPing](https://tangbuping.com), an AI knowledge democracy platform.

The biggest pain wasn't AI failing to write code. It was **AI forgetting what it wrote**. Bug fixed yesterday? Back today. Module A fixed, Module B destroyed.

3 months of battle scars, distilled into these 6 Skills. Open-sourced so you don't have to bleed the same way.

> *We don't hustle harder. We make it so others can't stay lying down either.*

---

## 🔗 Links

- 🏠 [TangBuPing](https://tangbuping.com)
- 🐙 [GitHub @Ron-dali](https://github.com/Ron-dali)
- 📦 [GitHub Repo](https://github.com/Ron-dali/vibe-coding-rules)
- 🇨🇳 [中文文档 / Chinese README](./README_CN.md)

---

## 📄 License

Apache 2.0 — Free to use, modify, distribute.
