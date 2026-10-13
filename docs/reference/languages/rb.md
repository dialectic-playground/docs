# Ruby

The [`rb`](https://github.com/dialectic-playground/rb) repository implements the
[curriculum](../curriculum/index.md) in Ruby.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/rb`](https://github.com/dialectic-playground/rb) |
| Status | Active: repository and toolchain ready; no projects implemented yet |
| File extension | `.rb` |
| Release line | Ruby 4.0 |
| Build / package tool | Bundler |
| Curriculum | Submodule pinned to [v1.2.1](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.2.1) |
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
| Container | `ruby:4.0-slim-trixie`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/rb/blob/main/Containerfile), plus `make` and `python3` |
| Native CI | ruby/setup-ruby (4.0, includes Bundler) |

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
