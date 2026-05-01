#!/bin/bash

echo "🚀 Deployment started..."

cd /var/www/html || exit

# FIX permissions (IMPORTANT)
sudo chown -R ubuntu:ubuntu /var/www/html

# Clean install
rm -rf node_modules
rm -f package-lock.json

npm install --unsafe-perm

# Stop old app
pm2 delete test-app || true

# Start fresh
pm2 start index.js --name test-app

pm2 save

echo "✅ Deployment completed"
