# Set up a language repository

This guide sets up a repository that implements the
[curriculum](../reference/curriculum/index.md) in one language, for example
`dialectic-playground/rs`. It is step 4 of [Add a repository](add-a-repository.md): do steps
1–3 of that checklist first.

**Assumes:** familiarity with git submodules, GitHub Actions, and the target language's
toolchain.

## 1. Add the curriculum as a pinned submodule

```sh
git submodule add https://github.com/dialectic-playground/sdlc-curriculum
git -C sdlc-curriculum checkout v1.0.0
git add .gitmodules sdlc-curriculum
git commit -s -m "build: pin sdlc-curriculum to v1.0.0"
```

Pin a [release tag](https://github.com/dialectic-playground/sdlc-curriculum/releases), never a
branch, so specification changes arrive only when you choose to upgrade.

## 2. Copy the project workspaces

For each project you implement, copy its language-neutral workspace from the curriculum:

```sh
cp -r sdlc-curriculum/projects/00-hello-world/assignment 00-hello-world
```

Each copy contains the project `Makefile` and blank `hld.md`, `lld.md`, `rtm.md`, and
`master-test-plan.md` templates.

## 3. Configure each project Makefile

In `00-hello-world/Makefile`:

```make
CURRICULUM_ROOT ?= ../sdlc-curriculum
BIN_DIR := <directory where your build leaves the dp-* executables>

DP_BUILD     = <build command>
DP_INSTALL   = <install into $(BINDIR)>
DP_UNINSTALL = <remove from $(BINDIR)>
DP_UNIT_TEST = <unit tests>
DP_LINT      = <linters and type checkers>
DP_FORMAT    = <formatter>
DP_CLEAN     = <remove build artifacts>
DP_DISTCLEAN = <also remove virtualenvs and caches>
```

Check the configuration:

```sh
make -C 00-hello-world help    # every hook should say "defined"
make -C 00-hello-world test    # unit tests, then the 10 public black-box tests
```

## 4. Replace the template CI with the curriculum's

Copy `sdlc-curriculum/shared/ci/cross-platform-ci.yml` over `.github/workflows/ci.yml`. Then
edit the two places marked `EDIT`: the list of implemented projects, and the toolchain setup
step. Pin any action you add to a full commit SHA. The workflow keeps the organization's
**DCO** and **CI result** jobs, and runs `make all`, `lint`, `test`, `test-hidden`, and an
install round trip on Linux, macOS, and Windows.

Add your package ecosystem (for example `pip`, `uv`, `cargo`, or `gomod`) to
`.github/dependabot.yml`.

## 5. Design before you build

Complete `hld.md` and `lld.md` before you write code, then keep `rtm.md` and
`master-test-plan.md` current as you implement (curriculum
[Principle 11](https://github.com/dialectic-playground/sdlc-curriculum#the-20-core-engineering-principles)).
A project is done when `make lint test test-hidden` passes on all three operating systems.

## Variations

### Upgrade to a newer curriculum release

```sh
git -C sdlc-curriculum fetch --tags
git -C sdlc-curriculum checkout v1.1.0
git add sdlc-curriculum && git commit -s -m "build: upgrade sdlc-curriculum to v1.1.0"
```

Read the release notes first. A MAJOR release can change specified behavior or fixtures.

### Implement only some projects

List only the projects you implement in the CI matrix. Unimplemented projects need no
directory.

The authoritative contract is the curriculum's
[implementation contract](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/templates/assignment/src-README.md.tmpl)
and [README](https://github.com/dialectic-playground/sdlc-curriculum#implementing-the-curriculum-in-a-language-repository).
