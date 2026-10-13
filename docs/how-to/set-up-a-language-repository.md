# Set up a language repository

!!! info "Planned how-to guide: this page is a placeholder"
    **Goal:** create a new implementation repository (for example `dialectic-playground/rs`)
    that builds and tests against the curriculum on Linux, macOS, and Windows.

    **Assumes:** familiarity with git submodules, GitHub Actions, and the target language's
    toolchain.

## Planned steps

1. Create the repository and add `sdlc-curriculum` as a git submodule.
2. Copy `projects/<slug>/assignment/` for each project you will implement.
3. Set `CURRICULUM_ROOT`, `BIN_DIR`, and the `DP_*` hooks in each project `Makefile`.
4. Add the CI workflow from `shared/ci/cross-platform-ci.yml`, then list your projects and set
   up your toolchain.
5. Check the setup with `make help`, then `make test`.
6. Add the repository to the profile table in `dialectic-playground/.github` and to
   [Repositories](../reference/repositories.md).

## Variations to cover

- Updating the curriculum submodule to a newer version.
- Implementing only a subset of the projects.

The authoritative contract is the curriculum's
[README](https://github.com/dialectic-playground/sdlc-curriculum#implementing-the-curriculum-in-a-language-repository).
Start from `templates/how-to.md`.
