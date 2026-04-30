#!/bin/bash

echo "🚀 Deployment started..."

# Go to app directory
cd /var/www/html || exit

# Fix permissions
sudo chown -R ubuntu:ubuntu /var/www/html

# Install dependencies
echo "📦 Installing dependencies..."
npm install -f

# Stop old app
echo "🛑 Stopping old app..."
pm2 stop test-app || true
pm2 delete test-app || true

# Start new app
echo "🚀 Starting app..."
pm2 start index.js --name test-app

# Save PM2 process
pm2 save

echo "✅ Deployment completed successfully!"
