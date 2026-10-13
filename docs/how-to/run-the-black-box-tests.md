# Run the black-box tests

This guide runs a project's public and hidden black-box suites against your build and helps
you read the failures.

**Assumes:** a language repository whose project `Makefile` hooks are configured (see
[Set up a language repository](set-up-a-language-repository.md)), and Python 3.11 or newer
for the test runner.

## Run the suites through make

From the project directory (for example `00-hello-world/`):

| Command | Runs |
| :-- | :-- |
| `make test` | Language unit tests (`DP_UNIT_TEST`), then the **public** suite |
| `make test-blackbox` | The public suite only (10 tests) |
| `make test-hidden` | The **hidden** suite only (10 tests); CI runs it on every OS |
| `make grade` | Both suites |

Each target builds first (`make all`), then calls the curriculum's runner with your `BIN_DIR`.

## Run one test directly

Call the runner yourself to select tests or change the timeout:

```sh
python3 ../sdlc-curriculum/shared/tools/run-tests.py \
    --bin-dir build/bin --only 03 --only 07 \
    ../sdlc-curriculum/projects/00-hello-world/tests/public
```

| Option | Effect |
| :-- | :-- |
| `--bin-dir DIR` | Where the built `dp-*` executables are (`.exe` is accepted on Windows) |
| `--only ID` | Run only this test; repeat it to run several |
| `--timeout S` | Per-step timeout in seconds (default 10) |
| `-q` | Print PASS/FAIL only, without diffs |

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

| Symptom in the diff | Cause | Fix |
| :-- | :-- | :-- |
| `\r` at the end of every line (Windows only) | Text-mode stdout translates LF to CRLF | Write stdout and stderr in binary mode ([CONV-03][conv]) |
| Last line differs only in its newline | Missing or extra trailing LF | Follow the SRS output definition exactly |
| `No such file or directory` vs. an OS-specific message | The OS error text was printed | Use the fixed reason table ([CONV-16][conv]) |
| Program name differs (`dp-cat.exe:` or a path) | `argv[0]` was used in messages | Use the canonical tool name ([CONV-01][conv]) |
| Paths contain `\` on Windows | The OS path joiner was used | Join constructed paths with `/` ([CONV-20][conv]) |
| Help text differs | Help text was paraphrased | Copy it byte-for-byte from the user manual's HELP OUTPUT ([CONV-23][conv]) |
| `tool 'dp-x' not found` | `make all` did not produce the tool in `BIN_DIR` | Check `DP_BUILD` and `BIN_DIR` with `make help` |

## How the tests run

Each test runs in a fresh temporary copy of the suite's fixtures, without a shell, with empty
stdin (unless the test redirects it) and a minimal environment. See
[Cross-platform determinism](../explanation/cross-platform-determinism.md) for the reasons, and
the [runner's documentation][runner] for the exact test format.

[conv]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/CLI-CONVENTIONS.md
[runner]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/tools/run-tests.py
