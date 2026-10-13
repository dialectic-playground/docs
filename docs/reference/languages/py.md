# Python

The [`py`](https://github.com/dialectic-playground/py) repository implements the
[curriculum](../curriculum/index.md) in Python.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/py`](https://github.com/dialectic-playground/py) |
| Status | Active: repository and toolchain ready; no projects implemented yet |
| File extension | `.py` |
| Release line | Python 3.14 |
| Build / package tool | uv |
| Curriculum | Submodule pinned to [v1.2.1](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.2.1) |
| Brand accent | `#3572A5`, glyph `py`; GitHub Linguist `#3572A5` |

## Language characteristics

| Aspect | Python |
| :-- | :-- |
| CLI classification | Included |
| Image category | First-Class |
| Access to OS primitives | High (via sys/os/subprocess) |
| Entry-point mechanism | Interpreter maps args to high-level sys.argv list |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `python:3.14-slim-trixie (+ uv)`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/py/blob/main/Containerfile), plus `make` and `python3` |
| Native CI | astral-sh/setup-uv, then uv python install 3.14 |

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
