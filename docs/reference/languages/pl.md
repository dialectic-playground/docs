# Perl

The [`pl`](https://github.com/dialectic-playground/pl) repository implements the
[curriculum](../curriculum/index.md) in Perl.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/pl`](https://github.com/dialectic-playground/pl) |
| Status | Active: repository and toolchain ready; no projects implemented yet |
| File extension | `.pl` |
| Release line | Perl 5.42 (the newest line available on Linux, macOS, and Windows) |
| Build / package tool | cpanm (cpanfile) |
| Curriculum | Submodule pinned to [v1.2.1](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.2.1) |
| Brand accent | `#0298C3`, glyph `pl`; GitHub Linguist `#0298C3` |

## Language characteristics

| Aspect | Perl |
| :-- | :-- |
| CLI classification | Included |
| Image category | First-Class |
| Access to OS primitives | Absolute & Direct (original Unix stream system wrapper) |
| Entry-point mechanism | Interpreter maps argument arrays into structural @ARGV variable |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `perl:5.42-slim-trixie`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/pl/blob/main/Containerfile), plus `make` and `python3` |
| Native CI | shogo82148/actions-setup-perl (5.42, includes cpanm) |

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
