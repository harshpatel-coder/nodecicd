#!/bin/bash

cd /var/www/html

npm install

pm2 restart all || pm2 start app.js

sudo systemctl restart apache2
