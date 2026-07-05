---
name: self-check
description: Mandatory post-code-change self-check checklist. Includes universal programming discipline rules, code-type index matrix, configurable registration/truncation/dual-entry checks. Triggers after every code change. Supports pipeline.json project configuration.
tags: [self-check, code-review, checklist, quality, pipeline]
version: 2.0.0
author: laosi
---

# Post-Code-Change Self-Check

## Overview

Mandatory self-check process after every code change. Iterates through rules item by item to prevent repeating known bug patterns.

## Trigger Conditions (read from pipeline.json)

**Must execute** when any of the following occurs:

- {{#if hasToolDirectory}}Modifying files in `{{pipeline.architecture.toolDirectory}}`{{/if}}
- Modifying tool schema (name/description/parameters)
- {{#if hasThreeLayerRegistration}}Modifying `{{pipeline.architecture.fallbackToolsConstant}}` fallback list{{/if}}
- Modifying core task-link code
- {{#if hasDualEntry}}Modifying dual-entry HTML files{{/if}}
- Modifying Express routes
- Modifying database schema

## Self-Check Workflow

### Step 0: Locate Rules by Code Type Changed

Based on what you changed, use the index to locate relevant rules. See `references/self-check-full.md`.

Quick index reference:

| What Changed | Required Rules |
|-------------|----------------|
| New/modified tool | Rules 5,6,7,14 |
| Tool registration/fallback list | Rules 5,6 |
| Data transport pipeline | Rules 5,6,7 |
| Frontend JS | Rules 8,9 |
| Modal/popup/overlay | Rule 12 |
| Express routes | Rules 13,24 |
| Layout refactor | Rule 16 |
| innerHTML rebuild | Rule 18 |
| Async operations | Rule 20 |
| New dependency | Rule 23 |

### Step 1: Architecture Registration Check (optional, per pipeline.json config)

{{#if hasThreeLayerRegistration}}
Check consistency between `{{pipeline.architecture.toolDirectory}}` and `{{pipeline.architecture.fallbackToolsConstant}}`.
Confirm count is `{{pipeline.architecture.toolCount}}`.
{{else}}
Skip (project `pipeline.json` has `architecture.hasThreeLayerRegistration` = false)
{{/if}}

### Step 2: Schema Field Completeness (if tools involved)

Confirm each tool entry has complete `name`/`description`/`parameters`.

### Step 3: Truncation Point Scan (if data transport involved)

{{#if hasTruncationPoints}}
Check the following truncation points:
{{#each pipeline.architecture.truncationPoints}}
- `{{this}}`
{{/each}}
Confirm truncation limits can accommodate maximum data volume.
{{else}}
Skip (no truncation points configured)
{{/if}}

### Step 4: Iterate Through Universal Rules

Select relevant rules by change type. Core rule quick reference:

| Rule | Core | Trigger |
|------|------|---------|
| 8 | No `\|\|` for numeric falsy checks | Frontend JS changes |
| 9 | `<select>` must have placeholder option | Form/dropdown changes |
| 10 | POST upsert must not hardcode fields | Backend route changes |
| 11 | Rule self-growth | Fixed a new type of bug |
| 12 | Overlay must exhaust all close paths | Modal/drawer/overlay |
| 13 | Fixed routes before parameterized routes | Express routes |
| 14 | New tool → add to frontend display-name map | Tool addition |
| 16 | Layout migration: reset old artifacts | CSS/layout refactor |
| 18 | Re-initializable container: sync children | innerHTML rebuild |
| 20 | Async callback: verify context consistency | fetch/async |
| 23 | npm dep: check ESM/CJS compatibility | New dependency |
| 24 | GET/POST same-API data source symmetry | Route changes |

### Step 5: Historical Incident Pattern Match

Think: Could this change reproduce a known incident pattern? Reference `references/incident-history.md`.

### Step 5.5: Trust-Tiered Rule Check (V2.1+)

> This step handles self-growing system generated Trust-Tiered rules. Only executes when project `.ai-pipeline/` exists.

1. **Read observation pool**: `read_file("references/observations.md")`
   - Check if any Tier 0 observation entries relate to this change
   - If related, record "this pattern has been observed N times before"

2. **Read auto-grown rules**: Check `[SOFT]` and `[HARD]` marked rules at the end of `self-check-full.md` in the [Auto-Grown Rules Zone]
   - `[HARD]` rules → mandatory block, must fix
   - `[SOFT]` rules → warn, suggest fix but skippable

3. **User resistance demotion**: If user explicitly says "ignore this rule" or "skip this":
   - Record demotion event in `growth-log.md`
   - `[HARD]` → demote to `[SOFT]` (confidence -2)
   - `[SOFT]` → demote back to `observations.md` observation pool (confidence -2)
   - Confidence hits 0 → move to `retired.md`

4. **Retired rule check**: `read_file("references/retired.md")`
   - If current change pattern matches a retired rule, do NOT alert again

5. **Rule bloat sanity check (V2.2)**: Quick count of active rules
   - Count `[SOFT]` + `[HARD]` rules in `self-check-full.md`
   - If total > `antiBloat.maxTotalRules` (default 30): warn user "规则集过大，下次 changelog 将自动清理"
   - If `[HARD]` > `antiBloat.maxHardRules` (default 15): same warning
   - Note: actual cleanup happens in changelog Step 0.5 — this is just an early warning

### Step 6: Automated Testing (optional)

{{#if pipeline.skills.webTesting.enabled}}
After self-check passes, execute automated tests:
- Check if project `{{pipeline.paths.tests}}` has test scripts
- Run tests and confirm all pass
{{else}}
Skip (webTesting not enabled in pipeline.json)
{{/if}}

### Step 7: Changelog (mandatory)

After self-check + tests all pass, record this change:
- Format: change summary → file list → new deps → self-check digest
- Write to `{{pipeline.paths.changelogFormat}}`
- Must NOT skip or "do it later"

## Related Skill Orchestration

```
karpathy-principles (pre-code principle check)
    ↓
safe-terminal-executor (if API verification needed)
    ↓
self-check (post-code check) ← This Skill
    ↓
web-testing (automated testing, optional)
    ↓
changelog (change log)
    ↓
git commit
    ↓
Delivery closed loop
```

## Resources

- `references/self-check-full.md` — Complete self-check document
- `references/incident-history.md` — Historical incident root cause + lesson quick reference
