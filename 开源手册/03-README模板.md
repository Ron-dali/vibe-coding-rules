# AI 编程流水线 SKILL 通用版 V2.2<br>AI Programming Pipeline SKILL — Universal Edition V2.2

> **© 2026 躺不平联盟(laosi). Licensed under MIT**  
> **一套工具，管所有项目。** 来自真实项目（TBP 躺不平联盟）的 3 个月实战沉淀。
>
> **One toolkit, all projects.** Battle-tested over 3 months on a real project (TBP).
>
> 任何桌面 AI Agent（CodeBuddy / Cursor / Windsurf）一键安装，即刻拥有**会自我进化的**代码质量保障流水线。
>
> One-click install for any desktop AI agent — get a **self-evolving** code quality pipeline instantly.

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Skills](https://img.shields.io/badge/Skills-6个-orange)](.)
[![Version](https://img.shields.io/badge/Version-V2.2-brightgreen)](.)
[![Platform](https://img.shields.io/badge/Platform-CodeBuddy%20%7C%20Cursor%20%7C%20Windsurf-green)](.)

---

## 🤔 这是什么？ / What is this?

非程序员在 AI 辅助下总结的质量保障方法论。从 V1（TBP 项目专用）脱壳为 V2（任何项目通用），V2.1 起实现了**规则自动生长**。

A quality-assurance methodology developed by non-programmers with AI assistance. Evolved from V1 (TBP-specific) to V2 (universal), with **self-growing rules** since V2.1.

> 🎯 **设计目标：让不懂代码的普通人也能安全地用AI编程。** 你只管提需求，流水线自动管质量。

```
新项目 → 对话式初始化向导
  ↓
改代码前 → 四大原则自检
改代码中 → 终端命令安全封装
改代码后 → 逐项自检 (24 rules + 信任分级)
          → 自动化测试 (DOM + screenshot + OCR)
          → 变更日志 + 生长检测
          → git commit → 闭环 ✅
```

---

## 🧠 核心理念：规则自生长 / Self-Growing Rules

传统的代码检查工具是**人写死规则 → 机器执行**。  
这套系统的规则是多了一个维度的：**每次修 Bug → 抽取模式 → 长出新规则**。

Traditional linters are human-writes-rule → machine-executes.  
This system adds a dimension: **every bug fix → extract pattern → grow a new rule**.

```
Bug出现 → 修复 → 观察池(Tier 0) → 重复出现 → 晋升为规则(Tier 1) → 稳定 → 固化为底线(Tier 2)
```

你的规则系统不是静止的——它越用越聪明。Your rules aren't static — they get smarter with use.

---

## 📦 包含的 6 个 Skill（V2.2） / 6 Skills Included

| Skill | 功能 | 通用度 |
|:--|:--|:--:|
| **pipeline-init** 🆕 | 项目初始化向导，对话式自动配置 | 100% |
| **karpathy-principles** | 改前四大原则自查：先思考→做减法→精准改→能跑 | 100% |
| **safe-terminal-executor** | 终端/API 命令安全封装，超时保护+进程确保退出 | 100% |
| **self-check** | 逐项自检 + 三层信任分级 + 规则自动生长 | 可配置 |
| **web-testing** | 浏览器自动化测试（Playwright + DOM + OCR截图） | 可配置 |
| **changelog** | 变更日志写入 + 生长事件检测 + 规则分享导出 | 可配置 |

---

## 🆕 V2.2 新特性 / New Features

### 信任分级规则自生长 / Trust-Tiered Rule Self-Growth

| 级别 | 名称 | 行为 | 晋升条件 |
|:--|:--|:--|:--|
| Tier 0 | 观察池 | 仅记录 | 首次发现 |
| Tier 1 | [SOFT] 软规则 | 警告可放过 | 置信度 ≥ 3 |
| Tier 2 | [HARD] 硬规则 | 阻断必改 | 置信度 ≥ 5 |

误报过多自动退役，无需人工审核。Excessive false positives auto-retire.

### 对话式项目初始化 / Conversational Project Init

Agent 自动检测新项目意图，对话式收集信息，一键创建项目结构 + fork 流水线模板。

### 一键分享导出 / One-Click Share Export

Tier 2 规则自动生成分享文本，可短信分享给开发者。

---

## 🚀 快速开始 / Quick Start

### 安装 / Install

```bash
# Windows
install.bat

# macOS / Linux
chmod +x install.sh && ./install.sh

# PowerShell (自动模板替换)
.\install.ps1
```

安装后，Agent Memory 中会自动写入新项目检测触发器。下次说"我要做一个XX"时，Agent 会询问是否初始化流水线。

### 推荐工作流 / Recommended Workflow

```
你："帮我加一个用户登录功能"
  ↓
AI 先执行【karpathy-principles】→ 四大原则自检
  ↓
AI 改代码
  ↓
AI 自动执行【self-check】→ 24 条规则扫描 + 信任分级
  ↓
AI 自动执行【web-testing】→ DOM 断言 + 截图 OCR 验证
  ↓
AI 自动执行【changelog】→ 记录改动 + 生长检测
  ↓
✅ git commit → 闭环
```

---

## ✨ 核心亮点 / Highlights

| 亮点 | 为什么重要 |
|:--|:--|
| 🚫 **零门槛** | 不需要懂编程，你只管用自然语言提需求，流水线自动把关 |
| 🌱 **规则自生长** | 不是死规则——每修一个Bug，系统自动学会"下次别犯" |
| 🔒 **三层信任分级** | Tier 0（观察）→ Tier 1（软规则）→ Tier 2（硬规则），越严重的Bug越严格 |
| 🔗 **全自动闭环** | 纪律→编码→自检→测试→日志→提交，一次对话全自动跑完 |
| 📦 **即装即用** | 一键安装脚本，3 个平台支持（Windows/macOS/Linux） |
| 🌍 **多平台兼容** | CodeBuddy / Cursor / Windsurf 均可使用 |
| 🔄 **项目初始化向导** | 新项目自动检测 → 对话式配置 → fork 流水线模板 |

---

## 🧪 实战数据 / Battle Data

| 指标 | 数据 |
|:--|:--|
| 验证项目 | TBP（200+ 次 AI 编程交互，3 个月持续迭代） |
| 版本 | V2.2（从 V1 TBP原型 → V2 通用版 → V2.1 自生长 → V2.2 中英双语） |
| 核心规则 | 24 条 + 持续自生长 |
| 信任分级 | Tier 0（观察池）→ Tier 1（成熟规则）→ Tier 2（强制红线） |
| 已捕获 Bug 类型 | 空值吞零、假选中、硬编码、双入口不同步、截断点遗漏 等 14 类 |

---

## 版本历史 / Version History

- **V2.2（当前）** — 中英双语 + 版本同步 + 重命名
- **V2.1（自生长版）** — 信任分级 + 分享导出
- **V2.0（通用版）** — 去耦重构，从TBP脱壳
- **V1（TBP原型）** — 姊妹目录 `AI编程自动流水线-TBP原型/`

---

## 🤝 贡献 / Contribute

欢迎提 Issue 和 PR。Welcome issues and PRs.

发现 Bug 模式 → 在 Issue 中描述 → 评估纳入规则体系

---

## 👥 加入社群 / Community

本项目由【**躺不平联盟**】社区孵化。

> 我们是一群用 AI 写代码、不断踩坑、然后把坑变成规则的人。
> We are a community that codes with AI, steps on every pitfall, and turns them into rules.

- 📱 微信：**[你的微信号]**（备注"tbp"快速通过）

---

## 📄 许可证 / License

[MIT](LICENSE) © 2026 躺不平联盟(laosi)

**规则自生长方法论原始提出：躺不平联盟**  
**Self-Growing Rules Methodology originally proposed by: 躺不平联盟**
