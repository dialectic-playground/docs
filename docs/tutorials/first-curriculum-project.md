# Your first curriculum project

!!! info "Draft tutorial: written once the first language implementation exists"
    **Audience:** a developer new to the curriculum, comfortable with one programming language
    and a terminal.

    **Learning goal:** by the end, the learner has implemented `dp-hello`
    ([Project 00](https://github.com/dialectic-playground/sdlc-curriculum/tree/main/projects/00-hello-world))
    and seen all of its public black-box tests pass. On the way they will have met the
    curriculum's essentials: specifications, the universal `Makefile`, and the test runner.

## Outline

1. **What you will build:** show the finished tool's output (`Hello, World!`, `--help`, an
   error message).
2. **Get the curriculum:** clone a language repository with `sdlc-curriculum` as a submodule.
3. **Read the specification:** open the user manual and find the help text you must
   reproduce.
4. **Wire up the Makefile:** copy the project `Makefile` and fill in `BIN_DIR` and the first
   hook, `DP_BUILD`.
5. **Make the first test pass:** print `Hello, World!` and run `make test-blackbox`.
6. **Add options one at a time:** `--name`, then `--count`, re-running the tests after each.
7. **Handle mistakes:** produce the exact usage-error messages and exit status 2.
8. **Finish the contract:** add unit tests and fill in the remaining hooks (`DP_UNIT_TEST`,
   `DP_LINT`, …).
9. **What you have learned:** recap, with next steps into the
   [How-to guides](../how-to/index.md).

## Notes for the author

- Pick **one** language for the walkthrough, and keep every step copy-and-paste reliable.
- Link to the [CLI conventions](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/CLI-CONVENTIONS.md)
  instead of explaining them in detail.
- Start from `templates/tutorial.md` in this repository.
