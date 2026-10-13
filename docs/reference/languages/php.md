# PHP

The [`php`](https://github.com/dialectic-playground/php) repository implements the
[curriculum](../curriculum/index.md) in PHP.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/php`](https://github.com/dialectic-playground/php) |
| Status | Active: repository and toolchain ready; no projects implemented yet |
| File extension | `.php` |
| Release line | PHP 8.5 |
| Build / package tool | Composer |
| Curriculum | Submodule pinned to [v1.2.1](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.2.1) |
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
