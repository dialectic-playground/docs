# Visual Basic

The [`vb`](https://github.com/dialectic-playground/vb) repository implements the
[curriculum](../curriculum/index.md) in Visual Basic.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/vb`](https://github.com/dialectic-playground/vb) |
| Status | Active: Project 00 implemented |
| File extension | `.vb` |
| Release line | VB.NET on .NET 10 (LTS) |
| Build / package tool | dotnet CLI (NuGet) |
| Curriculum | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
| Brand accent | `#945DB7`, glyph `vb`; GitHub Linguist `#945DB7` |

## Language characteristics

| Aspect | Visual Basic |
| :-- | :-- |
| CLI classification | Included |
| Image category | First-Class |
| Access to OS primitives | Medium-High (.NET platform hooks) |
| Entry-point mechanism | Runtime initializes and maps arguments to Main function |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `mcr.microsoft.com/dotnet/sdk:10.0`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/vb/blob/main/Containerfile), plus `make` and `python3` |
| Native CI | actions/setup-dotnet (10.0.x) |

`make toolchain` verifies both environments. It checks that every tool is on the release line above.

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose | Tool |
| :-- | :-- |
| Unit tests | xUnit 2.9.3 (`dotnet test`) |
| Lint | Compiler and .NET analyzers (`TreatWarningsAsErrors`, `Option Strict On`, `AnalysisLevel` latest-recommended) and `dotnet format --verify-no-changes` |
| Format | `dotnet format` (ships with the SDK) |
| Dependencies | NuGet with committed `packages.lock.json` files, restored with `--locked-mode`; SDK selected by `global.json` (10.0, rolling forward within 10.0) |
| Build output (`BIN_DIR`) | `bin/`: a framework-dependent, single-file apphost (`dp-hello`, `dp-hello.exe` on Windows) |
| Install | Copies the apphost to `$(BINDIR)`; it needs the .NET 10 runtime (`DOTNET_ROOT`, the registered install location, or the default location) |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | [Implemented](https://github.com/dialectic-playground/vb/tree/main/00-hello-world) |
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

### Notes

- The black-box runner clears the environment, so the apphost finds .NET through the registered
  install location (`/etc/dotnet/install_location` on Linux and macOS); native CI registers it.
- On POSIX, argument bytes that are not valid UTF-8 reach the program as U+FFFD (accepted in
  the HLD:
  [CONV-05](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/CLI-CONVENTIONS.md)
  defines arguments as UTF-8 text).

## See also

- [Languages](index.md)
- [Set up a language repository](../../how-to/set-up-a-language-repository.md)
