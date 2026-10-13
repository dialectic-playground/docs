# JavaScript

The [`js`](https://github.com/dialectic-playground/js) repository implements the
[curriculum](../curriculum/index.md) in JavaScript.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/js`](https://github.com/dialectic-playground/js) |
| Status | Active: Project 00 implemented |
| File extension | `.js` |
| Release line | Node.js 24 (LTS) |
| Build / package tool | npm |
| Curriculum | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
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

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose | Tool |
| :-- | :-- |
| Unit tests | `node:test` (`node --test`, built in) |
| Lint | ESLint 10.12.0 (flat config, `--max-warnings 0`) and `prettier --check` |
| Format | Prettier 3.9.10 |
| Dependencies | One npm package per project; exact development dependency versions in the committed `package-lock.json`, installed with `npm ci` |
| Build output (`BIN_DIR`) | `src/bin/`: an extensionless `#!/usr/bin/env node` launcher |
| Install | Copies the program to `$(LIBDIR)/js/<project>/` and writes a `#!/bin/sh` launcher to `$(BINDIR)` |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | [Implemented](https://github.com/dialectic-playground/js/tree/main/00-hello-world) |
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

- NFR-02
  ([CONV-31](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/CLI-CONVENTIONS.md)):
  peak memory (about 47 MiB) is the Node.js 24 runtime's own baseline (`node -e 0`, about 47–49
  MiB), so it is measured above that baseline.

## See also

- [Languages](index.md)
- [Set up a language repository](../../how-to/set-up-a-language-repository.md)
