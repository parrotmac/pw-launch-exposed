#!/usr/bin/env bash

set -euo pipefail

# Start server
CONTAINER_ID=$(docker run -d --rm --ipc=host \
  -p 5900:5900 \
  "$(docker build -q .)")

trap "docker stop ${CONTAINER_ID}" EXIT

docker logs -f "${CONTAINER_ID}"
