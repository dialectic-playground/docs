# Julia

The [`jl`](https://github.com/dialectic-playground/jl) repository implements the
[curriculum](../curriculum/index.md) in Julia.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/jl`](https://github.com/dialectic-playground/jl) |
| Status | Active: Project 00 implemented |
| File extension | `.jl` |
| Release line | Julia 1.13 |
| Build / package tool | Pkg |
| Curriculum | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
| Brand accent | `#389826`, glyph `jl`; GitHub Linguist `#A270BA` (replaced by Julia's logo green: the Linguist purple collides with Visual Basic and the organization violet) |

## Language characteristics

| Aspect | Julia |
| :-- | :-- |
| CLI classification | Included |
| Image category | First-Class |
| Access to OS primitives | High (explicit process wrappers) |
| Entry-point mechanism | Runtime targets calculations but populates global ARGS vector |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `julia:1.13-trixie`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/jl/blob/main/Containerfile), plus `make` and `python3` |
| Native CI | julia-actions/setup-julia (1.13) |

`make toolchain` verifies both environments. It checks that every tool is on the release line above.

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose | Tool |
| :-- | :-- |
| Unit tests | `Test` (standard library), `test/runtests.jl` |
| Lint | Aqua 0.8.18 (`Aqua.test_all`) and a JuliaFormatter check |
| Format | JuliaFormatter 2.14.0 (Blue style, `.JuliaFormatter.toml`) |
| Dependencies | Each project is a Pkg workspace (`test/` and `dev/` environments) locked by one committed `Manifest.toml` |
| Build output (`BIN_DIR`) | `bin/`: an extensionless `#!/usr/bin/env -S julia --startup-file=no --compile=min -O0` launcher |
| Install | Copies the sources to `$(LIBDIR)/jl/<project>/` and writes a launcher with that absolute path to `$(BINDIR)` |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | [Implemented](https://github.com/dialectic-playground/jl/tree/main/00-hello-world) |
| 01 | echo | Not started |
| 02 | cat | Not started |
| 03 | head-tail | Not started |
| 04 | wc | Not started |
| 05 | grep-lite | Not started |
| 06 | find-lite | Not started |
| 07 | diff-lite | Not started |
| 08 | env-run | Not started |
| 09 | kv-store | Not started |
| 10 | sys-monitor | Not started |
| 11 | kinder | Not started |
| 12 | convert | Not started |
| 13 | taxes | Not started |
| 14 | taxes-file | Not started |
| 15 | stats | Not started |
| 16 | bargraph | Not started |
| 17 | stream-filters | Not started |
| 18 | primes | Not started |
| 19 | calendar | Not started |
| 20 | bargraph-grade | Not started |
| 21 | resistor | Not started |
| 22 | dice | Not started |
| 23 | recursion | Not started |
| 24 | tromino | Not started |
| 25 | max | Not started |
| 26 | cars | Not started |
| 27 | line-wrap | Not started |
| 28 | cars-modular | Not started |
| 29 | strlen | Not started |
| 30 | matmult | Not started |
| 31 | phone | Not started |
| 32 | percolation | Not started |
| 33 | reverse | Not started |
| 34 | parallel-sort | Not started |
| 35 | sort-bench | Not started |
| 36 | page | Not started |
| 37 | calc | Not started |
| 38 | sched | Not started |
| 39 | size | Not started |
| 40 | relative-file | Not started |
| 41 | films | Not started |
| 42 | sales-report | Not started |
| 43 | linked-list | Not started |
| 44 | line-editor | Not started |
| 45 | queue-stack | Not started |
| 46 | infix | Not started |
| 47 | bfs | Not started |
| 48 | astar | Not started |
| 49 | assert-sort | Not started |
| 50 | fault-recovery | Not started |
| 51 | koch | Not started |
| 52 | spacecraft | Not started |

### Notes

- The launcher `include`s the package sources relative to its own location instead of loading a
  precompiled package: the black-box runner passes only `PATH`
  ([CONV-29](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/CLI-CONVENTIONS.md)),
  so no depot is known. `--compile=min -O0` keeps start-up near 0.2 s.
- NFR-02
  ([CONV-31](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/CLI-CONVENTIONS.md)):
  peak RSS is about 43 MiB above the runtime baseline (159.7 MiB). Private memory (about 10
  MiB) is within the 32 MiB limit; total RSS is not, because of file-backed runtime pages. The
  gap is recorded in the repository's RTM.

## See also

- [Languages](index.md)
- [Set up a language repository](../../how-to/set-up-a-language-repository.md)
