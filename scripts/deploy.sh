#!/bin/bash

cd /home/ubuntu/app

echo "Installing dependencies..."
npm install

echo "Restarting PM2 app..."
pm2 stop my-app || true
pm2 delete my-app || true
pm2 start index.js --name my-app

pm2 save
