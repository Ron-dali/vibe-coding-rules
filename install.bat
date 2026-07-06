@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ========================================
echo   Vibe Coding Rules - 安装程序
echo   Vibe Coding Rules - Installer
echo   Version 2.5.0
echo ========================================
echo.

REM === 检测 IDE/Agent 类型 ===
set "SKILL_DIR="
set "AGENT_TYPE=unknown"

REM 检测 CodeBuddy
if exist "%USERPROFILE%\.codebuddy\skills\" (
    set "SKILL_DIR=%USERPROFILE%\.codebuddy\skills"
    set "AGENT_TYPE=codebuddy"
    echo [DETECT] CodeBuddy environment ^| CodeBuddy 环境
)

REM 检测 Cursor
if exist ".cursor\rules\" (
    if "%AGENT_TYPE%"=="unknown" set "AGENT_TYPE=cursor"
    echo [DETECT] Cursor environment ^| Cursor 环境
)

REM 默认：通用 .ai-pipeline
if "%AGENT_TYPE%"=="unknown" (
    echo [DETECT] No known IDE detected, using generic mode ^(.ai-pipeline^)
    echo         未检测到已知 IDE，使用通用模式
    set "AGENT_TYPE=generic"
)

echo [TARGET] %AGENT_TYPE%
echo.

REM === 引导填写 pipeline.json ===
if not exist "pipeline.json" (
    echo [CONFIG] pipeline.json not found, using default template
    echo         请编辑 pipeline.json 填入项目参数后重新运行
)

REM === 安装 Skill ===
if "%AGENT_TYPE%"=="codebuddy" (
    echo [INSTALL] Copying skills to CodeBuddy dir... ^| 复制到 CodeBuddy 目录...
    
    REM 复制各 Skill
    xcopy /E /I /Y "pipeline-init" "%SKILL_DIR%\pipeline-init\" >nul
    xcopy /E /I /Y "coding-principles" "%SKILL_DIR%\coding-principles\" >nul
    xcopy /E /I /Y "safe-terminal-executor" "%SKILL_DIR%\safe-terminal-executor\" >nul
    xcopy /E /I /Y "self-check" "%SKILL_DIR%\self-check\" >nul
    xcopy /E /I /Y "web-testing" "%SKILL_DIR%\web-testing\" >nul
    xcopy /E /I /Y "changelog" "%SKILL_DIR%\changelog\" >nul
    
    echo   pipeline-init          [OK]
    echo   coding-principles       [OK]
    echo   safe-terminal-executor [OK]
    echo   self-check             [OK]
    echo   web-testing            [OK]
    echo   changelog              [OK]
    
    REM === 写入 Memory 触发器 ===
    echo.
    echo [MEMORY] Writing Agent memory trigger... ^| 写入记忆触发器...
    set "MEMORY_DIR=%USERPROFILE%\.codebuddy\memory"
    if not exist "%MEMORY_DIR%" mkdir "%MEMORY_DIR%"
    
    REM 读取 MEMORY_BOOTSTRAP.md 模板并写入
    if exist "MEMORY_BOOTSTRAP.md" (
        echo. >> "%MEMORY_DIR%\MEMORY.md"
        echo --- >> "%MEMORY_DIR%\MEMORY.md"
        type "MEMORY_BOOTSTRAP.md" >> "%MEMORY_DIR%\MEMORY.md"
        echo   Memory trigger written [OK] ^| 触发器写入完成
    ) else (
        echo   [SKIP] MEMORY_BOOTSTRAP.md not found ^| 文件不存在
    )
)

REM === 通用模式：创建 .ai-pipeline ===
if "%AGENT_TYPE%"=="generic" (
    echo [INSTALL] Creating .ai-pipeline dir... ^| 创建 .ai-pipeline 目录...
    if not exist ".ai-pipeline" mkdir ".ai-pipeline"
    
    REM 复制各 Skill 的 .ai-pipeline 内容
    copy /Y "coding-principles\.ai-pipeline\prompt.md" ".ai-pipeline\01-coding-principles.md" >nul
    copy /Y "safe-terminal-executor\.ai-pipeline\prompt.md" ".ai-pipeline\02-safe-terminal-executor.md" >nul
    copy /Y "self-check\.ai-pipeline\prompt.md" ".ai-pipeline\03-self-check.md" >nul
    copy /Y "web-testing\.ai-pipeline\prompt.md" ".ai-pipeline\04-web-testing.md" >nul
    copy /Y "changelog\.ai-pipeline\prompt.md" ".ai-pipeline\05-changelog.md" >nul
    copy /Y ".ai-pipeline\README.md" ".ai-pipeline\README.md" >nul
    
    echo   .ai-pipeline/ created [OK] ^| 创建完成
)

echo.
echo ========================================
echo   安装完成！ / Installation Complete!
echo ========================================
echo.
echo Next steps ^| 下一步：
echo   1. Edit pipeline.json with project params
echo      编辑 pipeline.json 填入项目参数
echo   2. Install optional deps ^(if needed^)：
echo      npm install playwright
echo      npx playwright install chromium
echo   3. Start coding in your Agent ^| 在 Agent 中开始编程
echo   4. New project? Agent will auto-offer pipeline init
echo      新建项目时，Agent 会自动询问是否初始化
echo.
pause
