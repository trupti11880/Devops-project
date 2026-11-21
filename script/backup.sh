#!/bin/bash
set -e
mkdir -p backups

docker logs devops-container \
    > "backups/app-$(date +%Y%m%d-%H%M%S).log"

echo "Application logs backed up"s