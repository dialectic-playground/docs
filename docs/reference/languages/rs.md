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
