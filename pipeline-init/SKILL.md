---
name: pipeline-init
version: 2.7.0
---

# pipeline-init — Project Initialization Wizard V2.7

> Conversational project info collection → dependency detection → scaffold creation → pipeline template fork → ready in one go.
> V2.6 adds Step -1: Platform Detection → Memory Self-Heal → Project State Detection with three-path handling.
> V2.7 softens Memory seeding: discover + suggest, not force-write. Cross-platform compatibility first.

## Trigger Conditions

Activate when any of the following occurs:
- User says "I want to build X project", "Help me init the pipeline", "New project"
- Memory trigger hits new-project intent
- User mentions starting a new project
- **V2.6**: Skill first loaded in ANY project (runs Step -1 for memory self-heal)

## Workflow

### Step -1: Pre-Initialization Detection（V2.6 NEW — Run first on every skill load）

This step runs BEFORE any other workflow. It is **idempotent** — safe to run repeatedly.

#### Step -1.0: Platform Detection（确定 Memory 文件路径）

Detect which AI coding tool the user is using, and map to its memory/rules file:

| Detection Condition | Tool | Memory File |
|:--|:--|:--|
| `~/.codebuddy/skills/` directory exists | CodeBuddy | `.codebuddy/memory/MEMORY.md` |
| `.cursor/rules/` directory exists | Cursor | `.cursor/rules/vibe-coding-rules.mdc` |
| `.windsurfrules` file exists | Windsurf | `.windsurfrules` |
| `CLAUDE.md` file exists | Claude Code | `CLAUDE.md` |
| `.github/copilot-instructions.md` exists | GitHub Copilot | `.github/copilot-instructions.md` |
| None of the above | Generic fallback | `.ai-pipeline/MEMORY.md` |

Store detected `memoryPath` for use in Step -1.a and Step 6.

#### Step -1.a: Memory Integrity Check & Self-Heal（每次加载必执行，幂等）

1. Read the file at `memoryPath` (from Step -1.0)
2. Check for 5 critical sections (using fuzzy markdown heading match):
   - `"Skill依赖链"` or `"Skill 编排"` or `"Skill Orchestration"`
   - `"强制自检硬规则"` or `"步骤6（测试）不可跳过"` or `"Step 6 mandatory"`
   - `"开发文档标准路径"` or `"Dev doc standard paths"`
   - `"面包屑规则"` or `"breadcrumb"`
   - `"项目初始化状态"` or `"已初始化"` or `"initialization status"`
3. If ANY section is missing → **detect and report** (V2.7: do NOT auto-write without confirmation)
4. Report missing sections to user: "发现 Memory 文件缺少 [N] 个关键段落：[list]。是否自动补全？(是 / 跳过)"
5. Only write to `memoryPath` after explicit user confirmation
6. If file does not exist → ask: "没有检测到 Memory 文件，要创建吗？(是 / 先不要)"
7. Record in log: `self-healed: [list]` or `self-heal-skipped: [list]`

**Why V2.7 changed from auto-write to confirm / 为什么改为确认而非自动写入**: Different platforms have different memory file formats (`.mdc` for Cursor, `.codebuddy/memory/` for CodeBuddy, `CLAUDE.md` for Claude Code). Blind auto-writing can break platform-specific syntax or interfere with user's existing configuration. Discovery is universal; writing requires consent.

**File format adaptation**:
- `.mdc` files (Cursor): add YAML frontmatter (`---\ndescription: Vibe Coding Rules\nalwaysApply: true\n---`) before markdown
- `.md` / `.windsurfrules` / `CLAUDE.md`: plain markdown

**This step runs on EVERY skill activation** — not just first time. It ensures the pipeline's critical rules are always present in memory, preventing AI from skipping mandatory steps.

#### Step -1.b: Project State Detection

After memory self-heal, detect project state:

1. Check if project root has code files (`.js`, `.html`, `.py`, `.ts`, etc.)
   → NO → **Path A: New Project**
2. Check if `开发文档/` directory exists (or configured `devDocs` path)
   → NO → **Path C: Existing Project Without Docs**
3. Check if `开发文档/00-必读/开发文档管理.md` exists
   → YES → **Path B: Existing Project With Docs**
   → NO → **Path C: Existing Project Without Docs**

#### Path A: New Project

Proceed with standard pipeline-init workflow (Step 0 through Step 7 below).

#### Path B: Existing Project With Docs — Compliance Scan

1. Run DOC_SPEC compliance scan:
   - Check all docs in `开发文档/` have `📋 管理规范见` reference in header
   - Check no orphan files in wrong directories
   - Check file size limits (≤500 lines)
   - Verify `📖` references point to existing docs
   - Verify management doc index is up to date
2. Output a report: `[N] missing 📋 references | [N] files over limit | [N] broken 📖 links`
3. Ask user: "Found some documentation issues. Fix them now or later?"
4. If user says "fix now" → repair issues (add 📋, split large files, fix broken links)

#### Path C: Existing Project Without Docs — Bootstrap

1. Create standard dev doc directory structure:
   ```
   开发文档/
   ├── 00-必读/
   │   └── 开发文档管理.md     (create from template)
   ├── 01-变更日志/
   ├── 02-项目参考/
   ├── 03-架构设计/
   ├── 04-方案设计/
   └── 待办事项/
   ```
2. Create `开发文档管理.md` with proper structure (decision tree + index)
3. Scan existing code and auto-populate:
   - Scan for Express routes → write to `00-必读/接口契约.md` skeleton
   - Scan for tool/module definitions → write code file index
   - Mark gaps as `<!-- TODO: 待补充 -->`
4. Run first mandatory baseline self-check:
   - Execute full self-check cycle on existing code
   - Write findings to `01-变更日志/变更日志-YYYY-MM-DD.md`
   - Mark any issues as "baseline finding — not a regression"
5. Report to user: "I've created the dev docs structure and ran an initial self-check. Here's what I found..."

### Step 0: Language Selection

Follow `references/init-dialog.md` Phase 0 to ask the user's preferred language. All subsequent generated docs, memory files, and changelogs MUST use the selected language.

### Step 1: Conversational Collection

Follow `references/init-dialog.md` template to progressively collect:
1. **Project name**, 2. **Tech stack**, 3. **Project type**, 4. **Auto-testing needed?** (default yes)

### Step 2: Dependency Detection

Check environment: Node.js version, npm, Git, additional deps per tech stack.
On failure: provide plain-language guides. Mark missing items for later.

### Step 3-5: Create Structure + Fork Template + Populate pipeline.json

Create `.ai-pipeline/` with `pipeline.json`, `VERSION` (2.7.0), and self-check references.
Fork `self-check` and `changelog` Skill templates. Populate project config.
Write `README.md` with proper language and no hardcoded versions.

### Step 6: Write Project Memory

Using the Step -1.0 detected platform, append V2.6 pipeline enforcement rules to the memory file, including:
- Skill dependency chain (mandatory order)
- Force self-check hard rules (Step 6 mandatory, Step 5.5 integrity gate)
- Dev doc standard paths
- Breadcrumb rules
- Initialization status marker

### Step 7: Confirm Completion

Report created structure, config items, and pipeline readiness.
If memory was self-healed in Step -1.a, mention which sections were repaired.
