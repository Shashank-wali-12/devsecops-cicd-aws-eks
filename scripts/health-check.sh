#!/usr/bin/env bash

set -euo pipefail

URL="${1:-http://localhost/health}"

echo "Checking application health..."
echo "URL: ${URL}"

HTTP_STATUS=$(curl \
  --silent \
  --output /dev/null \
  --write-out "%{http_code}" \
  "${URL}")

if [ "${HTTP_STATUS}" = "200" ]; then
  echo "Application is healthy. HTTP status: ${HTTP_STATUS}"
  exit 0
fi

echo "Application health check failed. HTTP status: ${HTTP_STATUS}"
exit 1
