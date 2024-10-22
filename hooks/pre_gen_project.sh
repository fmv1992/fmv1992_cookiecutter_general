#!/usr/bin/env bash
#
# This is a pre-generation script; see <https://cookiecutter.readthedocs.io/en/stable/advanced/hooks.html>.
#
# This runs before the python script.

# Halt on error.
set -euo pipefail

# Do **NOT** change the execution directory.

echo "Running \`pre_gen_project.sh\` in \`${PWD}\`." >&2

# vim: set filetype=sh fileformat=unix nowrap:
