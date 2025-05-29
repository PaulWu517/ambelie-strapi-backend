# 使用标准 Node.js 18 镜像（非 Alpine）
FROM node:18

# 设置工作目录
WORKDIR /app

# 安装系统依赖
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    libvips-dev \
    && rm -rf /var/lib/apt/lists/*

# 设置环境变量
ENV NODE_ENV=production
ENV NODE_OPTIONS=--max-old-space-size=3072
ENV npm_config_build_from_source=true
ENV npm_config_target_platform=linux
ENV npm_config_target_arch=x64

# 复制 package 文件
COPY package*.json ./

# 删除可能存在的 node_modules 和锁文件，强制重新安装
RUN rm -rf node_modules package-lock.json

# 清理 npm 缓存
RUN npm cache clean --force

# 重新生成 package-lock.json 并安装依赖
RUN npm install --verbose

# 强制重新编译所有原生模块
RUN npm rebuild

# 复制源代码
COPY . .

# 再次确保原生模块正确编译
RUN npm rebuild @swc/core || true

# 构建应用
RUN npm run build

# 暴露端口
EXPOSE 1337

# 启动命令
CMD ["npm", "start"] 