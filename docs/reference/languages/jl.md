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
