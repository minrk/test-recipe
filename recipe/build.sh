#!/usr/bin/env bash
set +x
set -eu

for i in {1..10}; do
  echo -ne "\rline ${i}"
  sleep 0.1
done
echo -e "\ndone"

