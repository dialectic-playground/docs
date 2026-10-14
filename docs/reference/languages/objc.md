# Objective-C

The [`objc`](https://github.com/dialectic-playground/objc) repository implements the
[curriculum](../curriculum/index.md) in Objective-C.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/objc`](https://github.com/dialectic-playground/objc) |
| Status | Active: Project 00 implemented |
| File extension | `.m` |
| Release line | Objective-C with Foundation (GNUstep Base; Apple Foundation on macOS) |
| Build / package tool | GNU Make, with `gnustep-config` supplying the GNUstep flags |
| Curriculum | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
| Brand accent | `#438EFF`, glyph `m`; GitHub Linguist `#438EFF` |

## Language characteristics

| Aspect | Objective-C |
| :-- | :-- |
| CLI classification | Included |
| Image category | Native Toolchain |
| Access to OS primitives | Absolute & Direct (Strict superset of C) |
| Entry-point mechanism | Compiles directly; maps arguments using standard C main structure |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `debian:trixie-slim + GCC Objective-C + GNUstep Base`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/objc/blob/main/Containerfile), plus `make`, `python3`, and `clang-format` (19.1.7, Debian trixie) |
| Native CI | Linux: GCC Objective-C + GNUstep Base (apt); macOS: Apple Clang + Foundation; Windows: MSYS2 CLANG64 with GNUstep Base and libobjc2; `clang-format==19.1.7` from PyPI on all three |

`make toolchain` verifies both environments. For Objective-C, the native compiler differs by OS, so it runs a language-standard compile-and-run probe. It also checks that `clang-format` is version 19.1.7 everywhere.

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose | Tool |
| :-- | :-- |
| Unit tests | Plain assertions with the repository's own small runner (`src/Tests/DPHTestSupport.[hm]`) |
| Lint | Warning-free build (`-std=gnu11 -Wall -Werror`, plus GNUstep's own flags) and `clang-format --dry-run --Werror` |
| Format | `clang-format -i`, clang-format 19.1.7 (Google style, 100 columns, pointer left) |
| Dependencies | None beyond Foundation (no package manager) |
| Build output (`BIN_DIR`) | `build/bin/`: the native executable (`dp-hello.exe` on Windows) |
| Install | Copies the executable to `$(BINDIR)` |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | [Implemented](https://github.com/dialectic-playground/objc/tree/main/00-hello-world) |
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

- One code base for GCC with GNUstep Base, Apple Clang with Foundation, and Clang with libobjc2
  (MSYS2). GCC has no ARC, `@autoreleasepool`, or `@[]`/`@{}`/`@()` literals, so the code uses
  manual reference counting with `NSAutoreleasePool`.
- Windows: builds enter through `wmain` (`-municode`), convert the UTF-16 command line to
  UTF-8, and write binary-mode stdout and stderr. MSYS2 ships a newer `clang-format`, so the
  PyPI 19.1.7 one must come first on `PATH`.

## See also

- [Languages](index.md)
- [Set up a language repository](../../how-to/set-up-a-language-repository.md)
