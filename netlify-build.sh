#!/bin/bash
set -e

echo "🔧 Starting Netlify build..."
echo "Node version: $(node --version)"
echo "NPM version: $(npm --version)"

echo "📦 Installing dependencies..."
npm ci --legacy-peer-deps || npm install --legacy-peer-deps

echo "🏗️ Building project..."
npm run build

echo "✅ Build completed successfully!"
