# Your first curriculum project

In this tutorial we will implement `dp-hello`,
[Project 00](https://github.com/dialectic-playground/sdlc-curriculum/tree/main/projects/00-hello-world)
of the curriculum, in a language repository. By the end, all 20 of its black-box tests will
pass, its lint will be clean, and a pull request will show a green **CI result** on Linux,
macOS, and Windows. On the way we will meet the curriculum's essentials: the specifications,
the project `Makefile` and its hooks, the black-box test runner, and `make check`.

Every language repository already contains a finished Project 00. We use that to our
advantage: we work in our own fork, clear the project back to the curriculum's blank
assignment, and build it again. The finished implementation stays on `main` as an answer key.

## Before you begin

- A GitHub account and the [GitHub CLI](https://cli.github.com/), signed in (`gh auth status`).
- `git`, `make`, and [Podman](https://podman.io/) or Docker. Every `make` command runs in the
  repository's toolchain container, so you do not need the language installed.
- Some experience with one of the sixteen [languages](../reference/languages/index.md) and a
  terminal.

The commands below are the same in every language; only the code differs. The examples use
Python, and the finished implementations in
[`py`](https://github.com/dialectic-playground/py/tree/main/00-hello-world) and
[`rs`](https://github.com/dialectic-playground/rs/tree/main/00-hello-world) are worked
examples to compare against. First, we record the repository name (the *slug*) of our
language. We use `py` here; use your language's slug from the
[Languages](../reference/languages/index.md) table:

```sh
slug=py
```

## Step 1: Fork and clone the language repository

We fork the repository and clone the fork together with its `sdlc-curriculum` submodule:

```sh
gh repo fork "dialectic-playground/$slug" --clone -- --recurse-submodules
cd "$slug"
git -C sdlc-curriculum describe --tags
```

You should see the curriculum release that the repository is pinned to:

```text
v1.5.0
```

The submodule holds the specifications, the black-box tests, and the test runner. The language
repository holds only the implementation.

## Step 2: Clear the project workspace

We create a branch, remove the finished project, and put the curriculum's blank assignment in
its place:

```sh
git switch -c practice/00-hello-world
git rm -r -q 00-hello-world
cp -r sdlc-curriculum/projects/00-hello-world/assignment 00-hello-world
sed -i.bak 's#^CURRICULUM_ROOT ?= ../../..$#CURRICULUM_ROOT ?= ../sdlc-curriculum#' 00-hello-world/Makefile
rm 00-hello-world/Makefile.bak
make -C 00-hello-world help
```

The first `make` builds the toolchain container image, which takes a few minutes once. Among
the output you should see:

```text
project:         00-hello-world
tools:           dp-hello
BIN_DIR:         (not set)
curriculum root: ../sdlc-curriculum
DP_BUILD: NOT DEFINED
DP_INSTALL: NOT DEFINED
DP_UNINSTALL: NOT DEFINED
DP_UNIT_TEST: NOT DEFINED
DP_LINT: NOT DEFINED
DP_FORMAT: NOT DEFINED
DP_CLEAN: NOT DEFINED
DP_DISTCLEAN: NOT DEFINED
targets: all install uninstall test check test-hidden grade lint format clean distclean
```

The project `Makefile` includes the curriculum's universal build contract. The standard
targets (`all`, `test`, `lint`, …) are already there; our job is to fill in `BIN_DIR` and the
`DP_*` hooks with our language's commands.

## Step 3: Read the specification

The specification is the source of truth, down to the byte. We open the user manual and the
SRS, then list the public black-box tests:

```sh
less sdlc-curriculum/projects/00-hello-world/specs/user-manual.md
less sdlc-curriculum/projects/00-hello-world/specs/SRS.md
cat sdlc-curriculum/projects/00-hello-world/tests/public/test-inputs.txt
```

The last command prints:

```text
# Public black-box acceptance tests for dp-hello (projects/00-hello-world).
# Format: <ID> [NAME=VALUE]... <tool> [ARG]... [< STDIN-FILE]   — see shared/tools/run-tests.py
# Each ID's expected stdout/stderr/exit live in expected-outputs/<ID>.{stdout,stderr,exit}.
01 dp-hello
02 dp-hello --name Ada
03 dp-hello -n Grace
04 dp-hello --name=Linus
05 dp-hello --count 3
06 dp-hello -c2 -n Ken
07 dp-hello --help
08 dp-hello --version
09 dp-hello -x
10 dp-hello extra
```

Each test's expected standard output, standard error, and exit status are files in
`tests/public/expected-outputs/`. In the user manual, note the **HELP OUTPUT** and **VERSION
OUTPUT** sections, which we will copy exactly, and the **DIAGNOSTICS** table.

Before writing code, we sketch the design in `00-hello-world/hld.md` and
`00-hello-world/lld.md`: the units (for example options, validation, greeting, and output) and
how they cooperate. The curriculum asks for design before code
([Principle 11](https://github.com/dialectic-playground/sdlc-curriculum#the-20-core-engineering-principles)).

## Step 4: Make the first test pass

`make all` runs the `DP_BUILD` hook, which must leave an executable named `dp-hello` in
`BIN_DIR`. It can be a native executable or a script whose first line is `#!`; the test runner
handles both on every OS. We write the smallest program that prints `Hello, World!` followed by
a single line feed, then set `BIN_DIR` and `DP_BUILD` in `00-hello-world/Makefile`.

!!! example "Worked example: Python"
    `00-hello-world/pyproject.toml` declares the package and its console script:

    ```toml
    [project]
    name = "dp-hello"
    version = "1.0.0"
    requires-python = ">=3.14,<3.15"
    dependencies = []

    [project.scripts]
    dp-hello = "dp_hello.cli:run"

    [build-system]
    requires = ["uv_build>=0.13.0,<0.14"]
    build-backend = "uv_build"
    ```

    `00-hello-world/src/dp_hello/__init__.py` is empty, and
    `00-hello-world/src/dp_hello/cli.py` writes bytes, so Windows never turns the LF into CRLF:

    ```python
    import sys


    def run() -> None:
        sys.stdout.buffer.write(b"Hello, World!\n")
    ```

    In `00-hello-world/Makefile`, `uv sync` installs the console script into `.venv/bin`:

    ```make
    BIN_DIR := .venv/bin
    DP_BUILD     = uv sync
    ```

Now we run the public suite:

```sh
make -C 00-hello-world test-blackbox
```

You should see test 01 pass, followed by a diff for every other test, ending with:

```text
1 passed, 9 failed
```

Our program prints the greeting whatever the arguments are, so the tests that pass options
fail. Each diff compares `expected` with `actual` for stdout, stderr, and the exit status.

## Step 5: Add the options one at a time

We add one feature, re-run `make -C 00-hello-world test-blackbox`, and watch one more group of
tests pass:

1. `-n NAME` and `--name=NAME` (tests 02 to 04). A value can be attached (`-nAda`,
   `--name=Ada`) or separate (`-n Ada`, `--name Ada`), and the last option wins.
2. `-c COUNT` and `--count=COUNT` (tests 05 and 06). Short options can be combined: `-c2 -nKen`.
3. `--help` and `--version` (tests 07 and 08). We copy the text from the user manual's HELP
   OUTPUT and VERSION OUTPUT sections character for character, and exit with status 0.

The [CLI conventions](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/CLI-CONVENTIONS.md)
define the option syntax shared by every tool. The worked examples parse by hand, in
`src/dp_hello/options.py` (Python) and `src/arguments.rs` (Rust): option-parsing libraries do
not produce the specified messages.

## Step 6: Handle mistakes

A usage error writes two lines to standard error, nothing to standard output, and exits with
status 2:

```sh
cat sdlc-curriculum/projects/00-hello-world/tests/public/expected-outputs/09.stderr
```

```text
dp-hello: invalid option -- 'x'
Try 'dp-hello --help' for more information.
```

We scan the arguments from left to right and stop at the first `--help` or `--version`. Only
an option *syntax* error found earlier wins over them. Operands and option values are checked
after the scan, so `dp-hello extra --help` prints the help, while `dp-hello extra` reports
`extra operand 'extra'`. We implement every message in the DIAGNOSTICS table, then run both
suites:

```sh
make -C 00-hello-world test-blackbox
make -C 00-hello-world test-hidden
```

Each suite should now end with:

```text
10 passed, 0 failed
```

The hidden suite covers the edge cases that the SRS defines. We design from the SRS, not from
the hidden test files; if a hidden test fails, its diff shows what the specification expects.

## Step 7: Finish the contract

A complete project also has unit tests, lint, formatting, and install. We fill in the remaining
hooks with our language's usual tools: `DP_UNIT_TEST`, `DP_LINT`, `DP_FORMAT`, `DP_INSTALL`,
`DP_UNINSTALL`, `DP_CLEAN`, and `DP_DISTCLEAN`. The **Project tooling** table on our language's
[reference page](../reference/languages/index.md) lists the tools the repository uses. A
script-based tool installs a launcher in `$(BINDIR)` and its payload in
`$(LIBDIR)/<repository>/00-hello-world/`. The answer key shows a complete `Makefile`:

```sh
git diff main -- 00-hello-world/Makefile
```

With unit tests written, we run everything the project must pass:

```sh
make -C 00-hello-world all test test-hidden lint
```

The unit tests run first. Then the public and the hidden suites each report:

```text
10 passed, 0 failed
```

and the lint tools finish without a complaint. Last, we complete the traceability matrix
(`rtm.md`) and the test plan (`master-test-plan.md`), including the start-up time and memory
measurement (NFR-02).

## Step 8: Run everything CI runs

From the repository root, `make check` checks the repository layout, verifies the toolchain,
and runs `all lint test test-hidden` for every project listed in `IMPLEMENTED` in the root
`Makefile`, which includes `00-hello-world`:

```sh
make check
```

The output starts with:

```text
repository: standard files, sdlc-curriculum, and project workspaces present
```

and ends with the hidden suite's `10 passed, 0 failed`.

## Step 9: Open a pull request

GitHub disables workflows in a new fork. We open our fork's **Actions** tab on GitHub and
enable them once. Then we commit with a sign-off, push, and open a pull request in our fork
(not in `dialectic-playground`, whose `main` already has the finished project):

```sh
git add 00-hello-world
git commit -s -m "feat(00-hello-world): implement dp-hello from the specification"
git push -u origin practice/00-hello-world
fork="$(gh api user --jq .login)/$slug"
gh pr create --repo "$fork" --base main --head practice/00-hello-world --fill
gh pr checks practice/00-hello-world --repo "$fork" --watch
```

CI builds and tests the project in the toolchain container and natively on Linux, macOS, and
Windows. When every check has finished, you should see **CI result** pass.

## What you have achieved

We implemented a curriculum project from its specification and proved it on three operating
systems. On the way we:

- read a user manual, an SRS, and black-box test cases as the source of truth;
- connected a language's build, test, and lint tools to the universal `Makefile` through its
  `DP_*` hooks;
- used the black-box runner and its diffs to drive the implementation;
- ran `make check` and opened a pull request that CI verified.

Next steps:

- [Run the black-box tests](../how-to/run-the-black-box-tests.md): select single tests and fix
  the most common failures.
- [Set up a language repository](../how-to/set-up-a-language-repository.md): bring a new
  language to the curriculum.
- [Cross-platform determinism](../explanation/cross-platform-determinism.md): why the
  specifications are byte-exact.
