# Railway 部署指南

## 🚀 在 Railway 上部署 Ambelie Strapi 后端

### 必要的环境变量

在 Railway 项目设置中添加以下环境变量：

#### 1. 应用密钥（必需）
```bash
APP_KEYS=key1,key2,key3,key4
```
**重要**: 请生成4个随机的长字符串作为密钥

#### 2. 安全密钥（必需）
```bash
API_TOKEN_SALT=your-random-salt
ADMIN_JWT_SECRET=your-random-jwt-secret
TRANSFER_TOKEN_SALT=your-random-transfer-salt
JWT_SECRET=your-random-jwt-secret
```

#### 3. 数据库配置（推荐）
```bash
DATABASE_CLIENT=postgres
DATABASE_URL=postgresql://username:password@host:port/database
```

#### 4. 服务器配置
```bash
HOST=0.0.0.0
PORT=1337
NODE_ENV=production
```

#### 5. 管理面板配置
```bash
STRAPI_ADMIN_BACKEND_URL=https://your-app-name.railway.app
```

### 🔧 快速生成密钥

可以使用以下命令生成安全的随机密钥：

```bash
# 生成 APP_KEYS
node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"

# 生成其他密钥
node -e "console.log(require('crypto').randomBytes(64).toString('base64'))"
```

### 📋 部署步骤

1. **连接 GitHub 仓库**到 Railway
2. **添加 PostgreSQL 数据库**服务
3. **配置环境变量**（见上方列表）
4. **部署项目**

### 🐛 常见问题

#### 构建失败
- 确保所有必需的环境变量都已配置
- 检查 Node.js 版本是否兼容（18.x）
- 确认数据库连接字符串正确

#### 启动失败
- 检查 `APP_KEYS` 是否已设置
- 验证数据库连接
- 查看 Railway 日志了解详细错误信息

### 🔍 调试

使用以下命令查看详细日志：
```bash
railway logs
``` 