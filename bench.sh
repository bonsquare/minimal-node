#!/usr/bin/env bash
docker pull node:alpine
docker build -t node-minimal:latest $(realpath $(dirname "$0"))
ORIGIN_NODE_ALPINE_SIZE=$(docker inspect -f "{{ .Size }}" node:alpine)
NODE_MINIMAL_SIZE=$(docker inspect -f "{{ .Size }}" node-minimal:latest)
SIZE_REDUCED=$(echo $((ORIGIN_NODE_ALPINE_SIZE-NODE_MINIMAL_SIZE))| numfmt --to=si )
echo "Size has been reduced: $SIZE_REDUCED"
