#!/bin/bash

echo "🚀 Deployment started..."

# Go to app directory
cd /var/www/html || exit

echo "📦 Installing dependencies..."
npm install --production

echo "🛑 Stopping old app..."
pm2 stop node-hello || true
pm2 delete node-hello || true

echo "🧹 Cleaning old logs..."
pm2 flush

echo "🚀 Starting app..."
pm2 start index.js --name node

echo "💾 Saving pm2 process..."
pm2 save

echo "🔁 Restarting pm2 startup (optional)"
pm2 startup systemd -u ubuntu --hp /home/ubuntu

echo "✅ Deployment finished successfully!"
