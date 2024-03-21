#!/usr/bin/env bash


# make script exit on first error
set -e

echo "===================================="
echo "Pulling node:alpine"
echo ""
docker pull node:alpine
echo ""

echo "===================================="
echo "Building node-minimal:latest"
echo ""
docker build $(realpath $(dirname "$0")) -t node-minimal:latest
echo ""


echo "===================================="
echo "Bench result"
echo ""
ORIGIN_NODE_ALPINE_SIZE=$(docker inspect -f "{{ .Size }}" node:alpine)
NODE_MINIMAL_SIZE=$(docker inspect -f "{{ .Size }}" node-minimal:latest)
SIZE_REDUCED=$((ORIGIN_NODE_ALPINE_SIZE-NODE_MINIMAL_SIZE))
echo "Offical image node:alpine     : $(echo $ORIGIN_NODE_ALPINE_SIZE |  numfmt --to=si --format="%.2f")"
echo "Our image node-minimal:laster : $(echo $NODE_MINIMAL_SIZE |  numfmt --to=si --format="%.2f")"
echo "Size has been reduced         : $(echo $SIZE_REDUCED |  numfmt --to=si --format="%.2f")"
