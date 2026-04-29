#!/bin/bash

echo "🚀 Deployment started..."

# Fix permission
sudo chown -R ubuntu:ubuntu /var/www/html

cd /var/www/html || exit

echo "📦 Installing dependencies..."
npm install --unsafe-perm

echo "🛑 Stopping old app..."
pm2 stop test-app || true
pm2 delete test-app || true

echo "🚀 Starting app..."
pm2 start index.js --name test-app

pm2 save

echo "✅ Deployment done"
