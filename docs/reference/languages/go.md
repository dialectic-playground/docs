# Go

The [`go`](https://github.com/dialectic-playground/go) repository implements the
[curriculum](../curriculum/index.md) in Go.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/go`](https://github.com/dialectic-playground/go) |
| Status | Active: Project 00 implemented |
| File extension | `.go` |
| Release line | Go 1.27 |
| Build / package tool | Go modules |
| Curriculum | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
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

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose | Tool |
| :-- | :-- |
| Unit tests | `go test ./...` (standard `testing` package) |
| Lint | `go vet ./...` and `gofmt -l` (fails if any file is listed) |
| Format | `gofmt -w` (always the toolchain's own version) |
| Dependencies | One Go module per project (`go.mod`); standard library only, so no `go.sum` |
| Build output (`BIN_DIR`) | `bin/`: the native executable (`go build -trimpath`) |
| Install | Copies the executable to `$(BINDIR)` |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | [Implemented](https://github.com/dialectic-playground/go/tree/main/00-hello-world) |
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
