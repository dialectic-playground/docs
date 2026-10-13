# Toolchain image for dialectic-playground/docs (container-first; see tools/dp-run).
#
# The official uv image with Python 3.12, plus make. The base image is pinned by
# multi-architecture index digest; Dependabot (docker) keeps it current.
FROM ghcr.io/astral-sh/uv:python3.12-trixie-slim@sha256:17af15d103f32869a63825517f9e8867ce98598937e3e5f5ce1e24313c552406

RUN apt-get update \
    && apt-get install -y --no-install-recommends make \
    && rm -rf /var/lib/apt/lists/*

# The virtual environment lives in the mounted cache, not in the working tree, so container
# and host builds never overwrite each other's .venv.
ENV DP_IN_CONTAINER=1 \
    UV_PROJECT_ENVIRONMENT=/dp-cache/venvs/docs \
    UV_LINK_MODE=copy \
    UV_PYTHON_DOWNLOADS=never
