# Run the black-box tests

This guide runs a project's public and hidden black-box suites against your build and helps
you read the failures.

**Assumes:** a language repository whose project `Makefile` hooks are configured (see
[Set up a language repository](set-up-a-language-repository.md)), and Python 3.11 or newer
for the test runner.

## Run the suites through make

From the project directory (for example `00-hello-world/`):

| Command              | Runs                                                            |
| :------------------- | :-------------------------------------------------------------- |
| `make test`          | Language unit tests (`DP_UNIT_TEST`), then the **public** suite |
| `make test-blackbox` | The public suite only (10 tests)                                |
| `make test-hidden`   | The **hidden** suite only (10 tests); CI runs it on every OS    |
| `make grade`         | Both suites                                                     |

Each target builds first (`make all`), then calls the curriculum's runner with your `BIN_DIR`.
Like every target, they run in your repository's toolchain container by default, so they
test the Linux build. To test your own operating system's native build, add
`DP_RUNTIME=local` (for example `DP_RUNTIME=local make test`). CI does both. See
[Container-first development](../explanation/container-first-development.md).

## Run one test directly

Call the runner yourself to select tests or change the timeout:

```sh
python3 ../sdlc-curriculum/shared/tools/run-tests.py \
    --bin-dir build/bin --only 03 --only 07 \
    ../sdlc-curriculum/projects/00-hello-world/tests/public
```

| Option          | Effect                                                                                               |
| :-------------- | :--------------------------------------------------------------------------------------------------- |
| `--bin-dir DIR` | Where the built `dp-*` tools are: native executables (`.exe` is accepted on Windows) or `#!` scripts |
| `--only ID`     | Run only this test; repeat it to run several                                                         |
| `--timeout S`   | Per-step timeout in seconds (default 10)                                                             |
| `-q`            | Print PASS/FAIL only, without diffs                                                                  |

The runner exits with `0` when every test passes, `1` when a test fails, and `2` for a
configuration error such as a missing tool.

## Read a failure

A failing test prints a unified diff for each mismatching stream (stdout, stderr, exit), with
`expected` against `actual`:

```text
  FAIL  01
  --- stdout ---
    --- expected
    +++ actual
    @@ -1 +1 @@
    -Hello, World!
    +Hello, World!\r
```

Carriage returns appear as `\r`, so line-ending bugs are visible. Every comparison is
byte-for-byte.

## Fix the most common causes

| Symptom in the diff                                               | Cause                                                       | Fix                                                                        |
| :---------------------------------------------------------------- | :---------------------------------------------------------- | :------------------------------------------------------------------------- |
| `\r` at the end of every line (Windows only)                      | Text-mode stdout translates LF to CRLF                      | Write stdout and stderr in binary mode ([CONV-03][conv])                   |
| Last line differs only in its newline                             | Missing or extra trailing LF                                | Follow the SRS output definition exactly                                   |
| `No such file or directory` vs. an OS-specific message            | The OS error text was printed                               | Use the fixed reason table ([CONV-16][conv])                               |
| Program name differs (`dp-cat.exe:` or a path)                    | `argv[0]` was used in messages                              | Use the canonical tool name ([CONV-01][conv])                              |
| Paths contain `\` on Windows                                      | The OS path joiner was used                                 | Join constructed paths with `/` ([CONV-20][conv])                          |
| Help text differs                                                 | Help text was paraphrased                                   | Copy it byte-for-byte from the user manual's HELP OUTPUT ([CONV-23][conv]) |
| `tool 'dp-x' not found`                                           | `make all` did not produce the tool in `BIN_DIR`            | Check `DP_BUILD` and `BIN_DIR` with `make help`                            |
| `… is neither an .exe nor a script with a #! line` (Windows only) | The tool in `BIN_DIR` is a script without a `#!` first line | Start the launcher with a `#!` line (see below)                            |
| `interpreter '…' not found on PATH` (Windows only)                | The `#!` interpreter is not installed or not on `PATH`      | Put the interpreter (for example `node`, `perl`, `java`) on `PATH`         |

## Test script tools on Windows

Tools in interpreted or managed-runtime languages are usually `#!` launcher scripts, for
example `#!/usr/bin/env node` or `#!/usr/bin/env -S julia --startup-file=no`. Windows has no
shebang support, so on Windows the runner reads the script's `#!` line itself:

1. It drops `/usr/bin/env` and its `-S` flag, if present.
2. It resolves the interpreter's name on `PATH` (an absolute interpreter path is used as-is
   only if it exists).
3. It starts the interpreter directly, with the `#!` line's arguments and the script path,
   never through `cmd.exe`, so the test's arguments arrive unmodified
   ([CONV-27][conv]).

So the same `make test` works on every OS, as long as the interpreter is on `PATH` in the
shell you run it from. Native executables (`dp-x.exe`) are preferred when both exist. To run
an installed script tool yourself on Windows, use Git Bash or MSYS2, which honor `#!` lines.

## How the tests run

Each test runs in a fresh temporary copy of the suite's fixtures, without a shell, with empty
stdin (unless the test redirects it) and a minimal environment. See
[Cross-platform determinism](../explanation/cross-platform-determinism.md) for the reasons, and
the [runner's documentation][runner] for the exact test format.

[conv]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/CLI-CONVENTIONS.md
[runner]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/tools/run-tests.py
