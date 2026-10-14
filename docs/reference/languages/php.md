# PHP

The [`php`](https://github.com/dialectic-playground/php) repository implements the
[curriculum](../curriculum/index.md) in PHP.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/php`](https://github.com/dialectic-playground/php) |
| Status | Active: Project 00 implemented |
| File extension | `.php` |
| Release line | PHP 8.5 |
| Build / package tool | Composer |
| Curriculum | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
| Brand accent | `#777BB4`, glyph `php`; GitHub Linguist `#4F5D95` (lightened (PHP's own brand color) for contrast on the dark background) |

## Language characteristics

| Aspect | PHP |
| :-- | :-- |
| CLI classification | Included |
| Image category | First-Class |
| Access to OS primitives | High (via php-cli and standard streams) |
| Entry-point mechanism | Engine wraps CLI context and exposes args via argv |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `php:8.5-cli-trixie (+ composer:2)`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/php/blob/main/Containerfile), plus `make` and `python3` |
| Native CI | shivammathur/setup-php (8.5, Composer) |

`make toolchain` verifies both environments. It checks that every tool is on the release line above. It also checks that Composer is present.

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose | Tool |
| :-- | :-- |
| Unit tests | PHPUnit 13.4.2 |
| Lint | `php -l`, PHPStan 2.3.1 (level max), and PHP-CS-Fixer `check` |
| Format | PHP-CS-Fixer 3.95.27 `fix` |
| Dependencies | One Composer project per project (`composer.json` + committed `composer.lock`); development tools only, installed into `vendor/` and run as `php vendor/bin/<tool>` |
| Build output (`BIN_DIR`) | `src/bin/`: a `#!/usr/bin/env php` script that loads `src/lib` with its own autoloader |
| Install | Copies `src/bin` and `src/lib` to `$(LIBDIR)/php/<project>/` and writes a `#!/bin/sh` launcher to `$(BINDIR)` |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | [Implemented](https://github.com/dialectic-playground/php/tree/main/00-hello-world) |
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
| 11 | kinder | Not started |
| 12 | convert | Not started |
| 13 | taxes | Not started |
| 14 | taxes-file | Not started |
| 15 | stats | Not started |
| 16 | bargraph | Not started |
| 17 | stream-filters | Not started |
| 18 | primes | Not started |
| 19 | calendar | Not started |
| 20 | bargraph-grade | Not started |
| 21 | resistor | Not started |
| 22 | dice | Not started |
| 23 | recursion | Not started |
| 24 | tromino | Not started |
| 25 | max | Not started |
| 26 | cars | Not started |
| 27 | line-wrap | Not started |
| 28 | cars-modular | Not started |
| 29 | strlen | Not started |
| 30 | matmult | Not started |
| 31 | phone | Not started |
| 32 | percolation | Not started |
| 33 | reverse | Not started |
| 34 | parallel-sort | Not started |
| 35 | sort-bench | Not started |
| 36 | page | Not started |
| 37 | calc | Not started |
| 38 | sched | Not started |
| 39 | size | Not started |
| 40 | relative-file | Not started |
| 41 | films | Not started |
| 42 | sales-report | Not started |
| 43 | linked-list | Not started |
| 44 | line-editor | Not started |
| 45 | queue-stack | Not started |
| 46 | infix | Not started |
| 47 | bfs | Not started |
| 48 | astar | Not started |
| 49 | assert-sort | Not started |
| 50 | fault-recovery | Not started |
| 51 | koch | Not started |
| 52 | spacecraft | Not started |

## See also

- [Languages](index.md)
- [Set up a language repository](../../how-to/set-up-a-language-repository.md)
