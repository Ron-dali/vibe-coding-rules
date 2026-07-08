# agentskills.io 提交指南

> **为什么重要**：agentskills.io 是 Anthropic 官方的 Agent Skills 开放标准生态。你的 SKILL.md 格式天然兼容。提交上去 = 精准曝光给所有 Claude Code / Cursor / Windsurf 用户。

---

## 前置条件

你的 SKILL.md 需要满足 agentskills.io 的规范：

### ✅ 已有的（符合标准）

- 每个 Skill 有独立的 `SKILL.md` 文件
- `SKILL.md` 包含 `name` / `description` / `tags` / `version` / `author` frontmatter
- 完整的指令内容

### ⚠️ 需要微调的

1. **frontmatter 补全**：agentskills.io 规范建议加 `license` 和 `homepage` 字段：

```yaml
---
name: self-check
description: Mandatory post-code-change self-check checklist...
license: Apache-2.0
homepage: https://github.com/[你的用户名]/vibe-coding-rules
tags: [self-check, code-review, checklist, quality, pipeline]
version: 2.2.0
author: [你的名字]
---
```

2. **添加 `_meta.json`**（如果 agentskills.io 需要）：

```json
{
  "name": "self-check",
  "version": "2.2.0",
  "description": "Post-code-change self-check with 24 rules + trust-tiered self-growing system",
  "author": "[你的名字]",
  "license": "Apache-2.0",
  "homepage": "https://github.com/[你的用户名]/vibe-coding-rules",
  "tags": ["self-check", "code-review", "quality"],
  "category": "development"
}
```

---

## 提交步骤

### 步骤 1：确保 GitHub 仓库就绪

你的 `vibe-coding-rules` 仓库已经包含了完整的 SKILL.md 文件。

### 步骤 2：逐个 Skill 提交

agentskills.io 是一个**社区 Skill 索引**，你需要为每个 Skill 单独提交。

打开 https://agentskills.io/submit（如果有提交入口）或查看 https://github.com/agentskills/agentskills 的 CONTRIBUTING.md。

**建议按以下顺序提交**（最能体现差异化）：
1. `self-check` — 核心卖点（自生长规则系统）
2. `changelog` — 闭环关键（生长检测+防膨胀）
3. `pipeline-init` — 独特卖点（对话式初始化）
4. 编程四大纪律 — 最通用（karpathy-principles）
5. `safe-terminal-executor` — 安全层
6. `web-testing` — 测试层

### 步骤 3：提交内容模板

为每个 Skill 准备一段介绍（英文）：

```
# self-check — Post-Code Self-Check with Self-Growing Rules

A mandatory post-code-change checklist with 24 discipline rules derived from
real-world bug patterns. Features a trust-tiered self-growing system (Tier 0→1→2)
where rules auto-evolve from your development practice. Confidence-driven promotion,
false-positive auto-retirement, and anti-bloat cleanup keep the rule set healthy.

Part of the Vibe Coding Rules pipeline — 6 Skills forming a complete code quality
closed loop from requirement to delivery.

GitHub: https://github.com/[你的用户名]/vibe-coding-rules
```

### 步骤 4：更新各 Skill 的 frontmatter 引用

在每个 SKILL.md 的 frontmatter 中加一行：

```yaml
homepage: https://github.com/[你的用户名]/vibe-coding-rules
```

---

## 如果 agentskills.io 暂时无法提交

### 备选方案 A：GitHub Topics

在你的仓库添加 Topics：`agent-skills` `agentskills` `claude-code-skill` `codebuddy-skill`

### 备选方案 B：anthropics/skills 仓库 PR

如果 Anthropic 接受社区 Skill 提交，参考 https://github.com/anthropics/skills 的贡献指南。

### 备选方案 C：Awesome List

联系以下 Awesome List 维护者：
- `awesome-claude-code` — Claude Code 生态合集
- `awesome-cursorrules` — Cursor 规则合集
- `awesome-ai-agents` — AI Agent 工具合集

---

## 时间线建议

| 时间点 | 动作 |
|:--|:--|
| **Day 0** | GitHub 仓库上线，README + LICENSE 就位 |
| **Day 1-3** | 知乎首文 + V2EX 分享 |
| **Day 3-7** | 尝试 agentskills.io 提交 |
| **Day 7-14** | 多平台推广 + Awesome List 联系 |
| **Month 1** | 观察 Star/Issue/社群增长，调整方向 |
