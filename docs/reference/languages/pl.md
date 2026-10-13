# Perl

The [`pl`](https://github.com/dialectic-playground/pl) repository implements the
[curriculum](../curriculum/index.md) in Perl.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/pl`](https://github.com/dialectic-playground/pl) |
| Status | Active: Project 00 implemented |
| File extension | `.pl` |
| Release line | Perl 5.42 (the newest line available on Linux, macOS, and Windows) |
| Build / package tool | cpanm (cpanfile) |
| Curriculum | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
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
| Container | `perl:5.42-slim-trixie`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/pl/blob/main/Containerfile), plus `make`, `python3`, Carton 1.0.35, and `gcc`/`libc6-dev` (for XS dependencies of Perl::Critic) |
| Native CI | shogo82148/actions-setup-perl (5.42, includes cpanm), plus Carton 1.0.35 |

`make toolchain` verifies both environments. It checks that every tool is on the release line above.

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose | Tool |
| :-- | :-- |
| Unit tests | Test::More and `prove` (Perl core), tests in `src/t/` |
| Lint | Perl::Critic 1.156 and `perltidy --assert-tidy` |
| Format | Perl::Tidy 20260826 |
| Dependencies | Per-project `cpanfile` (exact versions) and `cpanfile.snapshot` (Carton lockfile), installed into `local/`; the tools themselves use only core modules |
| Build output (`BIN_DIR`) | `src/bin/`: a `#!/usr/bin/env perl` script |
| Install | Copies `src/bin` and `src/lib` to `$(LIBDIR)/pl/<project>/` and writes a `#!/bin/sh` launcher to `$(BINDIR)` |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | [Implemented](https://github.com/dialectic-playground/pl/tree/main/00-hello-world) |
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

- Windows: perl.exe receives command-line arguments in the ANSI code page; dp-hello converts
  them to UTF-8, so characters outside that code page (for example CJK on a cp1252 system)
  cannot be represented.
- Git Bash puts its own, older `/usr/bin/perl` first on `PATH`; Perl 5.42 must come ahead of it
  (CI does this with `BASH_ENV`).

## See also

- [Languages](index.md)
- [Set up a language repository](../../how-to/set-up-a-language-repository.md)
