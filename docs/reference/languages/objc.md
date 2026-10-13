# Objective-C

The [`objc`](https://github.com/dialectic-playground/objc) repository implements the
[curriculum](../curriculum/index.md) in Objective-C.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/objc`](https://github.com/dialectic-playground/objc) |
| Status | Active: repository and toolchain ready; no projects implemented yet |
| File extension | `.m` |
| Release line | Objective-C with Foundation (GNUstep Base; Apple Foundation on macOS) |
| Build / package tool | GNUstep Make |
| Curriculum | Submodule pinned to [v1.2.1](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.2.1) |
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
| Container | `debian:trixie-slim + GCC Objective-C + GNUstep Base`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/objc/blob/main/Containerfile), plus `make` and `python3` |
| Native CI | Linux: GCC Objective-C + GNUstep Base (apt); macOS: Apple Clang + Foundation; Windows: MSYS2 CLANG64 with GNUstep Base and libobjc2 |

`make toolchain` verifies both environments. For Objective-C, the native compiler differs by OS, so it runs a language-standard compile-and-run probe.

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
