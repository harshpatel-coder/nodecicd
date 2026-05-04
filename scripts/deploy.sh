#!/bin/bash

cd /var/www/html/nodeapp || exit

npm install

pm2 delete app || true

# use package.json start (recommended)
pm2 start npm --name app -- start

pm2 save

sudo systemctl restart apache2
