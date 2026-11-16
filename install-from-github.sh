#!/usr/bin/env bash
set -euo pipefail

REPO="hitprollc/hitpro-azuracast"
ARCHIVE="HITPRO-AzuraCast-Portable-2026-11-15.zip"
WORK_DIR="$(mktemp -d)"
trap 'rm -rf "$WORK_DIR"' EXIT

command -v curl >/dev/null 2>&1 || { echo "Install curl first." >&2; exit 1; }
if ! command -v unzip >/dev/null 2>&1; then
  command -v apt-get >/dev/null 2>&1 || { echo "Install unzip first." >&2; exit 1; }
  [[ "$(id -u)" -eq 0 ]] || { echo "Run this installer as root so it can install unzip." >&2; exit 1; }
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y unzip
fi

curl --fail --location --silent --show-error \
  "https://raw.githubusercontent.com/${REPO}/main/${ARCHIVE}" \
  --output "$WORK_DIR/package.zip"
unzip -q "$WORK_DIR/package.zip" -d "$WORK_DIR/package"

bash "$WORK_DIR/package/install.sh" "$@"