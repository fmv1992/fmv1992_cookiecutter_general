SHELL := /bin/bash -euo pipefail
export ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

export PROJECT ?= fmv1992_cookiecutter_general

all: dev check test

dev:
	cp -rf ./other/git/hooks/* ./.git/hooks/

check:

test:
	bash -xv ./other/tests/test_instantiation.sh

git_delete_stale_branches:
	$(shell get_project_path gnu_make_api)/bin/git_delete_stale_branches $(ROOT_DIR) ./other/git/branches/

format: format_yaml format_json

format_yaml:
	find $(ROOT_DIR) \( -iname '*.yml' -o -iname '*.yaml' -o -iname '.yamlfmt' \) -type f -print0 | xargs -0 -n 100 -- yamlfmt

format_json:
	find . -iname '*.json' -print0 | parallel --null --max-args 1 -- 'python3 -m json.tool --sort-keys {} > /tmp/$(PROJECT)_{/}_{#} && mv /tmp/$(PROJECT)_{/}_{#} {}'
