#!/usr/bin/env bash

# Halt on error.
set -euo pipefail

# Go to execution directory.
cd "$(dirname $(readlink -f "${0}"))"
cd "$(git rev-parse --show-toplevel)"
test -d ./.git

bname="$(basename "$0")"

echo "Running \`${bname}\` in \`${PWD}\`." >&2

# vim: set filetype=sh fileformat=unix nowrap:
