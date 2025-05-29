# 使用标准 Node.js 18 镜像（非 Alpine）
FROM node:18

# 设置工作目录
WORKDIR /app

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# 设置环境变量
ENV NODE_ENV=production
ENV NODE_OPTIONS=--max-old-space-size=2048

# 复制 package 文件
COPY package*.json ./

# 清理 npm 缓存并安装依赖
RUN npm cache clean --force
RUN npm ci --verbose

# 复制源代码
COPY . .

# 构建应用
RUN npm run build

# 暴露端口
EXPOSE 1337

# 启动命令
CMD ["npm", "start"] 