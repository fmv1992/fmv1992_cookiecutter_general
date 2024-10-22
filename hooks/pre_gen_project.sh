#!/usr/bin/env bash
#
# This is a pre-generation script; see <https://cookiecutter.readthedocs.io/en/stable/advanced/hooks.html>.
#
# This runs before the python script.

# Halt on error.
set -euo pipefail

# Do **NOT** change the execution directory.

echo "Running \`pre_gen_project.sh\` in \`${PWD}\`." >&2

find . | sort --unique

# find . -type f -print0 \
#     | parallel --null --group --keep-order --jobs $(nproc) --max-args 10 \
#         -- \
#         '
# sed --in-place --regexp-extended '"'"'s#⟨⟨⟨#\x7B\x7B\x7B#g'"'"' {}
# sed --in-place --regexp-extended '"'"'s#⟩⟩⟩#\x7D\x7D\x7D#g'"'"' {}
#         '

# vim: set filetype=sh fileformat=unix nowrap:
