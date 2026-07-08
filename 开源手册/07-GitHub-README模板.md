# GitHub README 模板

> 使用说明：把下面所有 `[占位符]` 替换成你的实际值，然后放到 GitHub 仓库根目录命名为 `README.md`

---

```markdown
# Vibe Coding Rules — AI编程纪律

<p align="center">
  <b>Vibe Coding needs Rules.</b><br>
  让 AI 守纪律，不是靠祈祷，是靠工程手段。
</p>

<p align="center">
  <a href="#-install"><img src="https://img.shields.io/badge/install-1%20click-brightgreen" alt="Install"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-Apache%202.0-blue" alt="License"></a>
  <a href="#-skills"><img src="https://img.shields.io/badge/skills-6-orange" alt="Skills"></a>
</p>

---

## 这是什么？

一套 AI 编程流水线 Skill 工具包。从"需求 → 交付"全自动闭环，**规则会从你的开发实践中自动生长**。

> Vibe Coding 让你写得爽，Rules 确保不翻车。

```
新项目 → 对话式初始化
  ↓
改代码前 → 四大纪律自查
改代码中 → 终端命令安全封装
改代码后 → 24 条自检 + 信任分级规则自动生长
         → 浏览器自动化测试
         → 变更日志 + 防膨胀
         → ✅ 交付闭环
```

## ✨ 为什么选它

| 特性 | 说明 |
|:--|:--|
| 🧬 **规则自生长** | 踩过的坑自动变成规则，Tier 0→1→2 信任分级，不再踩第二次 |
| 🛡️ **24 条实战纪律** | 来自 3 个月真实项目的 bug 沉淀，不是空泛的"最佳实践" |
| 🌐 **双语+零门槛** | 中英双语 README，对话式向导，非程序员也能用 |
| 🔧 **6 Agent 兼容** | CodeBuddy / Cursor / Claude Code / Windsurf / Cline / 通用 |

## 📦 安装

### 一键安装

```bash
# Windows
install.bat

# macOS / Linux
chmod +x install.sh && ./install.sh
```

支持自动检测 CodeBuddy / Cursor / 通用模式。

### 手动安装

复制 Skill 文件夹到对应目录：

| IDE | 路径 |
|-----|------|
| CodeBuddy | `~/.codebuddy/skills/` |
| Cursor | `.cursor/rules/` |
| 通用 | `.ai-pipeline/` |

## 🧩 Skill 清单

| Skill | 角色 | 通用度 |
|:--|:--|:--:|
| 🔰 项目初始化 | 对话式创建项目 + fork 流水线 | 100% |
| 📏 编程四大纪律 | 改前自查：先思考→做减法→精准改→能跑 | 100% |
| 📟 安全终端 | 网络命令走脚本，超时保护 | 100% |
| ✅ 自动自检 | 24 条纪律 + 信任分级规则 + 历史模式匹配 | 可配置 |
| 🧪 自动化测试 | Playwright 浏览器测试（DOM+截图+OCR） | 可配置 |
| 📝 变更日志 | 变更记录 + 生长检测 + 防膨胀 | 可配置 |

## 🧬 自生长规则系统

规则不是写死的——每次开发中踩的坑会自动生长：

| 级别 | 行为 | 晋升条件 |
|:--|:--|:--|
| Tier 0 观察池 | 仅记录 | 首次发现 |
| Tier 1 [SOFT] 软规则 | 警告可放过 | 置信度 ≥ 3 |
| Tier 2 [HARD] 硬规则 | 阻断必改 | 置信度 ≥ 5 |

误报自动退役，过期自动清理。全过程记录在 `growth-log.md`。

## 🔧 配置

编辑 `pipeline.json`：

```json
{
  "project": {
    "name": "[你的项目名]",
    "port": 3000
  },
  "selfGrowth": {
    "enabled": true
  },
  "selfGrowth.antiBloat": {
    "maxTotalRules": 30
  }
}
```

也可通过对话式初始化自动填充。

## 🌍 兼容性

| Agent | 兼容度 |
|:--|:--:|
| CodeBuddy | ★★★★★ |
| Cursor | ★★★★☆ |
| Claude Code | ★★★★☆ |
| Windsurf / Cline | ★★★★☆ |

## 📄 许可

Apache 2.0 — 详见 [LICENSE](LICENSE)

## 👤 作者

**[你的名字/品牌]** — AI 编程爱好者，3 个月 200+ 次 AI 编程交互中总结的这套纪律体系。

---

> 💡 **规则会自生长，护城河会越来越深。** 你今天装的这套规则，半年后已经进化成了专属于你项目的质量守门员。
```

---

## 占位符替换清单

| 占位符 | 替换为 |
|:--|:--|
| `[你的项目名]` | 你的实际项目名 |
| `[你的名字/品牌]` | laosi / 躺不平联盟 |
| GitHub Topics | `vibe-coding` `rules` `skill` `ai-coding` `code-quality` `codebuddy` `cursor` `self-growing` |
