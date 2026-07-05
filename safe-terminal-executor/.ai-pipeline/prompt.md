# Safe Terminal Executor（安全终端执行器）

> **通用 Agent 格式。任何能读文件的 Agent 均可加载。**

## 核心规则

| 命令类型 | 处理方式 |
|---------|---------|
| HTTP API 调用（curl/wget） | **禁止直接执行**，生成脚本 |
| 文件操作无网络依赖 | 可直接执行 |
| 预估超过30秒的命令 | 禁止，拆分或生成脚本 |

## 执行流程

1. 判断命令类型（有无网络请求）
2. 生成 `.cjs` 脚本（含：超时兜底 + 步骤日志 + process.exit）
3. 展示脚本 → 确认 → 执行
4. 汇报结果（成功/失败 + 原因）
5. 清理一次性脚本

## POST 请求模板

```javascript
const http = require('http');
const TIMEOUT = setTimeout(() => { console.error('FAIL: 超时'); process.exit(1); }, 10000);

const body = JSON.stringify({ /* params */ });
const options = {
  hostname: 'localhost', port: YOUR_PORT,
  path: '/your-endpoint', method: 'POST',
  headers: { 'Content-Type': 'application/json', 'Content-Length': Buffer.byteLength(body) }
};

console.log(`POST ${options.hostname}:${options.port}${options.path}`);
const req = http.request(options, res => {
  clearTimeout(TIMEOUT);
  let data = '';
  res.on('data', c => data += c);
  res.on('end', () => {
    console.log(`HTTP ${res.statusCode}: ${data.substring(0, 300)}`);
    process.exit(res.statusCode >= 400 ? 1 : 0);
  });
});
req.on('error', e => { clearTimeout(TIMEOUT); console.error(`FAIL: ${e.message}`); process.exit(1); });
req.write(body);
req.end();
```

## 与 web-testing 分工

- safe-terminal-executor: 后端 API / CLI
- web-testing: Web UI / DOM / 交互 / 截图
