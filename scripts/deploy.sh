#!/bin/bash

cd /var/www/html/nodeapp

npm install

pm2 restart app || pm2 start app.js --name app

pm2 save

sudo systemctl restart apache2
