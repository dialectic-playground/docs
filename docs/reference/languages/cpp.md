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

### Notes

- Windows: the projects use the "MinGW Makefiles" generator (never MSVC), link the C++ runtime
  statically, and take UTF-16 arguments through `wmain` (`-municode`).

## See also

- [Languages](index.md)
- [Set up a language repository](../../how-to/set-up-a-language-repository.md)
