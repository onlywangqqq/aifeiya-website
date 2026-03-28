@echo off
echo ========================================
echo 图片同步到GitHub工具
echo ========================================
echo.
echo 前提条件：
echo 1. 已用TinyPNG压缩图片
echo 2. 已用压缩图片替换原文件
echo 3. 文件名保持不变
echo.
echo 按任意键开始同步，或按Ctrl+C取消...
pause > nul
echo.

echo 步骤1：检查当前状态...
git status
echo.

echo 步骤2：添加所有更改的文件...
git add .
echo.

echo 步骤3：提交更改...
git commit -m "优化图片大小：压缩网页图片 %date% %time%"
echo.

echo 步骤4：推送到GitHub...
echo 注意：如果提示输入用户名/密码
echo 用户名：您的GitHub用户名
echo 密码：使用Personal Access Token（不是登录密码）
echo.
git push
echo.

echo ========================================
echo 同步完成！
echo ========================================
echo.
echo 接下来：
echo 1. GitHub Pages会自动重新部署（约1-2分钟）
echo 2. 测试网站：https://onlywangqqq.github.io/aifeiya-website/
echo 3. 在手机上检查图片是否正常显示
echo.
echo 如果推送失败：
echo 1. 检查网络连接
echo 2. 确认GitHub凭证正确
echo 3. 运行：git pull origin main （先拉取最新更改）
echo.
pause