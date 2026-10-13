# Go

The [`go`](https://github.com/dialectic-playground/go) repository implements the
[curriculum](../curriculum/index.md) in Go.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/go`](https://github.com/dialectic-playground/go) |
| Status | Active: repository and toolchain ready; no projects implemented yet |
| File extension | `.go` |
| Release line | Go 1.27 |
| Build / package tool | Go modules |
| Curriculum | Submodule pinned to [v1.2.1](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.2.1) |
| Brand accent | `#0087A8`, glyph `go`; GitHub Linguist `#00ADD8` (darkened to stay distinct from the sky thesis ring) |

## Language characteristics

| Aspect | Go |
| :-- | :-- |
| CLI classification | Included |
| Image category | First-Class |
| Access to OS primitives | High (wrapped for async goroutine scheduler) |
| Entry-point mechanism | Compiled-in runtime sets up engine and slices args to os.Args |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `golang:1.27-trixie`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/go/blob/main/Containerfile), plus `make` and `python3` |
| Native CI | actions/setup-go (1.27.x) |

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
