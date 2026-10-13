# TypeScript

The [`ts`](https://github.com/dialectic-playground/ts) repository implements the
[curriculum](../curriculum/index.md) in TypeScript.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/ts`](https://github.com/dialectic-playground/ts) |
| Status | Active: Project 00 implemented |
| File extension | `.ts` |
| Release line | Node.js 24 (LTS); TypeScript via tsc as a project dependency |
| Build / package tool | npm + tsc |
| Curriculum | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
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

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose | Tool |
| :-- | :-- |
| Unit tests | `node:test`, run on the compiled output (`node --test`) |
| Lint | `tsc --noEmit` (TypeScript 6.0.3, `"strict": true`), ESLint 10.12.0 with typescript-eslint 8.71.2 (strict type-checked), and `prettier --check` |
| Format | Prettier 3.9.10 |
| Dependencies | One npm package per project; exact development dependency versions in the committed `package-lock.json`, installed with `npm ci` |
| Build output (`BIN_DIR`) | `bin/`: an extensionless `#!/usr/bin/env node` launcher that loads the `tsc` output in `dist/` |
| Install | Copies the compiled program to `$(LIBDIR)/ts/<project>/` and writes a `#!/bin/sh` launcher to `$(BINDIR)` |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | [Implemented](https://github.com/dialectic-playground/ts/tree/main/00-hello-world) |
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

- TypeScript stays on 6.0 (6.0.3) because typescript-eslint supports only TypeScript below 6.1;
  Dependabot ignores TypeScript minor and major updates until both move together.
- NFR-02
  ([CONV-31](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/CLI-CONVENTIONS.md)):
  peak memory is about 50 MiB, of which the Node.js 24 runtime (`node -e 0`) accounts for about
  48 MiB; dp-hello adds under 2 MiB.

## See also

- [Languages](index.md)
- [Set up a language repository](../../how-to/set-up-a-language-repository.md)
