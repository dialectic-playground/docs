# C

The [`c`](https://github.com/dialectic-playground/c) repository implements the
[curriculum](../curriculum/index.md) in C.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/c`](https://github.com/dialectic-playground/c) |
| Status | Active: Project 00 implemented |
| File extension | `.c` |
| Release line | C17 (GCC 16 in the container) |
| Build / package tool | make |
| Curriculum | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
| Brand accent | `#A3A3A3`, glyph `c`; GitHub Linguist `#555555` (lightened for contrast on the dark background) |

## Language characteristics

| Aspect | C |
| :-- | :-- |
| CLI classification | Included |
| Image category | Native Toolchain |
| Access to OS primitives | Absolute & Direct (POSIX system calls) |
| Entry-point mechanism | Kernel drops argc and argv pointers directly into main() |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `gcc:16-trixie`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/c/blob/main/Containerfile), plus `make`, `python3`, and `clang-format` (19.1.7, Debian trixie) |
| Native CI | GCC on Linux, Apple Clang on macOS, MinGW-w64 GCC on Windows; `clang-format==19.1.7` from PyPI on all three |

`make toolchain` verifies both environments. For C, the native compiler differs by OS, so it runs a language-standard compile-and-run probe. It also checks that `clang-format` is version 19.1.7 everywhere.

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose | Tool |
| :-- | :-- |
| Unit tests | Plain C checks with the repository's own small runner (`src/tests/unit_test.[ch]`) |
| Lint | Warning-free build (`-std=c17 -Wall -Wextra -Wpedantic -Wshadow -Wstrict-prototypes -Wconversion -Werror`) and `clang-format --dry-run --Werror` |
| Format | `clang-format -i`, clang-format 19.1.7 (Google style, 100 columns; one `.clang-format` shared with C++ and Objective-C) |
| Dependencies | None (no package manager) |
| Build output (`BIN_DIR`) | `build/bin/`: the native executable (`dp-hello.exe` on Windows) |
| Install | Copies the executable to `$(BINDIR)` |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | [Implemented](https://github.com/dialectic-playground/c/tree/main/00-hello-world) |
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

- Windows (MinGW-w64): the tools enter through `wmain` (`-municode`), convert the UTF-16
  command line to UTF-8, and switch stdout and stderr to binary mode, so arguments and output
  bytes match Linux and macOS.

## See also

- [Languages](index.md)
- [Set up a language repository](../../how-to/set-up-a-language-repository.md)
