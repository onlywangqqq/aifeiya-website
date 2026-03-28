# GitHub Pages 部署指南

本指南将帮助您将网站部署到 GitHub Pages，获得免费的公开访问链接。

## 已完成步骤
✅ Git仓库已初始化
✅ 所有文件已提交到本地仓库

## 下一步：创建GitHub仓库

1. **登录GitHub**
   - 访问 [https://github.com](https://github.com)
   - 如果没有账号，请先注册

2. **创建新仓库**
   - 点击右上角"+" → "New repository"
   - 填写仓库名称：
     - 如果要使用 `username.github.io` 域名：仓库名必须为 `你的用户名.github.io`
     - 如果使用项目页面：仓库名可以是任意名称，如 `aifeiya-website`
   - 选择"Public"（公开）
   - **不要**勾选"Initialize this repository with a README"
   - 点击"Create repository"

## 推送代码到GitHub

### 方法一：使用命令行（推荐）

1. **复制远程仓库URL**
   - 创建仓库后，复制提供的HTTPS链接，如：
     ```
     https://github.com/你的用户名/仓库名.git
     ```

2. **打开命令行工具**
   - 在网站文件夹中右键，选择"Git Bash Here"（如果已安装Git）
   - 或打开CMD/PowerShell，使用 `cd` 命令进入文件夹：
     ```bash
     cd "C:\Users\Q\Desktop\公司网站\公司页面"
     ```

3. **添加远程仓库并推送**
   ```bash
   # 添加远程仓库（将下面的URL替换为您的实际URL）
   git remote add origin https://github.com/你的用户名/仓库名.git

   # 重命名默认分支为main（如果尚未）
   git branch -M main

   # 推送代码到GitHub
   git push -u origin main
   ```

4. **输入GitHub凭证**
   - 系统会提示输入GitHub用户名和密码
   - 如果使用HTTPS，密码需要使用Personal Access Token（见下方说明）

### 方法二：使用GitHub Desktop
1. 下载并安装 [GitHub Desktop](https://desktop.github.com/)
2. 打开GitHub Desktop，选择"File" → "Add Local Repository"
3. 选择当前文件夹
4. 点击"Publish repository"，按照提示操作

## 启用GitHub Pages

1. **进入仓库设置**
   - 在GitHub仓库页面，点击"Settings"标签
   - 左侧菜单选择"Pages"

2. **配置GitHub Pages**
   - 在"Source"部分，选择分支：`main`
   - 选择文件夹：`/(root)`
   - 点击"Save"

3. **等待部署完成**
   - GitHub会自动构建并部署网站
   - 通常需要1-2分钟
   - 部署完成后，会显示绿色横幅，提供您的网站URL

## 访问您的网站

- 如果仓库名为 `用户名.github.io`，访问：`https://用户名.github.io`
- 如果仓库名为其他名称，访问：`https://用户名.github.io/仓库名`

## 重要注意事项

### 1. 关于Personal Access Token
由于GitHub不再支持密码验证，您需要创建Personal Access Token：

1. 登录GitHub，点击右上角头像 → "Settings"
2. 左侧菜单选择"Developer settings" → "Personal access tokens" → "Tokens (classic)"
3. 点击"Generate new token" → "Generate new token (classic)"
4. 勾选"repo"权限
5. 生成后**立即复制token**（只显示一次）

推送时，使用token代替密码：
```bash
# 用户名：您的GitHub用户名
# 密码：粘贴刚才复制的token
```

### 2. 自定义域名（可选）
如需使用自定义域名（如aifeiya-apparel.com）：

1. 在仓库Settings → Pages中，添加自定义域名
2. 在域名注册商处配置DNS记录：
   - 类型：CNAME
   - 名称：www（或@）
   - 目标：您的用户名.github.io

### 3. 更新网站内容
更新网站后，只需提交并推送更改：
```bash
git add .
git commit -m "更新描述"
git push
```

## 故障排除

### 图片无法显示
- 检查GitHub仓库中图片路径是否正确
- 确保HTML中使用的路径是相对路径（如 `./coat/waitao1.png`）
- 在GitHub仓库中浏览文件，确认图片已上传

### 页面样式错乱
- GitHub Pages可能默认使用Jekyll，需要在根目录添加 `.nojekyll` 文件：
  ```bash
  echo "" > .nojekyll
  git add .nojekyll
  git commit -m "添加.nojekyll文件"
  git push
  ```

### 404错误
- 确认GitHub Pages已启用并部署成功
- 检查仓库Settings → Pages中配置的分支和文件夹
- 等待几分钟让部署生效

## 后续维护

1. **备份代码**：您的代码已保存在GitHub，可随时克隆到其他电脑
2. **版本控制**：每次更改都应提交并推送，便于回滚
3. **定期更新**：保持内容新鲜，吸引访客

## 获取帮助

- GitHub Pages文档：https://docs.github.com/pages
- Git官方文档：https://git-scm.com/doc
- 如遇问题，可在GitHub仓库中提交Issue

---

**您的网站现已准备好部署到GitHub Pages！** 🚀