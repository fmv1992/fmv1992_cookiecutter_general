#! /usr/bin/env bash

# Halt on error.
set -euo pipefail

# Go to execution directory.
cd "$(dirname $(readlink -f "${0}"))"

{% set user_jinja = 'user_' + cookiecutter.__project_slug -%}

[[ $(whoami) == '{{ user_jinja }}' ]]

[[ $(sudo whoami) == 'root' ]]

# vim: set filetype=sh fileformat=unix nowrap:
