@echo off
echo ========================================
echo 艾飞雅服饰网站 - GitHub 部署助手
echo ========================================
echo.
echo 请按照以下步骤操作：
echo.
echo 1. 已在GitHub创建仓库（如：aifeiya-website）
echo 2. 复制仓库的HTTPS地址（如：https://github.com/用户名/仓库名.git）
echo 3. 将下面的URL替换为您的实际仓库地址
echo.
echo 按任意键继续，或按Ctrl+C取消...
pause > nul
echo.

set /p GITHUB_URL=请输入GitHub仓库URL（不带引号）:

echo.
echo 正在添加远程仓库...
git remote add origin %GITHUB_URL%

echo 正在重命名分支为main...
git branch -M main

echo 正在推送代码到GitHub...
echo 注意：系统将提示您输入GitHub用户名和密码（使用Personal Access Token）
git push -u origin main

echo.
echo ========================================
echo 完成！
echo ========================================
echo.
echo 接下来：
echo 1. 访问 https://github.com/您的用户名/仓库名/settings/pages
echo 2. 在"Source"部分选择分支：main，文件夹：/(root)
echo 3. 点击Save，等待部署完成
echo 4. 访问您的网站：https://您的用户名.github.io/仓库名
echo.
pause