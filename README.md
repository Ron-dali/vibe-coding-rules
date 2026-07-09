# 🛡️ Vibe Coding Rules V2.7.0

[![Version](https://img.shields.io/badge/version-2.7.0-blue)](https://github.com/Ron-dali/vibe-coding-rules)
[![License](https://img.shields.io/badge/license-Apache%202.0-green)](./LICENSE)
[![Platform](https://img.shields.io/badge/platform-CodeBuddy%20%7C%20Cursor%20%7C%20Windsurf-orange)](https://github.com/Ron-dali/vibe-coding-rules)

> **AI 写代码最大的敌人，是它自己——它会忘记昨天修好的 Bug，会在同一个坑里反复跌倒。**
>
> 6 个会自我进化的 Skill，给 AI 装上"编程纪律"。不是让 AI 写得更快，是让它写完的代码不再倒。
>
> **AI's biggest enemy is itself — it forgets the bugs it fixed yesterday, falls into the same traps over and over.**
>
> 6 self-evolving Skills that install code discipline into AI agents. Not about writing faster — about writing code that *stays fixed*.

---

## 🎯 它到底解决什么问题？ / What Problem Does This Solve?

用 AI 写代码的人，一定会遇到这 5 个痛点。不是一个两个，是**全部**：

If you code with AI, you **will** hit all 5 of these pain points:

| # | 痛点 / Pain | 具体表现 / What Happens |
|:--|:--|:--|
| 1 | 🧠 **AI 失忆 / Amnesia** | 昨天修好的 Bug，今天原样重现。改 B 模块时悄悄破坏了 A 模块，你不知道，直到用户骂。<br>Bug fixed yesterday? Back today. Fix module B, silently break module A. You won't know until users complain. |
| 2 | 🔁 **重复踩坑 / Repeat Traps** | 同样的错误——`\|\|` 把 `0` 当成 falsy 吞掉、`<select>` 假选中没占位选项——犯了 5 次还在犯。AI 没有"吃过亏就记住"的能力。<br>Same traps — `\|\|` eats `0`, `<select>` no placeholder — repeated 5 times. AI has no "learn from pain" ability. |
| 3 | 📝 **改完不知道改了什么 / No Trace** | 没有变更记录。动了哪些文件？影响了什么？下次出问题连回溯的起点都没有。<br>No changelog. What did I touch? What did I break? No starting point for debugging. |
| 4 | 🧪 **改完不知道坏了没有 / No Regression** | 改一行 CSS，整个页面布局崩了——手动回归测试太累，不测又不放心。<br>One CSS line → whole layout broken. Manual regression testing is exhausting. Skipping it is terrifying. |
| 5 | 🗺️ **项目越大越迷路 / Lost in Code** | 打开一个文件，不知道它关联了谁、上次怎么改的、哪里踩过坑。每改一次都是一次探险。<br>Open a file — what's coupled to it? How was it last modified? Where are the landmines? Every edit is an expedition. |

**Vibe Coding Rules 把这 5 个痛点全部变成了自动化流程。你不需要懂编程，不需要记住任何规则——AI 自己会记住、会检查、会测试。**

**Vibe Coding Rules turns all 5 pain points into automated workflows. You don't need to know how to code. You don't need to memorize rules. The AI remembers, checks, and tests for you.**

---

## ⚡ 它是怎么运作的？——一个真实场景 / How It Works — A Real Scenario

假设你说：**"修复用户设置页面的保存按钮不起作用"**

You say: **"Fix the save button on the settings page"**

以下是 AI 在装上 Vibe Coding Rules 之后的完整工作流程：

Here's what the AI does step by step, with Vibe Coding Rules installed:

### Step 1: 🧠 理解问题 + 面包屑预扫描（coding-principles 自动触发）

AI 不是直接开始改代码。它先停下来问自己：
- 保存按钮涉及哪些文件？
- 打开 `settings.js` 头部看到 🍞 面包屑写着：
  ```
  @COUPLED: server/routes/settings.js, public/js/validation.js
  @BUGFIX 2026-06-20: 表单字段名不匹配导致保存静默失败
  ```
- AI 立刻知道：不能只改前端，还要检查后端路由和验证逻辑；上次修过字段名不匹配的问题，别回退了。

**Before writing a single line, the AI already knows the full impact scope.**

### Step 2: ⚡ 改代码（安全终端保护）

- 如果需要调 API 验证，`safe-terminal-executor` 自动把 curl/wget 命令包裹成带超时保护的 Node 脚本——不会因为网络卡住而无限等待。

### Step 3: 🔍 28 条规则自检（self-check 自动触发）

代码改完了，但 AI 不会直接说"好了"。它逐项检查 28 条编程纪律规则：
- ✅ `||` 没有吞掉数值 0？（陷阱 A）
- ✅ `<select>` 有没有占位 option？（陷阱 B）
- ✅ POST upsert 有没有硬编码字段？（陷阱 C）
- ✅ 双入口 HTML 的 `<script>` 标签两边都同步了？
- ✅ 🍞 面包屑更新了？
- ... 共 28 条，自动跑完。

**代码不是"看着对就行"，而是 28 条规则逐条过。**

### Step 4: 🧪 自动化测试（web-testing 自动触发）

代码改了、检查过了——但 **AI 自己打开浏览器验证**：
- DOM 断言：保存按钮在不在？能不能点？
- 截图对比：设置页面布局有没有崩？
- OCR 文字验证：页面上写的文字对不对？

**改 CSS 不会悄无声息炸掉布局。AI 帮你亲眼看了。**

### Step 5: 📝 变更日志（changelog 自动写入）

一切通过后，自动记录：
- 改了哪些文件
- 新增/删除多少行
- 28 条规则通过率是多少
- 有没有新规则被触发（从观察池晋升到硬规则）

### Step 6: ✅ 闭环交付

```
coding-principles（改前自查）
  → 改代码（安全执行）
    → self-check（28条规则扫描）
      → web-testing（浏览器自动验证）
        → changelog（变更记录）
          → ✅ 交付
```

**你只需要说一句话。剩下的，AI 自己闭环。**

**You say one sentence. The AI handles the rest in a closed loop.**

---

## 🛠️ 6 个 Skill 详解 / The 6 Skills in Detail

### 🥇 coding-principles — 改前五大原则 / Pre-Code 5 Principles

在 AI 输出代码之前，强制它先过一遍脑子。

Forces AI to think before spitting out code.

| 原则 / Principle | 做什么 / What It Does |
|:--|:--|
| 🍞 **面包屑预扫描** | 打开文件先看 🍞 头部——知道这个文件关联谁、哪里踩过坑 |
| 1️⃣ **先思考 / Think First** | 我真的理解问题了吗？在改正确的文件吗？ |
| 2️⃣ **做减法 / Subtract First** | 能不能删代码解决？是不是在过度工程化？ |
| 3️⃣ **精准修改 / Surgical** | 只改必须改的，有没有碰了无关代码？ |
| 4️⃣ **目标驱动 / Must Run** | 改完能跑吗？所有入口都查了吗？ |

**+ 3 个常见陷阱自动拦截**：`||` 吞 0 / `select` 假选中 / POST 硬编码字段

---

### 🛡️ safe-terminal-executor — 安全终端 / Safe Terminal

所有 curl、wget、SSH 命令自动包裹成 Node 脚本——超时保护、强制退出、日志留存。

All network commands auto-wrapped as Node scripts — timeout protection, guaranteed exit, log output.

**你再也不会看到一个 AI curl 请求卡住 5 分钟不动。**

---

### 🔍 self-check — 改后 28 条规则自检 / Post-Change 28-Rule Check

代码改完不是结束。28 条规则逐项检查：

Code change isn't done. 28 rules checked item by item:

| 规则类型 / Rule Type | 数量 / Count | 说明 / Description |
|:--|:--|:--|
| 🔴 硬规则 / Hard Rules | 15 条 | 违规 = 阻断交付，必须修 / Block delivery, must fix |
| 🟡 软规则 / Soft Rules | 8 条 | 违规 = 警告，可放过但会记录 / Warn, skippable but logged |
| 🔵 观察池 / Observation Pool | 5 条 | 仅记录不阻断，累积 3 次置信度后自动晋升 / Record only, auto-promote after 3 hits |

**规则会自己生长。** 今天踩的坑，明天变成 AI 不能再犯的硬规则。

**Rules grow by themselves.** Today's pitfall → tomorrow's hard rule.

---

### 🍞 面包屑系统 — 整套工具的灵魂 / The Breadcrumb System — The Soul

这是 Vibe Coding Rules **最核心的机制**。每次改代码时，AI 在文件头部自动播种"面包屑"：

This is **the core mechanism**. Every time code changes, AI plants breadcrumbs in file headers:

```javascript
/*
 * ─── 🍞 AI面包屑导航 ───────────────────────────────
 * @COUPLED 改字段需同步: public/js/chat-core.js#L200, server/routes/chat.js
 * 📖 见: 开发文档/03-架构设计/聊天系统.md
 * @BUGFIX 2026-07-01: 移动端溢出布局坍塌，修复: 给容器加 overflow-x:hidden
 * @GOTCHA: openTab() 里的状态机重置逻辑，改顺序会导致双击初始化
 * ────────────────────────────────────────────────
 */
```

**改前扫描**：打开文件先读 🍞 → 知道耦合关系和历史坑位 → 不会踩旧坑

**改后播种**：改完自动更新 🍞 → 下一个 AI（或未来的自己）打开文件时，有完整地图

**Pre-scan**: Read 🍞 first → know couplings & past pitfalls → don't repeat mistakes

**Post-seed**: Auto-update 🍞 after changes → next AI that opens this file has a complete map

---

### 🧪 web-testing — 自动化回归测试 / Auto Regression Test

改完代码，AI **自己打开浏览器验证**：

After changes, the AI **opens a browser and verifies for you**:

| 验证方式 / Method | 做什么 / What It Does |
|:--|:--|
| DOM 断言 | 关键元素在不在？按钮能不能点？ |
| 截图对比 | 跟上次截图比，布局有没有崩？ |
| OCR 验证 | 页面上的文字对不对？ |

---

### 📝 changelog — 变更日志 / Changelog

每次交付自动记录：改了什么、学了什么、规则有没有进化。

Auto-records every delivery: what changed, what was learned, did rules evolve.

---

### 🚀 pipeline-init — 一键初始化 / One-Click Bootstrap

新项目：对话式问答 → 自动创建完整流水线 → 一分钟搭好全部质量基础设施。

New project: conversational Q&A → auto-create pipeline → 1 minute, complete quality infra deployed.

---

## 🎚️ 渐进式采纳 / Progressive Adoption（V2.7 新特性）

> **不是每次改代码都要跑 6 个 Skill。改 3 行 CSS 和改一个新功能，用的流程不一样。**

> **Not every change needs all 6 Skills. A 3-line CSS fix ≠ a new feature.**

| 级别 / Level | 触发条件 / Trigger | 激活的 Skill / Skills | 场景 / Use Case |
|:--|:--|:--|:--|
| **L1 · 轻量** | ≤ 3 文件，≤ 30 行变更 | 五原则自检 | 修小 Bug、改文案、调 CSS |
| **L2 · 标准** | 3-10 文件，或涉及路由/数据流 | L1 + 28 条规则自检 | 跨模块 Bug、中等改动 |
| **L3 · 完整** | > 10 文件，或新功能/重构 | L1 + L2 + 自动测试 + 变更日志 | 新功能、架构调整 |

**不浪费上下文。** 改 3 行 CSS 不需要跑完整测试链路。

**No context waste.** A 3-line CSS fix doesn't trigger the full test suite.

---

## 📦 安装 / Install

```bash
# CodeBuddy / Cursor / Windsurf
openclaw skills install @ron-dali/vibe-coding-rules

# 或手动克隆 / Or manual clone
git clone https://github.com/Ron-dali/vibe-coding-rules.git
```

安装后对 AI 说：**"初始化流水线"**，AI 自动检测项目类型并完成配置。

After install, tell your AI: **"Initialize pipeline"** — it auto-detects your project and configures everything.

**30 秒开始用。不需要任何编程知识。**

**Start using in 30 seconds. Zero programming knowledge required.**

---

## 🎯 谁需要这个？/ Who Is This For?

| 如果你 / If You | 为什么需要 / Why You Need This |
|:--|:--|
| 🐣 **用 AI 写代码但不懂编程**<br>AI-coder, non-programmer | 你的"编程纪律外骨骼"——AI 不再瞎改，改完自动验证<br>Your code-discipline exoskeleton — AI stops reckless edits |
| 💻 **独立开发者 / 一人公司**<br>Solo dev / indie maker | 你是你自己的 QA——这 6 个 Skill 就是你的 QA 团队<br>You ARE your QA — these 6 Skills ARE your QA team |
| 🏢 **小型团队用 AI 辅助**<br>Small team + AI | 统一代码质量标准，减少 Code Review 的开销<br>Unified quality standard, less review overhead |
| 🤖 **重度 AI Agent 用户**<br>Heavy AI agent user | Agent 越用越聪明——规则自生长，永不遗忘<br>Agent gets smarter over time — rules grow, nothing forgotten |

---

## 🏗️ 架构总览 / Architecture

```
┌─────────────────────────────────────────────────────────┐
│                    用户一句话 / User Says One Thing        │
│             "修复设置页保存按钮" / "Fix save button"        │
└────────────────────────┬────────────────────────────────┘
                         │
         ┌───────────────▼───────────────┐
         │  🥇 coding-principles          │
         │  改前：五原则 + 🍞预扫描         │
         │  Pre-code: 5 principles + 🍞    │
         └───────────────┬───────────────┘
                         │
         ┌───────────────▼───────────────┐
         │  🛡️ safe-terminal-executor     │
         │  网络命令安全封装（始终可用）      │
         │  Safe network cmd (always on)  │
         └───────────────┬───────────────┘
                         │
         ┌───────────────▼───────────────┐
         │  ✏️ 修改代码 / Write Code       │
         └───────────────┬───────────────┘
                         │
         ┌───────────────▼───────────────┐
         │  🔍 self-check                 │
         │  改后：28条规则 + 🛑阻断点 + 🍞播种│
         │  Post: 28 rules + gate + 🍞     │
         └───────────────┬───────────────┘
                         │
         ┌───────────────▼───────────────┐
         │  🧪 web-testing                │
         │  DOM断言 + 截图 + OCR 自动验证   │
         │  DOM + screenshot + OCR        │
         └───────────────┬───────────────┘
                         │
         ┌───────────────▼───────────────┐
         │  📝 changelog                  │
         │  变更记录 + 规则生长检测         │
         │  Changelog + growth detection  │
         └───────────────┬───────────────┘
                         │
                    ✅ 闭环交付
                    ✅ Closed Loop
```

**渐进式按需激活：** 改 3 行 CSS 走 L1（只触发五原则自检），开发新功能走 L3（全链路闭环）。不浪费上下文。

**Progressive on-demand:** 3-line CSS fix → L1 only. New feature → L3 full loop. No context waste.

---

## 🚀 核心特性一览 / Core Features at a Glance

| 特性 / Feature | 描述 / Description |
|:--|:--|
| 🍞 **面包屑记忆** | 文件头部自动记录耦合关系+历史坑位，AI 不再失忆 |
| 🔄 **规则自生长** | 重复踩的坑自动升级为硬规则，误报自动退役 |
| 🎚️ **渐进式采纳** | L1/L2/L3 按改动大小自动匹配，不浪费上下文 |
| 🛑 **完整性阻断点** | 关键违规立即阻断，不把问题带到下一步 |
| 🌍 **跨界兼容** | CodeBuddy / Cursor / Windsurf 通用 |
| 🔄 **失败恢复模式** | 多违规不阻塞交付，自动分组降级处理 |
| 🔌 **去模板化** | 纯 prompt + pipeline.json，不绑定任何框架 |

---

## 📖 作者的故事 / Author's Story

**I don't know how to code. Not a single line.**

45 天，纯用 AI 写代码工具。从零写出一个 **14 万行**、三端（Web + 桌面 + 小程序）的产品——[躺不平联盟](https://tangbuping.com)，一个 AI 知识平权平台。

最大的痛点不是 AI 写不出代码，而是 **AI 写过的代码它自己记不住**。昨天修好的 Bug 今天原样回来。修了 A 模块，炸了 B 模块。

3 个月的踩坑血泪，浓缩成这 6 个 Skill。开源，让后来者不用再踩同样的坑。

**45 days. Pure AI coding. 140,000 lines. 3 platforms (Web + Desktop + MiniApp).**

The biggest pain wasn't AI failing to write code. It was **AI forgetting what it wrote**. Bug fixed yesterday? Back today. Module A fixed, Module B destroyed.

3 months of battle scars, distilled into these 6 Skills. Open-sourced so you don't have to bleed the same way.

> **躺不平不是卷，是让其他人也躺不平。**
> *We don't hustle harder. We make it so others can't stay lying down either.*

---

## 🔗 链接 / Links

- 🏠 [躺不平联盟 / TangBuPing](https://tangbuping.com)
- 🐙 [GitHub @Ron-dali](https://github.com/Ron-dali)
- 📦 [GitHub Repo](https://github.com/Ron-dali/vibe-coding-rules)

---

## 📄 许可 / License

Apache 2.0 — 自由使用、修改、分发。Free to use, modify, distribute.
