# Julia

The [`jl`](https://github.com/dialectic-playground/jl) repository implements the
[curriculum](../curriculum/index.md) in Julia.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/jl`](https://github.com/dialectic-playground/jl) |
| Status | Active: repository and toolchain ready; no projects implemented yet |
| File extension | `.jl` |
| Release line | Julia 1.13 |
| Build / package tool | Pkg |
| Curriculum | Submodule pinned to [v1.2.1](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.2.1) |
| Brand accent | `#389826`, glyph `jl`; GitHub Linguist `#A270BA` (replaced by Julia's logo green: the Linguist purple collides with Visual Basic and the organization violet) |

## Language characteristics

| Aspect | Julia |
| :-- | :-- |
| CLI classification | Included |
| Image category | First-Class |
| Access to OS primitives | High (explicit process wrappers) |
| Entry-point mechanism | Runtime targets calculations but populates global ARGS vector |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `julia:1.13-trixie`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/jl/blob/main/Containerfile), plus `make` and `python3` |
| Native CI | julia-actions/setup-julia (1.13) |

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
