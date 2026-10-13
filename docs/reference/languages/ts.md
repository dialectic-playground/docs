# TypeScript

The [`ts`](https://github.com/dialectic-playground/ts) repository implements the
[curriculum](../curriculum/index.md) in TypeScript.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/ts`](https://github.com/dialectic-playground/ts) |
| Status | Active: repository and toolchain ready; no projects implemented yet |
| File extension | `.ts` |
| Release line | Node.js 24 (LTS); TypeScript via tsc as a project dependency |
| Build / package tool | npm + tsc |
| Curriculum | Submodule pinned to [v1.2.1](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.2.1) |
| Brand accent | `#3178C6`, glyph `ts`; GitHub Linguist `#3178C6` |

## Language characteristics

| Aspect | TypeScript |
| :-- | :-- |
| CLI classification | Included |
| Image category | First-Class |
| Access to OS primitives | High (via V8 Node.js runtime wrappers) |
| Entry-point mechanism | Host binary consumes kernel flags first; residual args go to process.argv |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `node:24-trixie-slim`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/ts/blob/main/Containerfile), plus `make` and `python3` |
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
