#!/bin/bash

APP_DIR="/var/www/nodeapp"

echo "🚀 Deployment started"

# go to project directory
cd $APP_DIR || exit

# install dependencies
echo "📦 Installing dependencies"
npm install

# restart or start app
echo "🔄 Restarting app"
pm2 restart app || pm2 start app.js --name app

# save pm2 process
pm2 save

# restart apache (ubuntu)
echo "🌐 Restarting Apache"
sudo systemctl restart apache2

echo "✅ Deployment completed"
