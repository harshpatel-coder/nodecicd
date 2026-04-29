#!/bin/bash

echo "🚀 Deployment started..."

cd /var/www/html || exit

echo "📦 Installing dependencies..."
npm install --unsafe-perm

echo "🚀 Restarting app..."

pm2 describe test-app > /dev/null
if [ $? -eq 0 ]; then
  pm2 restart test-app
else
  pm2 start index.js --name test-app
fi

pm2 save

echo "✅ Deployment done"
