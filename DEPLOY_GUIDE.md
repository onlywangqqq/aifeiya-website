# 网站部署指南

本指南将帮助您将静态网站（HTML、图片、CSS）部署到互联网上，使其可以通过公开链接访问。

## 方案选择

### 1. Netlify（推荐，最简单）
**优点**：免费、自动HTTPS、支持拖拽部署、自定义域名
**缺点**：每月100GB带宽限制（对于企业网站足够）

### 2. Vercel
**优点**：免费、自动HTTPS、适合现代Web应用
**缺点**：功能更偏向开发者

### 3. GitHub Pages
**优点**：完全免费、与GitHub集成
**缺点**：需要Git知识、仓库公开

## 详细部署步骤

### 方案一：使用Netlify（最快，5分钟完成）

1. **访问Netlify网站**：
   - 打开 [https://app.netlify.com](https://app.netlify.com)
   - 使用GitHub、GitLab或邮箱注册

2. **部署网站**：
   - 登录后，点击"Add new site" → "Deploy manually"
   - 将整个文件夹（包含index.html和所有图片）拖拽到上传区域
   - Netlify会自动检测并部署

3. **获取链接**：
   - 部署完成后，Netlify会提供一个类似 `https://your-site-name.netlify.app` 的链接
   - 此链接可分享给任何人访问

4. **自定义域名（可选）**：
   - 在Site settings → Domain management中添加自定义域名
   - 按照指引配置DNS记录

### 方案二：使用GitHub Pages

1. **安装Git**：
   - 下载Git：[https://git-scm.com](https://git-scm.com)
   - 安装后打开命令行

2. **初始化Git仓库**：
   ```bash
   cd "你的文件夹路径"
   git init
   git add .
   git commit -m "初始提交"
   ```

3. **创建GitHub仓库**：
   - 登录GitHub，点击"New repository"
   - 仓库名格式：`username.github.io`（如：aifeiya.github.io）
   - 设置为公开仓库

4. **推送代码**：
   ```bash
   git remote add origin https://github.com/你的用户名/仓库名.git
   git branch -M main
   git push -u origin main
   ```

5. **启用GitHub Pages**：
   - 在仓库设置中，找到"Pages"选项
   - 选择分支为`main`，文件夹为`/(root)`
   - 保存后访问：`https://你的用户名.github.io/仓库名`

### 方案三：使用Vercel

1. **访问Vercel网站**：
   - 打开 [https://vercel.com](https://vercel.com)
   - 使用GitHub账号登录

2. **导入项目**：
   - 点击"New Project"
   - 选择"Import Git Repository"（需要先上传到GitHub）
   - 或选择"Deploy by dragging folder"直接上传文件夹

3. **配置部署**：
   - Vercel会自动检测项目类型
   - 点击"Deploy"开始部署

4. **获取链接**：
   - 部署完成后获得 `https://your-project.vercel.app` 链接

## 本地测试

在部署前，建议先在本地测试网站：

### 方法一：直接打开HTML文件
- 双击`index.html`文件，在浏览器中打开
- 检查所有图片是否正确显示
- 测试所有链接和功能

### 方法二：使用Python简单服务器
```bash
# 打开命令行，进入网站文件夹
cd "你的文件夹路径"

# 启动本地服务器（Python 3）
python -m http.server 8000

# 在浏览器中访问：http://localhost:8000
```

## 常见问题解决

### 1. 图片无法显示
- 检查图片路径是否正确
- 确保图片文件名与HTML中引用的完全一致（包括大小写）
- 确保图片已上传到服务器

### 2. 页面样式错乱
- 检查网络连接，确保CDN资源（如Tailwind CSS）能正常加载
- 检查浏览器控制台错误信息（按F12）

### 3. 部署后无法访问
- 检查部署服务的构建日志
- 确认index.html位于根目录
- 检查是否有防火墙或网络限制

## 下一步建议

1. **获取自定义域名**：
   - 购买域名（如：aifeiya-apparel.com）
   - 在域名注册商处配置DNS，指向部署服务

2. **添加网站分析**：
   - 注册Google Analytics，跟踪访问数据
   - 添加Meta Pixel，用于社交媒体广告追踪

3. **优化SEO**：
   - 完善HTML中的meta标签
   - 添加网站地图sitemap.xml
   - 提交到Google Search Console

## 联系支持

如遇到问题，可联系：
- Netlify支持：https://www.netlify.com/support/
- GitHub支持：https://support.github.com
- Vercel支持：https://vercel.com/contact

---

**祝您部署顺利！** 🚀