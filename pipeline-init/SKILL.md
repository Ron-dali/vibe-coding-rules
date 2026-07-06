# pipeline-init — Project Initialization Wizard

> Conversational project info collection → dependency detection → scaffold creation → pipeline template fork → ready in one go.

## Trigger Conditions

Activate when any of the following occurs:
- User says "I want to build X project", "Help me init the pipeline", "New project"
- Memory trigger hits new-project intent
- User mentions starting a new project

## Workflow

### Step 0: Language Selection

Follow `references/init-dialog.md` Phase 0 to ask the user's preferred language. All subsequent generated docs, memory files, and changelogs MUST use the selected language.

### Step 1: Conversational Collection

Follow `references/init-dialog.md` template to progressively collect:

1. **Project name**: Ask for the project name
2. **Tech stack**: Present common options with descriptive names (no jargon required)
3. **Project type**: Web app / Backend API / Desktop app / Mini-program / Full-stack
4. **Auto-testing needed?**: Default yes

### Step 2: Dependency Detection

Follow `references/tech-stack-checklist.md` to check environment:
- Node.js version (`node -v`)
- npm version (`npm -v`)
- Git installed? (`git --version`)
- Additional deps based on tech stack

On failure: provide plain-language install guides. Do NOT force full install — mark missing items for user to install later.

### Step 3: Create Project Structure

Based on tech stack and project type, create minimal project structure:
```
project-name/
├── .ai-pipeline/           # Pipeline directory
│   ├── pipeline.json       # Populated project config
│   ├── VERSION             # Single source of truth for version (init: 0.1.0)
│   └── self-check/
│       └── references/
│           ├── self-check-full.md
│           ├── incident-history.md
│           ├── observations.md
│           ├── retired.md
│           └── growth-log.md
├── README.md               # Project readme (no hardcoded version, reference .ai-pipeline/VERSION)
└── Other base files (per tech stack)
```

**README.md content requirements**:
- Written in user's chosen language
- No hardcoded version numbers (e.g. `v1.0.0`); write "current version: see `.ai-pipeline/VERSION`"
- Must include: project intro, tech stack, quick start, pipeline usage guide

### Step 4: Fork Pipeline Template

From the globally installed template (`开发文档/开发者自创工具/AI编程流水线SKILL通用版/`), copy to `project/.ai-pipeline/`:

- `self-check/SKILL.md`
- `self-check/references/self-check-full.md`
- `self-check/references/incident-history.md`
- `changelog/SKILL.md`
- `changelog/references/growth-rules.md`
- `pipeline.json` (template, then replace with populated version)
- `VERSION` file (write `2.5.0` and current date)

**Critical**: Only copy universal template Skill files. `coding-principles` / `safe-terminal-executor` / `web-testing` do NOT use project-local copies (they always load from global install).

### Step 5: Populate pipeline.json

Write Step 1 collected info into `project/.ai-pipeline/pipeline.json`:
- `project.name` → project name
- `project.type` → mapped project type
- `project.port` → default port per tech stack
- `paths.*` → adjusted per project structure (changelog, tests, publicDir, etc. mapped individually)
- `init.completed` → `true`
- `init.createdAt` → current ISO timestamp

### Step 6: Write Project Memory

Using the language chosen in Step 0, append to project's `.codebuddy/memory/MEMORY.md`:
```markdown
## Vibe Coding Rules (V2.5 auto-initialized on YYYY-MM-DD)

Pipeline files are in `.ai-pipeline/`. Rules grow automatically from development practice.

Development loop:
1. 5 coding principles (pre-code check)
2. Safe terminal execution
3. Write code
4. self-check (rule check + trust-tiered growth)
5. web-testing (automated testing)
6. changelog (change log + growth detection + share export)
```

(Do NOT wrap in markdown code blocks — this is actual memory content being written.)

### Step 7: Confirm Completion

Report to user:
- List of created project structure
- Populated config items
- Pipeline ready — enjoy self-growing code quality assurance
