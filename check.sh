#!/usr/bin/env sh
# Checks every stream URL in a playlist and prints the HTTP status.
# Usage: ./check.sh [trt.m3u]
list="${1:-trt.m3u}"
grep '^https' "$list" | while read -r url; do
  code=$(curl -s -o /dev/null -w '%{http_code}' -m 15 "$url")
  printf '%-62s %s\n' "$url" "$code"
done
