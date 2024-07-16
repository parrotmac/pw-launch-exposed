#!/usr/bin/env bash

set -euo pipefail

# Start server
CONTAINER_ID=$(docker run -d --rm --ipc=host \
  -p 5900:5900 \
  "$(docker build -q .)")

trap "docker stop ${CONTAINER_ID}" EXIT

# Wait for server to start
while ! nc -z localhost 5900; do
  sleep 1
done
echo "Server expected to have started on port 5900"
docker logs -f "${CONTAINER_ID}" &

pnpm exec playwright test
