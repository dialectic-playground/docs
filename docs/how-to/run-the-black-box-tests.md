# Run the black-box tests

!!! info "Planned how-to guide: this page is a placeholder"
    **Goal:** run a project's public and hidden black-box suites against your build, and
    read the failures.

    **Assumes:** a language repository whose project `Makefile` has its hooks set up.

## Planned steps

1. Run the public suite: `make test-blackbox`, or `make test` to run the unit tests first.
2. Run the hidden suite: `make test-hidden`, or `make grade` for both suites.
3. Run one test: call `run-tests.py --bin-dir … --only 03 <suite>` directly.
4. Read a failure diff: stdout, stderr, and exit sections, and CR bytes shown as `\r`.
5. Fix common causes: CRLF output on Windows, a missing trailing newline, OS error text
   instead of the fixed reasons.

Reference material for this guide lives in the curriculum's
[`run-tests.py`](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/tools/run-tests.py)
docstring. Start from `templates/how-to.md`.
