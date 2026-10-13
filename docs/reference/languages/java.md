# Java

The [`java`](https://github.com/dialectic-playground/java) repository implements the
[curriculum](../curriculum/index.md) in Java.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/java`](https://github.com/dialectic-playground/java) |
| Status | Active: repository and toolchain ready; no projects implemented yet |
| File extension | `.java` |
| Release line | Java 25 (LTS, Eclipse Temurin) |
| Build / package tool | Maven |
| Curriculum | Submodule pinned to [v1.2.1](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.2.1) |
| Brand accent | `#B07219`, glyph `jv`; GitHub Linguist `#B07219` |

## Language characteristics

| Aspect | Java |
| :-- | :-- |
| CLI classification | Included |
| Image category | First-Class |
| Access to OS primitives | Medium-High (abstracted via ProcessBuilder) |
| Entry-point mechanism | JVM host maps system args into public static void main() |

## Toolchain

| Environment | Toolchain |
| :-- | :-- |
| Container | `maven:3-eclipse-temurin-25`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/java/blob/main/Containerfile), plus `make` and `python3` |
| Native CI | actions/setup-java (Temurin 25); Maven is preinstalled on the runners |

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
