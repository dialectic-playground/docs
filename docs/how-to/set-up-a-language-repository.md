# Set up a language repository

This guide turns a repository created from `repo-template` into a curriculum implementation
repository for one language, following the curriculum's
[language skeleton](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/templates/language/README.md).
It is step 4 of [Add a repository](add-a-repository.md): do steps 1–3 of that checklist
first. The sixteen existing language repositories ([Languages](../reference/languages/index.md))
were all set up this way.

**Assumes:** familiarity with git submodules, GitHub Actions, and the target language's
toolchain.

## 1. Add the curriculum as a pinned submodule

```sh
git submodule add https://github.com/dialectic-playground/sdlc-curriculum
git -C sdlc-curriculum checkout v1.6.0
git add .gitmodules sdlc-curriculum
```

Pin a [release tag](https://github.com/dialectic-playground/sdlc-curriculum/releases), never a
branch, so specification changes arrive only when you choose to upgrade.

## 2. Copy every project workspace

```sh
for project in sdlc-curriculum/projects/*/; do
  name=$(basename "$project")
  cp -r "$project/assignment" "$name"
  sed -i 's#^CURRICULUM_ROOT ?= ../../..$#CURRICULUM_ROOT ?= ../sdlc-curriculum#' "$name/Makefile"
done
```

Each workspace has the project `Makefile` (with empty `DP_*` hooks) and blank `hld.md`,
`lld.md`, `rtm.md`, and `master-test-plan.md`. `make check` fails if a project's workspace is
missing.

## 3. Add the root Makefile

Copy `sdlc-curriculum/shared/templates/language/Makefile` to the repository root. Replace its
`TEMPLATE:` markers:

- the repository and language names in the header;
- the `toolchain` target, which prints each tool's version and fails unless it is on the
  repository's release line. For example:

  ```make
  toolchain:
  	python3 --version || python --version
  	make --version | head -1
  	go version | tee /dev/stderr | grep -q 'go1\.27\.'
  ```

  Where the native compiler legitimately differs by OS (C, C++, Objective-C), use a short
  compile-and-run probe for the language standard instead.

Leave `IMPLEMENTED` empty.

`make check` fails while any `TEMPLATE:` marker remains. It searches only git-tracked files
(outside `.github/`, `tools/`, and the submodule), so dependency folders that a build creates
inside a project, such as `node_modules/` or `vendor/`, are never searched.

## 4. Define the toolchain image

In `Containerfile`, start from the language's **official image**, pinned by its
multi-architecture index digest. Add what the curriculum's tooling needs, `make` and
`python3` (3.11 or newer), and point tool caches that the image places in read-only system
locations at `/dp-cache`:

```dockerfile
FROM docker.io/library/rust:1.99-slim-trixie@sha256:<index digest>
RUN apt-get update \
    && apt-get install -y --no-install-recommends make python3 \
    && rm -rf /var/lib/apt/lists/*
ENV CARGO_HOME=/dp-cache/cargo \
    DP_IN_CONTAINER=1
```

## 5. Replace the template CI with the curriculum's

Copy `sdlc-curriculum/shared/ci/cross-platform-ci.yml` over `.github/workflows/ci.yml`, and
replace its `EDIT` step with the native toolchain setup for every OS, on the same release line
(official setup actions where they exist, pinned to full commit SHAs). CI runs `make check` in
a Podman container, and `make check roundtrip` natively on Linux, macOS, and Windows. Keep the
template's `schedule` trigger (a weekly run that catches toolchain drift) and its **CI result**
job, which checks every job of the run through the Actions API (see
[Organization settings](../reference/organization.md#ci-conventions-every-repository)).

Then check everything locally:

```sh
make check                    # in the toolchain container
DP_RUNTIME=local make check   # natively
```

## 6. Implement projects one at a time

1. Complete the project's `hld.md` and `lld.md` before you write code (curriculum
   [Principle 11](https://github.com/dialectic-playground/sdlc-curriculum#the-20-core-engineering-principles)).
2. Implement it under the project's `src/`, set `BIN_DIR` and the `DP_*` hooks in its
   `Makefile`, and add the language's package ecosystem to `.github/dependabot.yml` once a
   manifest exists.
   For an interpreted or managed-runtime language, `BIN_DIR` can hold `#!` launcher scripts
   instead of native executables; the black-box runner starts their interpreter itself on
   Windows (see [Run the black-box tests](run-the-black-box-tests.md#test-script-tools-on-windows)).
   `DP_INSTALL` then puts only a launcher in `$(BINDIR)` and the payload in
   `$(LIBDIR)/<repository>/<project>/` (`LIBDIR` defaults to
   `$(PREFIX)/lib/dialectic-playground`); `DP_UNINSTALL` removes both.
3. Pass `make -C <project> all test test-hidden lint` in the container and natively.
4. Add the project to `IMPLEMENTED` in the root `Makefile`. CI then runs `all`, `lint`,
   `test`, `test-hidden`, and the install round trip for it everywhere, with no workflow
   changes.
5. Record the NFR measurements in `master-test-plan.md`. On a managed runtime or interpreter,
   memory limits are measured above the runtime's own baseline
   ([CONV-31](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/CLI-CONVENTIONS.md)).
6. Update its row on the language's [reference page](../reference/languages/index.md) and in
   the curriculum's [implementation status](../reference/curriculum/index.md#implementation-status).

## Variations

### Upgrade to a newer curriculum release

```sh
git -C sdlc-curriculum fetch --tags
git -C sdlc-curriculum checkout vX.Y.Z      # the new release tag
git add sdlc-curriculum && git commit -s -m "build: upgrade sdlc-curriculum to vX.Y.Z"
```

Read the release notes first. A MAJOR release can change specified behavior or fixtures. A
release that keeps the specification version (`spec_version`) unchanged never requires
implementation changes, though it can ask for template updates (for example v1.5.0's
**CI result** job and weekly CI schedule) or new project workspaces (v1.6.0 adds Projects
11–52, and `check-repository` expects a workspace for every project).

The authoritative contract is the curriculum's
[implementation contract](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/templates/assignment/src-README.md.tmpl)
and [README](https://github.com/dialectic-playground/sdlc-curriculum#implementing-the-curriculum-in-a-language-repository).
