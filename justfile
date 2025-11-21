#!/usr/bin/env just --justfile

set shell := ["bash", "-euo", "pipefail", "-c"]

# Variables
export ROOT_DIR := shell('dirname "$(readlink --canonicalize "${BASH_SOURCE:-$0}")"')
export PROJECT := env("PROJECT", "fmv1992_cookiecutter_general")

# Default target
all: dev check test

# Development setup
dev:
    cp -rf ./other/git/hooks/* ./.git/hooks/

# Checks (empty, as in Makefile)
check:

# Run tests
test:
    bash -xv ./other/tests/test_instantiation.sh

# Delete stale git branches
git_delete_stale_branches:
    git_delete_stale_branches --delete --git-directory . --config-directory ./other/git/branches/

# Format
format: format_yaml format_json

# Format YAML files
format_yaml:
    find {{ ROOT_DIR }} \( -iname '*.yml' -o -iname '*.yaml' -o -iname '.yamlfmt' \) \
        -type f -print0 \
        | xargs -0 -n 100 -- yamlfmt

# Format JSON files
format_json:
    find . -iname '*.json' -print0 \
        | parallel --null --max-args 1 -- \
            'python3 -m json.tool --sort-keys {} > /tmp/{{ PROJECT }}_{/}_{#} && mv /tmp/{{ PROJECT }}_{/}_{#} {}'

# vim: set foldmethod=marker fileformat=unix filetype=just nowrap foldmarker={{{,}}} :
