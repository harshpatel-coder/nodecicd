#!/bin/bash

echo "🚀 React Deployment started..."

# Ensure folder exists
sudo mkdir -p /var/www/html/react

# Fix permissions
sudo chown -R ubuntu:ubuntu /var/www/html/react

echo "🧹 Cleaning old files..."
rm -rf /var/www/html/react/*

echo "📦 Copying new build files..."
cp -r build/* /var/www/html/react/

echo "✅ React deployed successfully!"
