# Haskell

The [`hs`](https://github.com/dialectic-playground/hs) repository implements the
[curriculum](../curriculum/index.md) in Haskell.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/hs`](https://github.com/dialectic-playground/hs) |
| Status | Active: Project 00 implemented |
| File extension | `.hs` |
| Release line | GHC 9.14 |
| Build / package tool | cabal |
| Curriculum | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
| Brand accent | `#7562A8`, glyph `hs`; GitHub Linguist `#5E5086` (lightened for contrast on the dark background) |

## Language characteristics

| Aspect | Haskell |
| :-- | :-- |
| CLI classification | Included |
| Image category | First-Class |
| Access to OS primitives | High (via System.Environment primitives) |
| Entry-point mechanism | Compiles to binary; runtime initializes and wraps options to getArgs |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `haskell:9.14-slim-bookworm`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/hs/blob/main/Containerfile), plus `make`, `python3`, and the hlint and ormolu release binaries (SHA-256 verified; x86_64 only, so use `DP_PLATFORM=linux/amd64` on other hosts) |
| Native CI | haskell-actions/setup (GHC 9.14.1, latest cabal), plus the same hlint and ormolu release binaries |

`make toolchain` verifies both environments. It checks that every tool is on the release line above. It also checks that hlint and ormolu are the pinned versions.

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose | Tool |
| :-- | :-- |
| Unit tests | `cabal test` (an `exitcode-stdio-1.0` suite with a small assertion runner) |
| Lint | `cabal build all` with `-Wall -Wcompat -Werror`, hlint 3.10, and `ormolu --mode check` |
| Format | `ormolu --mode inplace`, ormolu 0.9.0.0 |
| Dependencies | One cabal package per project with a committed `cabal.project.freeze`; only packages that ship with GHC, with the Hackage index disabled |
| Build output (`BIN_DIR`) | `bin/`: the native executable, copied from the cabal build |
| Install | Copies the executable to `$(BINDIR)` |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | [Implemented](https://github.com/dialectic-playground/hs/tree/main/00-hello-world) |
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

- Linked with `-rtsopts=ignoreAll`, so every argument reaches the parser (`-n +RTS` is a name)
  and `GHCRTS` is ignored.
- On POSIX, `Main` sets the file-system encoding to UTF-8 (with round-trip escapes) before
  `getArgs`, so arguments decode the same under any locale; on Windows `getArgs` reads the
  UTF-16 command line.

## See also

- [Languages](index.md)
- [Set up a language repository](../../how-to/set-up-a-language-repository.md)
