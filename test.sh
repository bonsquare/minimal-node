#!/usr/bin/env bash
docker build -t node-minimal:latest $(realpath $(dirname "$0"))
rm -rf test/output
docker compose -f test/compose.yaml up -d --build
timeout --preserve-status 2 bash -c '< /dev/tcp/localhost/8080'
if [ "$?" -ne 0 ]; then
    echo "Failed"
    exit 1
else
    echo "Success"
    exit 0
fi