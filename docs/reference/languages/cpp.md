# C++

The [`cpp`](https://github.com/dialectic-playground/cpp) repository implements the
[curriculum](../curriculum/index.md) in C++.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/cpp`](https://github.com/dialectic-playground/cpp) |
| Status | Active: Project 00 implemented |
| File extension | `.cpp` |
| Release line | C++20 (GCC 16 in the container) |
| Build / package tool | CMake |
| Curriculum | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
| Brand accent | `#D6336C`, glyph `c++`; GitHub Linguist `#F34B7D` (darkened to stay distinct from the rose antithesis ring) |

## Language characteristics

| Aspect | C++ |
| :-- | :-- |
| CLI classification | Included |
| Image category | Native Toolchain |
| Access to OS primitives | Absolute & Direct (POSIX system calls) |
| Entry-point mechanism | Kernel drops argc and argv pointers directly into main() |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `gcc:16-trixie`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/cpp/blob/main/Containerfile), plus `make`, `python3`, CMake, and `clang-format` (19.1.7, Debian trixie) |
| Native CI | G++ on Linux, Apple Clang on macOS, MinGW-w64 G++ on Windows, plus CMake; `clang-format==19.1.7` from PyPI on all three |

`make toolchain` verifies both environments. For C++, the native compiler differs by OS, so it runs a language-standard compile-and-run probe. It also checks that `clang-format` is on release line 19 everywhere.

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose | Tool |
| :-- | :-- |
| Unit tests | CTest, one executable per unit with small assertion helpers (no third-party framework) |
| Lint | Warning-free build (`-Wall -Wextra -Wpedantic -Wshadow -Wconversion -Werror`) and `clang-format --dry-run --Werror` |
| Format | `clang-format -i`, clang-format 19.1.7 (Google style, 100 columns) |
| Dependencies | None (no package manager); one CMake project per project |
| Build output (`BIN_DIR`) | `build/container/bin/` or `build/local/bin/`: the native executable (container and native builds never share a CMake cache) |
| Install | Copies the executable to `$(BINDIR)` |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | [Implemented](https://github.com/dialectic-playground/cpp/tree/main/00-hello-world) |
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

- Windows: the projects use the "MinGW Makefiles" generator (never MSVC), link the C++ runtime
  statically, and take UTF-16 arguments through `wmain` (`-municode`).

## See also

- [Languages](index.md)
- [Set up a language repository](../../how-to/set-up-a-language-repository.md)
