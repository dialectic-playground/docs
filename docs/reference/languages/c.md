# C

The [`c`](https://github.com/dialectic-playground/c) repository implements the
[curriculum](../curriculum/index.md) in C.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/c`](https://github.com/dialectic-playground/c) |
| Status | Active: repository and toolchain ready; no projects implemented yet |
| File extension | `.c` |
| Release line | C17 (GCC 16 in the container) |
| Build / package tool | make |
| Curriculum | Submodule pinned to [v1.2.1](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.2.1) |
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
| Container | `gcc:16-trixie`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/c/blob/main/Containerfile), plus `make` and `python3` |
| Native CI | GCC on Linux, Apple Clang on macOS, MinGW-w64 GCC on Windows |

`make toolchain` verifies both environments. For C, the native compiler differs by OS, so it runs a language-standard compile-and-run probe.

## Implemented projects

None yet. A project is implemented once it is listed in `IMPLEMENTED` in the repository's
root `Makefile`.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | Not started |
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

## See also

- [Languages](index.md)
- [Set up a language repository](../../how-to/set-up-a-language-repository.md)
