#!/usr/bin/env bash
#
# This is a post-generation script; see <https://cookiecutter.readthedocs.io/en/stable/advanced/hooks.html>.
#
# This runs before the python script.

# Halt on error.
set -euo pipefail

# Do **NOT** change the execution directory.

echo "Running \`post_gen_project.sh\` in \`${PWD}\`." >&2

# Ensure we are at a recently created directory.
if (($(find . -type f | wc --lines) >= 100)); then
    echo "The execution place of this script is probably wrong." >&2
    exit 1
fi

find . -type f -print0 \
    | parallel --null --group --keep-order --jobs $(nproc) --max-args 10 \
        -- \
        '
sed --in-place --regexp-extended '"'"'s#⟨⟨⟨#\x7B\x7B\x7B#g'"'"' {}
sed --in-place --regexp-extended '"'"'s#⟩⟩⟩#\x7D\x7D\x7D#g'"'"' {}
        '

# vim: set filetype=sh fileformat=unix nowrap:
