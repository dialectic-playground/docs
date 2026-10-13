# Makefile for dialectic-playground/docs (container-first; see tools/container.mk).
#
#   make            same as `make build`
#   make build      strict build of the site into site/ (broken links fail)
#   make serve      live preview at http://127.0.0.1:8000/docs/
#   make check      everything CI checks (the strict build)
#   make sync       install the locked toolchain
#   make clean      remove site/
#   make dp-info | dp-shell | dp-image
#
# Every goal runs in the toolchain container built from ./Containerfile: podman, then docker,
# then the local system. Override with DP_RUNTIME=podman|docker|local or DP_IMAGE=<image>.

DP_HOST_GOALS += help
DP_RUN_FLAGS_serve := --port 8000
include tools/container.mk
ifeq ($(DP_DELEGATE),)

.DEFAULT_GOAL := build
.PHONY: build serve check sync clean help

sync:
	uv sync --locked

build: sync
	uv run mkdocs build --strict

check: build

serve: sync
	uv run mkdocs serve --dev-addr "$${DP_BIND_ADDRESS:-127.0.0.1}:8000"

clean:
	rm -rf site

help:
	@sed -n '3,12p' Makefile | sed 's/^# \{0,1\}//'

endif
