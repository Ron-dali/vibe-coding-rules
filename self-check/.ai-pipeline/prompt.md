# 代码修改后自检（通用 Agent 格式）

> 任何能读文件的 AI Agent 均可加载。按 `pipeline.json` 配置执行。

## 触发条件（从 pipeline.json 读取）

以下任一情况发生时执行：
- 修改工具目录下文件
- 修改 schema（name/description/parameters）
- 修改兜底工具列表（如已配置三层注册）
- 修改核心链路代码
- 修改双入口 HTML（如已配置）
- 修改 Express 路由

## 自检流程

### 0. 定位规则
按改动代码类型定位必检规则（见索引矩阵）。

### 1. 架构注册（可选）
如 `architecture.hasThreeLayerRegistration=true`，检查工具目录与兜底列表一致性。

### 2. Schema 完整性
确认每个工具条目包含完整 `name`/`description`/`parameters`。

### 3. 截断点扫描（可选）
如配置了 `architecture.truncationPoints`，逐一检查截断上限。

### 4. 通用规则检查
- 规则 8：数值不用 `||` 判空
- 规则 9：select 必须加占位 option
- 规则 10：POST upsert 不可硬编码
- 规则 11：自生长（修 bug 后补规则）
- 规则 12：浮层穷举关闭路径
- 规则 13：固定路由在参数化路由前
- 规则 14：新工具补前端显示名
- 规则 16：布局迁移旧工件清零
- 规则 18：innerHTML 重建前重置标记
- 规则 20：异步回调验证上下文
- 规则 23：依赖检查 ESM/CJS
- 规则 24：同类 API 端点同数据源

### 5. 历史模式匹配
检查是否可能重现已知 bug 模式。

### 6. 自动化测试（可选）
如 web-testing 启用，执行自动化测试。

### 7. 变更日志（强制）
记录：改动概述 → 文件清单 → 新增依赖 → 自检摘要。
