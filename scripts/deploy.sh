#!/bin/bash

set +e   # don't fail deployment

APP_DIR="/var/www/nodeapp"

echo "===== DEPLOY START ====="

# ensure directory
sudo mkdir -p $APP_DIR
sudo chown -R ubuntu:ubuntu $APP_DIR

cd $APP_DIR || { echo "Directory missing"; exit 0; }

echo "Node version:"
node -v || echo "Node not installed"

echo "NPM version:"
npm -v || echo "NPM not installed"

echo "PM2 version:"
pm2 -v || echo "PM2 not installed"

echo "Installing dependencies..."
npm install || echo "npm install failed"

echo "Restarting app..."
pm2 restart app || pm2 start app.js --name app || echo "pm2 failed"

pm2 save || true

echo "Restarting Apache..."
sudo systemctl restart apache2 || echo "apache restart failed"

echo "===== DEPLOY END ====="
