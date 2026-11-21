#!/bin/bash
set -e

echo "Building Docker image..."
docker build -t devops-app:v1 .

echo "Removing old container if it exists..."
docker rm -f devops-container 2>/dev/null || true

echo "Starting new container..."
docker run -d \
    --restart unless-stopped \
    -p 80:5000 \
    --name devops-container \
    -e APP_NAME="DevOps Demo" \
    devops-app:v1

echo "Deployment completed!"