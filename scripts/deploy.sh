#!/bin/bash

APP_DIR="/var/www/html/nodeapp"

cd $APP_DIR

npm install

pm2 restart app || pm2 start app.js --name app

pm2 save

sudo systemctl restart apache2
