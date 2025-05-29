#!/bin/bash

# Railway Build Script for Strapi

echo "🚀 Starting Railway build process..."

# Check Node.js version
echo "📋 Node.js version: $(node --version)"
echo "📋 npm version: $(npm --version)"

# Install dependencies
echo "📦 Installing dependencies..."
npm ci

# Generate types
echo "🔧 Generating TypeScript types..."
npm run strapi generate

# Build Strapi
echo "🏗️ Building Strapi application..."
npm run build

echo "✅ Build completed successfully!" 