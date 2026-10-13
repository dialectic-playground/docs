# Rust

The [`rs`](https://github.com/dialectic-playground/rs) repository implements the
[curriculum](../curriculum/index.md) in Rust.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/rs`](https://github.com/dialectic-playground/rs) |
| Status | Active: Project 00 implemented |
| File extension | `.rs` |
| Release line | Rust 1.99 |
| Build / package tool | cargo |
| Curriculum | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
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
| Container | `rust:1.99-slim-trixie`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/rs/blob/main/Containerfile), plus `make`, `python3`, and the clippy and rustfmt components |
| Native CI | rustup (preinstalled): rustup toolchain install 1.99, plus the clippy and rustfmt components |

`make toolchain` verifies both environments. It checks that every tool is on the release line above. It also checks that clippy and rustfmt are installed.

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose | Tool |
| :-- | :-- |
| Unit tests | `cargo test` (built-in test harness; `#[cfg(test)]` modules next to the code) |
| Lint | `cargo clippy --all-targets -- -D warnings` and `cargo fmt --check` |
| Format | `cargo fmt` (rustfmt from the 1.99 toolchain) |
| Dependencies | One cargo package per project (`Cargo.toml` + committed `Cargo.lock`); builds use `--locked` |
| Build output (`BIN_DIR`) | `target/release/`: the native executable |
| Install | Copies the executable to `$(BINDIR)` |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | [Implemented](https://github.com/dialectic-playground/rs/tree/main/00-hello-world) |
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
