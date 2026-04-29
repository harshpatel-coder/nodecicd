#!/bin/bash

echo "🚀 Deployment started..."

sudo chown -R ubuntu:ubuntu /var/www/html

cd /var/www/html || exit

npm install

pm2 stop test-app || true
pm2 delete test-app || true

pm2 start index.js --name test-app

pm2 save

echo "✅ Deployment done"
