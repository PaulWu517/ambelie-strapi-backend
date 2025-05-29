# 使用 Node.js 18 Alpine 镜像
FROM node:18-alpine

# 设置工作目录
WORKDIR /app

# 设置环境变量
ENV NODE_ENV=production
ENV NODE_OPTIONS=--max-old-space-size=1024

# 复制 package 文件
COPY package*.json ./

# 安装依赖（只安装生产依赖）
RUN npm ci --omit=dev --verbose

# 复制源代码
COPY . .

# 构建应用
RUN npm run build

# 暴露端口
EXPOSE 1337

# 启动命令
CMD ["npm", "start"] 