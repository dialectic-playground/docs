# JavaScript

The [`js`](https://github.com/dialectic-playground/js) repository implements the
[curriculum](../curriculum/index.md) in JavaScript.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/js`](https://github.com/dialectic-playground/js) |
| Status | Active: repository and toolchain ready; no projects implemented yet |
| File extension | `.js` |
| Release line | Node.js 24 (LTS) |
| Build / package tool | npm |
| Curriculum | Submodule pinned to [v1.2.1](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.2.1) |
| Brand accent | `#F1E05A`, glyph `js`; GitHub Linguist `#F1E05A` |

## Language characteristics

| Aspect | JavaScript |
| :-- | :-- |
| CLI classification | Included |
| Image category | First-Class |
| Access to OS primitives | High (via V8 Node.js runtime wrappers) |
| Entry-point mechanism | Host binary consumes kernel flags first; residual args go to process.argv |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `node:24-trixie-slim`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/js/blob/main/Containerfile), plus `make` and `python3` |
| Native CI | actions/setup-node (24) |

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
