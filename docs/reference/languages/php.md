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

## See also

- [Languages](index.md)
- [Set up a language repository](../../how-to/set-up-a-language-repository.md)
