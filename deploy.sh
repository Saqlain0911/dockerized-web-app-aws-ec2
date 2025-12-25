#!/bin/bash
set -e

APP_NAME="docker-nginx-app"
CONTAINER_NAME="docker-nginx-container"

echo "Pulling latest code..."
git pull origin main

echo "Stopping old container..."
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

echo "Building Docker image..."
docker build -t $APP_NAME .

echo "Starting container..."
docker run -d -p 80:80 --name $CONTAINER_NAME $APP_NAME

echo "Deployment completed successfully."
