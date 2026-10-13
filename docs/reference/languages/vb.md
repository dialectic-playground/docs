# Visual Basic

The [`vb`](https://github.com/dialectic-playground/vb) repository implements the
[curriculum](../curriculum/index.md) in Visual Basic.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/vb`](https://github.com/dialectic-playground/vb) |
| Status | Active: repository and toolchain ready; no projects implemented yet |
| File extension | `.vb` |
| Release line | VB.NET on .NET 10 (LTS) |
| Build / package tool | dotnet CLI (NuGet) |
| Curriculum | Submodule pinned to [v1.2.1](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.2.1) |
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
