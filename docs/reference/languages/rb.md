# Ruby

The [`rb`](https://github.com/dialectic-playground/rb) repository implements the
[curriculum](../curriculum/index.md) in Ruby.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/rb`](https://github.com/dialectic-playground/rb) |
| Status | Active: Project 00 implemented |
| File extension | `.rb` |
| Release line | Ruby 4.0 |
| Build / package tool | Bundler |
| Curriculum | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
| Brand accent | `#CC342D`, glyph `rb`; GitHub Linguist `#701516` (lightened (Ruby's own brand red) for contrast on the dark background) |

## Language characteristics

| Aspect | Ruby |
| :-- | :-- |
| CLI classification | Included |
| Image category | First-Class |
| Access to OS primitives | High (via native process automation libraries) |
| Entry-point mechanism | Interpreter bootstraps file and wraps arguments into ARGV array |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `ruby:4.0-slim-trixie`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/rb/blob/main/Containerfile), plus `make`, `python3`, and `gcc`/`libc6-dev` (for the C extensions of the locked development gems) |
| Native CI | ruby/setup-ruby (4.0, includes Bundler; on Windows, RubyInstaller with the MSYS2 devkit) |

`make toolchain` verifies both environments. It checks that every tool is on the release line above.

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose | Tool |
| :-- | :-- |
| Unit tests | minitest 6.0.6 (a bundled gem, so it is listed in each `Gemfile`) |
| Lint | RuboCop 1.92.0 |
| Format | RuboCop `--autocorrect` |
| Dependencies | Per-project `Gemfile` and committed `Gemfile.lock` (exact versions and checksums); the tools themselves use only the standard library and run without Bundler |
| Build output (`BIN_DIR`) | `src/bin/`: an extensionless `#!/usr/bin/env ruby` launcher |
| Install | Copies `src/bin` and `src/lib` to `$(LIBDIR)/rb/<project>/` and writes a `#!/bin/sh` launcher to `$(BINDIR)` |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | [Implemented](https://github.com/dialectic-playground/rb/tree/main/00-hello-world) |
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
