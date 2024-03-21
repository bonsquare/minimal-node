#!/usr/bin/env bash

echo "===================================="
echo "Building node-minimal:latest"
echo ""
docker build -t node-minimal:latest $(realpath $(dirname "$0"))
echo ""

echo "===================================="
echo "Run test container"
echo ""
rm -rf test/output
docker compose -f test/compose.yaml down
docker compose -f test/compose.yaml up -d --build
echo ""

echo "===================================="

echo ""
timeout --preserve-status 2 bash -c '< /dev/tcp/localhost/8080'
if [ "$?" -ne 0 ]; then
   echo "Testing result: failed"
   exit 1
else
   echo "Testing result: success"
   exit 0
fi
echo ""