# Rust

The [`rs`](https://github.com/dialectic-playground/rs) repository implements the
[curriculum](../curriculum/index.md) in Rust.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/rs`](https://github.com/dialectic-playground/rs) |
| Status | Active: repository and toolchain ready; no projects implemented yet |
| File extension | `.rs` |
| Release line | Rust 1.99 |
| Build / package tool | cargo |
| Curriculum | Submodule pinned to [v1.2.1](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.2.1) |
| Brand accent | `#DEA584`, glyph `rs`; GitHub Linguist `#DEA584` |

## Language characteristics

| Aspect | Rust |
| :-- | :-- |
| CLI classification | Included |
| Image category | First-Class |
| Access to OS primitives | Absolute & Direct (POSIX + memory boundaries) |
| Entry-point mechanism | Compiles directly to machine code; args mapped via std::env::args() |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `rust:1.99-slim-trixie`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/rs/blob/main/Containerfile), plus `make` and `python3` |
| Native CI | rustup (preinstalled): rustup toolchain install 1.99 |

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
