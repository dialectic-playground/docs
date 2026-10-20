# Toolchain image for dialectic-playground/docs (container-first; see tools/dp-run).
#
# The official uv image with Python 3.12, plus make. The base image is pinned by
# multi-architecture index digest; Dependabot (docker) keeps it current.
FROM ghcr.io/astral-sh/uv:python3.12-trixie-slim@sha256:717e09370920d9f72cffdb55584c237bbb97ae0a50f9f483b4f736af17c92018

# Debian keeps only the current version of each package, so apt versions cannot be pinned
# reproducibly; the base image is pinned by digest instead.
# hadolint ignore=DL3008
RUN apt-get update \
    && apt-get install -y --no-install-recommends make \
    && rm -rf /var/lib/apt/lists/*

# The virtual environment lives in the mounted cache, not in the working tree, so container
# and host builds never overwrite each other's .venv.
ENV DP_IN_CONTAINER=1 \
    UV_PROJECT_ENVIRONMENT=/dp-cache/venvs/docs \
    UV_LINK_MODE=copy \
    UV_PYTHON_DOWNLOADS=never
