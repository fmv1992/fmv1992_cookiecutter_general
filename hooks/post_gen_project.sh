#!/usr/bin/env bash
#
# This is a post-generation script; see <https://cookiecutter.readthedocs.io/en/stable/advanced/hooks.html>.
#
# This runs before the python script.

# Halt on error.
set -euo pipefail

# Go to execution directory.
cd "$(dirname $(readlink -f "${0}"))"
# cd "$(git rev-parse --show-toplevel)"
# test -d ./.git

bname="$(basename "$0")"

echo "Running \`${bname}\` in \`${PWD}\`." >&2

find . -type f -print0 \
    | parallel --null --group --keep-order --jobs $(nproc) --max-args 10 \
        -- \
        '
        sed --in-place --regexp-extended '"'"'s#⟨⟨⟨#{{{#g'"'"' {}
        sed --in-place --regexp-extended '"'"'s#⟩⟩⟩#}}}#g'"'"' {}
        '

# vim: set filetype=sh fileformat=unix nowrap:
