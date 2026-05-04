#!/bin/bash
set -e
 
cd /var/www/html
 
# optional cleanup (safe)
rm -rf node_modules
 
# check files exist
ls -la
 
# install dependencies
npm install
