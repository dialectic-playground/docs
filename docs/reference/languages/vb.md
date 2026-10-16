# Visual Basic

The [`vb`](https://github.com/dialectic-playground/vb) repository implements the
[curriculum](../curriculum/index.md) in Visual Basic.

## Summary

| Property             | Value                                                                                                     |
| :------------------- | :-------------------------------------------------------------------------------------------------------- |
| Repository           | [`dialectic-playground/vb`](https://github.com/dialectic-playground/vb)                                   |
| Status               | Active: Project 00 implemented                                                                            |
| File extension       | `.vb`                                                                                                     |
| Release line         | VB.NET on .NET 10 (LTS)                                                                                   |
| Build / package tool | dotnet CLI (NuGet)                                                                                        |
| Curriculum           | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
| Brand accent         | `#945DB7`, glyph `vb`; GitHub Linguist `#945DB7`                                                          |

## Language characteristics

| Aspect                  | Visual Basic                                            |
| :---------------------- | :------------------------------------------------------ |
| CLI classification      | Included                                                |
| Image category          | First-Class                                             |
| Access to OS primitives | Medium-High (.NET platform hooks)                       |
| Entry-point mechanism   | Runtime initializes and maps arguments to Main function |

## Toolchain

| Environment | Toolchain                                                                                                                                                                 |
| :---------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Container   | `mcr.microsoft.com/dotnet/sdk:10.0`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/vb/blob/main/Containerfile), plus `make` and `python3` |
| Native CI   | actions/setup-dotnet (10.0.x)                                                                                                                                             |

`make toolchain` verifies both environments. It checks that every tool is on the release line above.

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose                  | Tool                                                                                                                                                  |
| :----------------------- | :---------------------------------------------------------------------------------------------------------------------------------------------------- |
| Unit tests               | xUnit 2.9.3 (`dotnet test`)                                                                                                                           |
| Lint                     | Compiler and .NET analyzers (`TreatWarningsAsErrors`, `Option Strict On`, `AnalysisLevel` latest-recommended) and `dotnet format --verify-no-changes` |
| Format                   | `dotnet format` (ships with the SDK)                                                                                                                  |
| Dependencies             | NuGet with committed `packages.lock.json` files, restored with `--locked-mode`; SDK selected by `global.json` (10.0, rolling forward within 10.0)     |
| Build output (`BIN_DIR`) | `bin/`: a framework-dependent, single-file apphost (`dp-hello`, `dp-hello.exe` on Windows)                                                            |
| Install                  | Copies the apphost to `$(BINDIR)`; it needs the .NET 10 runtime (`DOTNET_ROOT`, the registered install location, or the default location)             |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| #   | Project        | Status                                                                             |
| :-- | :------------- | :--------------------------------------------------------------------------------- |
| 00  | hello-world    | [Implemented](https://github.com/dialectic-playground/vb/tree/main/00-hello-world) |
| 01  | echo           | Not started                                                                        |
| 02  | cat            | Not started                                                                        |
| 03  | head-tail      | Not started                                                                        |
| 04  | wc             | Not started                                                                        |
| 05  | grep-lite      | Not started                                                                        |
| 06  | find-lite      | Not started                                                                        |
| 07  | diff-lite      | Not started                                                                        |
| 08  | env-run        | Not started                                                                        |
| 09  | kv-store       | Not started                                                                        |
| 10  | sys-monitor    | Not started                                                                        |
| 11  | kinder         | Not started                                                                        |
| 12  | convert        | Not started                                                                        |
| 13  | taxes          | Not started                                                                        |
| 14  | taxes-file     | Not started                                                                        |
| 15  | stats          | Not started                                                                        |
| 16  | bargraph       | Not started                                                                        |
| 17  | stream-filters | Not started                                                                        |
| 18  | primes         | Not started                                                                        |
| 19  | calendar       | Not started                                                                        |
| 20  | bargraph-grade | Not started                                                                        |
| 21  | resistor       | Not started                                                                        |
| 22  | dice           | Not started                                                                        |
| 23  | recursion      | Not started                                                                        |
| 24  | tromino        | Not started                                                                        |
| 25  | max            | Not started                                                                        |
| 26  | cars           | Not started                                                                        |
| 27  | line-wrap      | Not started                                                                        |
| 28  | cars-modular   | Not started                                                                        |
| 29  | strlen         | Not started                                                                        |
| 30  | matmult        | Not started                                                                        |
| 31  | phone          | Not started                                                                        |
| 32  | percolation    | Not started                                                                        |
| 33  | reverse        | Not started                                                                        |
| 34  | parallel-sort  | Not started                                                                        |
| 35  | sort-bench     | Not started                                                                        |
| 36  | page           | Not started                                                                        |
| 37  | calc           | Not started                                                                        |
| 38  | sched          | Not started                                                                        |
| 39  | size           | Not started                                                                        |
| 40  | relative-file  | Not started                                                                        |
| 41  | films          | Not started                                                                        |
| 42  | sales-report   | Not started                                                                        |
| 43  | linked-list    | Not started                                                                        |
| 44  | line-editor    | Not started                                                                        |
| 45  | queue-stack    | Not started                                                                        |
| 46  | infix          | Not started                                                                        |
| 47  | bfs            | Not started                                                                        |
| 48  | astar          | Not started                                                                        |
| 49  | assert-sort    | Not started                                                                        |
| 50  | fault-recovery | Not started                                                                        |
| 51  | koch           | Not started                                                                        |
| 52  | spacecraft     | Not started                                                                        |

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
