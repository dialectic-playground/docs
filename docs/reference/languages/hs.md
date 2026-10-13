# Haskell

The [`hs`](https://github.com/dialectic-playground/hs) repository implements the
[curriculum](../curriculum/index.md) in Haskell.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/hs`](https://github.com/dialectic-playground/hs) |
| Status | Active: repository and toolchain ready; no projects implemented yet |
| File extension | `.hs` |
| Release line | GHC 9.14 |
| Build / package tool | cabal |
| Curriculum | Submodule pinned to [v1.2.1](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.2.1) |
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
| Container | `haskell:9.14-slim-bookworm`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/hs/blob/main/Containerfile), plus `make` and `python3` |
| Native CI | haskell-actions/setup (GHC 9.14, latest cabal) |

`make toolchain` verifies both environments. It checks that every tool is on the release line above.

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
