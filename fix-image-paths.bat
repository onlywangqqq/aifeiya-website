@echo off
echo ========================================
echo 图片路径修复工具
echo ========================================
echo.
echo 本脚本将：
echo 1. 重命名 Base -> base
echo 2. 重命名 Pants -> pants
echo 3. 更新HTML中的图片路径
echo.
echo 按任意键继续，或按Ctrl+C取消...
pause > nul
echo.

echo 备份原index.html...
copy index.html index.html.backup

echo.
echo 正在重命名文件夹...
git mv Base base 2>nul
if errorlevel 1 (
    echo 注意：Git无法重命名Base文件夹（可能已存在base文件夹）
    echo 将直接修改HTML中的路径引用
)

git mv Pants pants 2>nul
if errorlevel 1 (
    echo 注意：Git无法重命名Pants文件夹（可能已存在pants文件夹）
    echo 将直接修改HTML中的路径引用
)

echo.
echo 正在更新HTML文件中的路径引用...

:: 使用PowerShell进行文本替换（更可靠）
powershell -Command "
\$content = Get-Content 'index.html' -Raw
\$content = \$content -replace '\./Base/', './base/'
\$content = \$content -replace '\./Pants/', './pants/'
Set-Content 'index.html' -Value \$content -Encoding UTF8
"

echo HTML文件已更新！

echo.
echo 正在提交更改...
git add index.html
if exist base git add base
if exist pants git add pants
git commit -m "修复图片路径大小写问题：Base->base, Pants->pants"

echo.
echo ========================================
echo 完成！
echo ========================================
echo.
echo 请手动推送更改到GitHub：
echo git push
echo.
echo 然后等待GitHub Pages重新部署（约1-2分钟）
echo 测试网站：https://onlywangqqq.github.io/aifeiya-website/
echo.
pause