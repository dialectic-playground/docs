# C#

The [`cs`](https://github.com/dialectic-playground/cs) repository implements the
[curriculum](../curriculum/index.md) in C#.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/cs`](https://github.com/dialectic-playground/cs) |
| Status | Active: Project 00 implemented |
| File extension | `.cs` |
| Release line | .NET 10 (LTS) |
| Build / package tool | dotnet CLI (NuGet) |
| Curriculum | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
| Brand accent | `#178600`, glyph `c#`; GitHub Linguist `#178600` |

## Language characteristics

| Aspect | C# |
| :-- | :-- |
| CLI classification | Included |
| Image category | First-Class |
| Access to OS primitives | Runtime wraps system arguments into top-level Main() array |
| Entry-point mechanism | Application Level (deep native reflection tools) |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `mcr.microsoft.com/dotnet/sdk:10.0`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/cs/blob/main/Containerfile), plus `make` and `python3` |
| Native CI | actions/setup-dotnet (10.0.x) |

`make toolchain` verifies both environments. It checks that every tool is on the release line above.

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose | Tool |
| :-- | :-- |
| Unit tests | xUnit v3 (`xunit.v3` 4.0.2) on Microsoft.Testing.Platform (`dotnet test --solution`) |
| Lint | `dotnet build` with `TreatWarningsAsErrors`, the .NET analyzers (`AnalysisLevel latest`, `Recommended`), and `EnforceCodeStyleInBuild`; then `dotnet format --verify-no-changes` |
| Format | `dotnet format` (ships with the SDK; style in `src/.editorconfig`) |
| Dependencies | NuGet with committed `packages.lock.json` files, restored with `--locked-mode`; SDK selected by `src/global.json` (10.0.100, `rollForward: latestFeature`) |
| Build output (`BIN_DIR`) | `bin/`: a framework-dependent, single-file apphost (`dp-hello`, `dp-hello.exe` on Windows) |
| Install | Copies the apphost to `$(BINDIR)`; it needs the .NET 10 runtime (standard location or `DOTNET_ROOT`) |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | [Implemented](https://github.com/dialectic-playground/cs/tree/main/00-hello-world) |
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

- Output is written as UTF-8 bytes to the raw standard streams
  (`Console.OpenStandardOutput()`), never through `Console.Out`, so there is no console code
  page or newline translation.
- `RuntimeIdentifiers` lists all six desktop runtime identifiers, so `packages.lock.json` is
  the same on every OS and `--locked-mode` restores work everywhere.
- On POSIX, argument bytes that are not valid UTF-8 reach the program as U+FFFD (documented in
  the HLD; outside the specification's UTF-8 assumption).

## See also

- [Languages](index.md)
- [Set up a language repository](../../how-to/set-up-a-language-repository.md)
