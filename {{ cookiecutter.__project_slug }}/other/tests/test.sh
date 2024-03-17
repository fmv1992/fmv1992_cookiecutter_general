#! /usr/bin/env bash

# Halt on error.
set -euo pipefail

# Go to execution directory.
cd "$(dirname $(readlink -f "${0}"))"

# ???: This causes an extra line on instantiation.
{% set user_jinja = 'user_' + cookiecutter.__project_slug %}

[[ $(whoami) == '{{ user_jinja }}' ]]

[[ $(sudo whoami) == 'root' ]]

# # Run the compiled file.
# make ada_build
# [[ "$(./bin/main)" == 'Hello, Ada!' ]]
#
# # Revert state since we issue `git_check_clean`.
# make clean

# vim: set filetype=sh fileformat=unix nowrap:
