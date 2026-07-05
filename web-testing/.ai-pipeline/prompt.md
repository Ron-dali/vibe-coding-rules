# Web 自动化测试（通用 Agent 格式）

## 配置（从 pipeline.json）

- 测试 URL：{{pipeline.project.testUrl}}
- 测试路径：{{pipeline.project.testPagePath}}
- 测试目录：{{pipeline.paths.tests}}

## 测试类型

1. **冒烟测试**：页面加载 + 关键 DOM + 无 JS 错误
2. **完整测试**：交互 + 表单 + 弹窗 + 异步加载
3. **OCR 验证**：截图文字识别（可选）

## 工作流

1. 检查依赖：`npx playwright install chromium`
2. 创建测试脚本到测试目录
3. 执行测试
4. 汇报结果（通过/失败 + 原因）

## 冒烟测试模板

```javascript
const { chromium } = require('playwright');
(async () => {
  const browser = await chromium.launch();
  const page = await browser.newPage();
  await page.goto('YOUR_TEST_URL');
  await page.waitForLoadState('networkidle');
  const el = await page.$('YOUR_MAIN_CONTAINER');
  if (!el) { console.error('FAIL: 容器不存在'); process.exit(1); }
  console.log('OK');
  await browser.close();
})();
```

## 依赖

- playwright
- tesseract.js + sharp（OCR 可选）
