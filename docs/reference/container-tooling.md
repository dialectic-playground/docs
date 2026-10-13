# Container tooling

The container-first tooling shared by every repository. For the reasoning behind it, see
[Container-first development](../explanation/container-first-development.md).

## Files in every repository

| File | Shared? | Purpose |
| :-- | :-- | :-- |
| `tools/dp-run` | Byte-identical copy of the [canonical file](https://github.com/dialectic-playground/.github/blob/main/tools/dp-run) | Runs a command in the toolchain environment |
| `tools/container.mk` | Byte-identical copy of the [canonical file](https://github.com/dialectic-playground/.github/blob/main/tools/container.mk) | Re-runs `make` goals inside the toolchain container |
| `Containerfile` | Per repository | The toolchain image: an official image pinned by digest, plus only what the repository needs; ends with `ENV DP_IN_CONTAINER=1` |
| `Makefile` | Per repository | Includes `tools/container.mk` first; `make check` runs everything CI checks |
| `.devcontainer/devcontainer.json` | Per repository | The same `Containerfile`, for VS Code, JetBrains, and Codespaces |

Each repository's CI has a **Shared tooling** job that fails if `tools/dp-run` or
`tools/container.mk` differs from the canonical copy. Language repositories get both files
from the curriculum submodule, through `BASE-MAKEFILE`.

## Runtime selection

| `DP_RUNTIME` | Runs tasks with |
| :-- | :-- |
| `auto` (default) | The first working engine of **podman**, **docker**; otherwise the local system |
| `podman` | Podman (fails if it is not installed) |
| `docker` | Docker (fails if it is not installed) |
| `local` | The host system, with no container |

Inside a toolchain container (`DP_IN_CONTAINER` is set), tasks always run locally.

## Variables

| Variable | Default | Effect |
| :-- | :-- | :-- |
| `DP_RUNTIME` | `auto` | Where tasks run (above) |
| `DP_IMAGE` | *(build `./Containerfile`)* | Use this image reference instead |
| `DP_PLATFORM` | the host's platform | Build and run for this platform, e.g. `linux/amd64` |
| `DP_RUN_ARGS` | *(none)* | Extra arguments for `podman run` / `docker run` |
| `DP_QUIET` | *(unset)* | `1` suppresses the one-line runtime banner |
| `DP_HOST_GOALS` | `dp-info dp-shell dp-image` | `make` goals that always run on the host (extend with `+=`) |
| `DP_RUN_FLAGS_<goal>` | *(none)* | Extra `dp-run` options when `<goal>` is delegated, e.g. `--port 8000` |

Set them in the environment (`DP_RUNTIME=local make check`) or on the `make` command line
(`make check DP_RUNTIME=local`).

## `make` targets provided by `container.mk`

| Target | Effect |
| :-- | :-- |
| `dp-info` | Print the resolved runtime, repository root, image, and cache location |
| `dp-shell` | Open an interactive shell in the toolchain environment |
| `dp-image` | Build the image if needed, and print its reference |

## `tools/dp-run`

```text
tools/dp-run [--port N]... [--] COMMAND [ARG]...   run COMMAND in the toolchain environment
tools/dp-run --shell                               interactive shell
tools/dp-run --resolve                             print the runtime: podman, docker, or local
tools/dp-run --image-ref                           print (building if needed) the image
tools/dp-run --info                                print runtime, image, and mounts
```

In a container, `dp-run`:

| Aspect | Behavior |
| :-- | :-- |
| Image | `DP_IMAGE`, or `./Containerfile` built once as `localhost/dp-<repository>:<content hash>` |
| Source | The repository root (git toplevel) is mounted read-write **at the same path** (on Windows: `/workspace`), and the working directory is preserved |
| Ownership | Files are created with your user and group IDs (Podman `--userns=keep-id`; Docker `--user UID:GID`) |
| SELinux | Mounts get the `:z` label when SELinux is enabled |
| Caches | `~/.cache/dialectic-playground` is mounted at `/dp-cache`; `HOME` and `XDG_CACHE_HOME` point into it |
| Ports | `--port N` publishes container port `N` on `127.0.0.1:N`; `DP_BIND_ADDRESS=0.0.0.0` is set so servers listen on it |
| Environment | `DP_IN_CONTAINER=1`, plus `CI`, `GITHUB_ACTIONS`, `TERM`, `NO_COLOR`, and `DP_QUIET` when set |

## CI jobs

| Job | Runs |
| :-- | :-- |
| **Container (podman)** | `make check` (and repository extras) with `DP_RUNTIME=podman` on Linux |
| **Native (…)** | `make check` with `DP_RUNTIME=local`; Linux everywhere, plus macOS and Windows for the curriculum and language repositories |
| **Shared tooling** | Compares `tools/dp-run` and `tools/container.mk` with the canonical copies |

## Images in use

| Repository | Image |
| :-- | :-- |
| `.github` | Custom asset tools (Inkscape, ImageMagick, brand fonts), on `debian:trixie-slim` with a dated Debian snapshot. Published privately to `ghcr.io/dialectic-playground/asset-tools`. |
| `docs` | `ghcr.io/astral-sh/uv` (Python 3.12) + `make` |
| `sdlc-curriculum` | `python:3.12-slim-trixie` + `make`, `git` |
| `repo-template` | `debian:trixie-slim` + `make`, `git`; each new repository replaces it with its own toolchain |
| Language repositories (16) | The language's official image + `python3` (for the black-box runner) + `make`; Objective-C uses `debian:trixie-slim` + GCC Objective-C + GNUstep Base. See [Languages](languages/index.md). |

Every base image is pinned by its multi-architecture index digest, and Dependabot's `docker`
ecosystem keeps it current.
