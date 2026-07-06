# Vibe Coding Rules V2.5<br>AI 编程流水线 SKILL 通用版 V2.5

> **一套工具，管所有项目。** 来自真实项目（TBP 躺不平联盟）的 3 个月实战沉淀。
>
> **One toolkit, all projects.** Battle-tested over 3 months on a real project (TBP).
>
> 任何桌面 AI Agent（CodeBuddy / Cursor / Windsurf）一键安装，即刻拥有**会自我进化的**代码质量保障流水线。V2.5 🍞 面包屑自动播种——每次改代码自动建地图。
>
> One-click install for any desktop AI agent — get a **self-evolving** code quality pipeline instantly. V2.5 breadcrumb auto-seeding — every change plants navigation breadcrumbs.

---

## 这是什么？ / What is this?

非程序员在 AI 辅助下总结的质量保障方法论。从 V1（TBP 项目专用）脱壳为 V2（任何项目通用），V2.1 起实现了**规则自动生长**。

A quality-assurance methodology developed by non-programmers with AI assistance. Evolved from V1 (TBP-specific) to V2 (universal), with **self-growing rules** since V2.1.

```
新项目 → 对话式初始化向导（pipeline-init）
New project → conversational init wizard (pipeline-init)
  ↓
改代码前 → 五大原则 + 🍞面包屑预扫描（V2.5）
Before coding → 5-principle check + breadcrumb pre-scan (V2.5)
改代码中 → 终端命令安全封装
During coding → safe terminal execution
改代码后 → self-check (28 rules + trust tiers + 🍞 auto-seeding)
After coding  → web-testing (DOM + screenshot + OCR)
              → changelog + growth detection
              → git commit → closed loop ✅
```

## 🆕 V2.1 新特性 / New Features

### 信任分级规则自生长 / Trust-Tiered Rule Self-Growth

规则不再一成不变。每次开发中踩的坑会自动生长为规则：
Rules evolve automatically. Every pitfall you encounter becomes a rule:

| 级别 Tier | 名称 Name | 行为 Behavior | 晋升条件 Promotion |
|:--|:--|:--|:--|
| Tier 0 | 观察池 / Observation Pool | 仅记录 / Record only | 首次发现 / First sight |
| Tier 1 | [SOFT] 软规则 / Soft Rule | 警告可放过 / Warn, skippable | 置信度 / Confidence ≥ 3 |
| Tier 2 | [HARD] 硬规则 / Hard Rule | 阻断必改 / Block, must fix | 置信度 / Confidence ≥ 5 |

误报过多自动退役，无需人工审核。全程记录在 `growth-log.md`。
Excessive false positives auto-retire. No manual review needed. Full trace in `growth-log.md`.

### 一键分享导出 / One-Click Share Export

Tier 2 规则自动生成分享文本。热心用户可短信分享给开发者。
Tier 2 rules auto-generate shareable text. Enthusiastic users can SMS-share with the developer.

> 💡 **分享给社区 / Share with the community**：在 `pipeline.json` 中填写 `shareContact.phone`（opt-in），当自生长系统发现 Tier 2 硬规则时，会自动生成可分享的文本。
> Fill in `shareContact.phone` in `pipeline.json` (opt-in) — when the self-growing system discovers Tier 2 hard rules, shareable text is auto-generated.

### 对话式项目初始化 / Conversational Project Init

Agent 自动检测新项目意图，对话式收集信息，一键创建项目结构 + fork 流水线模板。
Agent auto-detects new-project intent, collects info conversationally, scaffolds + forks the pipeline in one go.

## 安装 / Install

```bash
# Windows
install.bat

# macOS / Linux
chmod +x install.sh && ./install.sh

# PowerShell (auto template substitution)
.\install.ps1
```

安装后，Agent Memory 中会自动写入新项目检测触发器。下次说"我要做一个XX"时，Agent 会询问是否初始化流水线。
After install, a new-project detection trigger is written to Agent Memory. Say "I want to build X" and the Agent will offer to initialize the pipeline.

## 配置 / Configuration

编辑 `pipeline.json`，填写项目参数：
Edit `pipeline.json` with your project parameters:

```json
{
  "project": {
    "name": "Your Project",
    "port": 3000,
    "testUrl": "http://localhost:3000"
  },
  "selfGrowth": {
    "enabled": true
  }
}
```

也可通过 pipeline-init Skill 对话式自动填充。
Or let the pipeline-init Skill fill it conversationally.

## Skill 清单 / Skill List

| Skill | 功能 / Function | 通用度 / Universal |
|:--|:--|:--:|
| pipeline-init | 🆕 项目初始化向导 / Project init wizard | 100% |
| 编程四大纪律 / Code Discipline | 改前自查：先思考→做减法→精准改→能跑 / Pre-code 4-principle check | 100% |
| safe-terminal-executor | API/终端安全封装 / Safe terminal wrapper | 100% |
| self-check | 28条规则 + 信任分级 + 🍞面包屑 / 28 rules + trust tiers + 🍞 breadcrumbs | 可配置 / Configurable |
| web-testing | 浏览器自动化测试 / Browser automation test | 可配置 / Configurable |
| changelog | 变更日志 + 生长检测 + 分享 / Changelog + growth + share | 可配置 / Configurable |

## 信任分级文件 / Trust Tier Files

| 文件 / File | 说明 / Description |
|:--|:--|
| `self-check/references/observations.md` | Tier 0 观察池 / Observation Pool |
| `self-check/references/retired.md` | 退役规则归档 / Retired Rules Archive |
| `self-check/references/growth-log.md` | 生长事件日志 / Growth Event Log |
| `changelog/references/growth-rules.md` | 生长检测规则定义 / Growth Detection Rules |

## 依赖 / Dependencies

| 依赖 / Dep | 必需？ / Required? | 安装 / Install |
|:--|:--:|:--|
| playwright | 可选 / Optional | `npm install playwright && npx playwright install chromium` |
| tesseract.js | 可选 / Optional | `npm install tesseract.js` |

## 版本 / Versions

- **V2.5.0（当前 / Current）** — 🍞 面包屑自动播种：改前扫描+改后播种
- **V2.4.1** — 四环链式闭环
- **V2.4.0** — 三位一体闭环 + 文档规范体系
- **V2.3.0** — 设计意图锚点 + 注释-文档联动
- **V2.2.0** — 中英双语 + 版本同步 + 重命名
- **V2.1.0（自生长版 / Self-Growing）** — 信任分级 + 分享导出
- **V2.0.0（通用版 / Universal）** — 去耦重构 / Decoupled refactor
- **V1（TBP原型 / TBP Prototype）** — 姊妹目录 `AI编程自动流水线-TBP原型/`

## 许可 / License

Apache 2.0

## 作者 / Author

躺不平联盟
