# 压缩图片同步到GitHub指南

## 场景一：只压缩图片，文件名不变（最简单）

### 步骤1：压缩图片
1. 使用[TinyPNG](https://tinypng.com)压缩图片
2. **重要**：下载时保持原文件名
3. 替换原文件夹中的图片文件

### 步骤2：同步到GitHub
```bash
# 打开命令行，进入网站文件夹
cd "C:\Users\Q\Desktop\公司网站\公司页面"

# 添加更改的图片文件
git add .

# 查看哪些文件被修改
git status

# 提交更改
git commit -m "优化图片大小：压缩PNG/JPG文件"

# 推送到GitHub
git push
```

### 步骤3：等待GitHub Pages更新
- GitHub自动重新部署（1-2分钟）
- 测试网站：[https://onlywangqqq.github.io/aifeiya-website/](https://onlywangqqq.github.io/aifeiya-website/)

## 场景二：改变了文件名或格式

### 如果更改了文件名（如`image.png` → `image_compressed.png`）：
```bash
# 删除原文件（Git会跟踪删除）
git rm Base/jichu1.png

# 添加新文件
git add Base/jichu1_compressed.png

# 更新HTML中的引用（必须！）
# 编辑index.html，更新对应的src路径
```

### 如果转换了格式（如PNG → JPG）：
```bash
# 删除原PNG文件
git rm Base/jichu1.png

# 添加新JPG文件
git add Base/jichu1.jpg

# 更新HTML中的src和格式
# <img src="./Base/jichu1.jpg" alt="...">
```

## 批量操作脚本

创建 `sync-images.bat`（双击运行）：
```batch
@echo off
echo ========================================
echo 图片同步工具
echo ========================================
echo.
echo 步骤：
echo 1. 确保已压缩图片并替换原文件
echo 2. 文件名保持不变
echo 3. 按任意键开始同步...
pause > nul

echo.
echo 正在添加文件...
git add .

echo.
echo 提交更改...
git commit -m "优化图片大小 $(date /t)"

echo.
echo 推送到GitHub...
git push

echo.
echo 完成！等待GitHub Pages部署...
echo 网站：https://onlywangqqq.github.io/aifeiya-website/
pause
```

## 常见问题

### 1. Git提示"nothing to commit"
```bash
# 可能是没有更改，或文件已在暂存区
git status  # 查看状态
git diff    # 查看具体更改
```

### 2. 推送时要求用户名/密码
```bash
# 使用Personal Access Token代替密码
# 生成Token：GitHub → Settings → Developer settings → Personal access tokens
```

### 3. 图片上传但网站不更新
```bash
# 强制GitHub Pages重新构建
# 方法：在仓库中创建一个空提交
git commit --allow-empty -m "触发GitHub Pages重新部署"
git push
```

### 4. 只想提交部分图片
```bash
# 添加特定文件夹
git add Base/ coat/

# 或添加特定文件
git add Base/jichu1.png Base/jichu2.jpg
```

## 最佳实践

### 1. 先测试再提交
```bash
# 本地测试图片是否正常显示
start index.html
```

### 2. 分批次提交
```bash
# 先提交部分图片测试
git add Base/
git commit -m "优化Base文件夹图片"
git push

# 再提交其他文件夹
git add coat/ dress/ Pants/
git commit -m "优化其他产品图片"
git push
```

### 3. 保持原文件名
- 压缩时选择"保留原文件名"
- 避免修改HTML代码
- 减少出错概率

### 4. 验证压缩效果
压缩后检查：
```bash
# 查看文件大小变化
dir Base/ | find "jichu1"
```

## 快速参考

### 命令行备忘
```bash
# 进入项目目录
cd "C:\Users\Q\Desktop\公司网站\公司页面"

# 查看更改
git status

# 添加所有更改
git add .

# 提交
git commit -m "描述更改内容"

# 推送
git push

# 查看推送历史
git log --oneline -5
```

### 文件大小检查
- 原文件备份：`backup/` 文件夹
- 压缩目标：< 300KB
- 特别关注：>1MB的文件

## 注意事项

1. **备份原图**：压缩前复制原图到`backup/`文件夹
2. **测试质量**：确保压缩后图片在网站上显示正常
3. **网络环境**：推送大文件需要稳定网络
4. **时间安排**：建议在非高峰时段操作

## 故障排除

### 推送失败
```bash
# 拉取远程最新更改
git pull origin main

# 解决冲突（如果有）
# 重新推送
git push
```

### 图片显示异常
1. 清除浏览器缓存：Ctrl+F5
2. 检查控制台错误：F12 → Console
3. 验证图片URL：右键图片 → 复制图片地址

### GitHub Pages未更新
1. 检查仓库Settings → Pages
2. 确认分支：main，文件夹：/(root)
3. 等待5-10分钟

---

**最简单的流程**：
1. 用TinyPNG压缩图片，下载时保持原文件名
2. 替换原文件
3. 运行：
   ```bash
   git add .
   git commit -m "压缩图片优化"
   git push
   ```

**完成！** 🚀