#!/bin/bash

set -e

APP_DIR="/home/ec2-user/cicd-flask-app"

echo "Moving to app directory..."
cd $APP_DIR

echo "Pulling latest code..."
git pull origin main

echo "Stopping old containers..."
docker compose down

echo "Building and starting containers..."
docker compose up -d --build

echo "Checking running containers..."
docker ps

echo "Deployment completed successfully."