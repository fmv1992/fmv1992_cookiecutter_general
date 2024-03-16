SHELL := /bin/bash -euo pipefail
export ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

export PROJECT ?= {{ cookiecutter.__project_slug }}

export USER_UID := $(shell id -u)
export USER_GID := $(shell id -g)

DOCKER_COMPOSE_FILE := ./compose.yaml

DOCKER_BUILD_ARGS = \
    --build-arg USER_UID='$(USER_UID)' \
    --build-arg USER_GID='$(USER_GID)' \
    --build-arg GIT_COMMIT='$(or $(shell git show -s --format=%H), no_git)' \
    --build-arg GIT_COMMIT_DATE='$(or $(shell git show -s --date=iso8601 --format=%ci), no_git)' \
    --build-arg IMAGE_NAME='$(PROJECT)' \
    --build-arg BUILD_DATE='$(shell date --iso-8601=seconds)'

ifndef DOCKER_RUN_CMD
    DOCKER_RUN_CMD := /usr/bin/dumb-init -- bash
endif

# Section. --- {{ "{{{" }}

all: dev check build test format

dev:
	cp -rf ./other/git/hooks/* ./.git/hooks/

up:
	docker-compose --file $(DOCKER_COMPOSE_FILE) up --detach

down:
	docker-compose --file $(DOCKER_COMPOSE_FILE) down --remove-orphans

clean:
	rm --force ./bin/* ./obj/*

run:
	docker-compose \
        --file $(DOCKER_COMPOSE_FILE) \
        run \
        --rm \
        {{ cookiecutter.__project_slug }} \
        $(DOCKER_RUN_CMD)

shell:

build: ada_build docker_build

docker_build:
	docker-compose --file $(DOCKER_COMPOSE_FILE) build $(DOCKER_BUILD_ARGS)

ada_build:
	gprbuild project_{{ cookiecutter.__project_slug }}.gpr

check:

test:
	DOCKER_RUN_CMD='bash -c '"'"'bash -xv ./other/tests/test.sh'"'" make run

format: format_ada format_yaml format_json

format_ada:
	find . \( -iname '*.adb' -o -iname '*.ads' \) -print0 | parallel --null -- 'gnatpp -pipe {} | sponge {}'

format_yaml:
	find $(ROOT_DIR) \( -iname '*.yml' -o -iname '*.yaml' -o -iname '.yamlfmt' \) -type f -print0 | xargs -0 -n 100 -- yamlfmt

format_json:
	find . -iname '*.json' -print0 | parallel --null --max-args 1 -- 'python3 -m json.tool --sort-keys {} > /tmp/$(PROJECT)_{/}_{#} && mv /tmp/$(PROJECT)_{/}_{#} {}'

#  --- {{ "}}}" }}

# vim: set noexpandtab foldmethod=marker fileformat=unix filetype=make nowrap foldtext=foldtext():
