#!/bin/bash
URL="http://localhost/health"

if curl -fsS "$URL" > /dev/null; then
    echo "Application is healthy"
else
    echo "Application is down"
    exit 1
fi