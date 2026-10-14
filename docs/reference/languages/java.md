# Java

The [`java`](https://github.com/dialectic-playground/java) repository implements the
[curriculum](../curriculum/index.md) in Java.

## Summary

| Property | Value |
| :-- | :-- |
| Repository | [`dialectic-playground/java`](https://github.com/dialectic-playground/java) |
| Status | Active: Project 00 implemented |
| File extension | `.java` |
| Release line | Java 25 (LTS, Eclipse Temurin) |
| Build / package tool | Maven |
| Curriculum | Submodule pinned to [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) |
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
| Container | `maven:3-eclipse-temurin-25`, pinned by digest in [`Containerfile`](https://github.com/dialectic-playground/java/blob/main/Containerfile), plus `make`, `python3`, and `unzip` |
| Native CI | actions/setup-java (Temurin 25, Maven repository cache); Maven from each project's wrapper |

`make toolchain` verifies both environments. It checks that every tool is on the release line above. The Maven Enforcer also fails the build on any other Maven or Java release line.

### Project tooling

What each project's `Makefile` hooks run. Versions are the ones pinned in the repository
(lockfile, `Containerfile`, or CI).

| Purpose | Tool |
| :-- | :-- |
| Unit tests | JUnit 5.14.4 (Jupiter), run by Maven Surefire |
| Lint | `javac -Xlint:all -Werror` and Spotless 3.10.4 `check` |
| Format | Spotless `apply` with google-java-format 1.36.1 |
| Dependencies | Maven 3.10.0 through each project's checksum-pinned Maven Wrapper (`./mvnw`); every plugin version pinned in `pom.xml` |
| Build output (`BIN_DIR`) | `target/bin/`: an executable jar with a `#!` line prepended |
| Install | Copies the jar to `$(LIBDIR)/java/<project>/` and writes a `#!/bin/sh` launcher to `$(BINDIR)`; `java` 25 must be on `PATH` |

## Implemented projects

A project is implemented once it is listed in `IMPLEMENTED` in the repository's root
`Makefile`. CI then builds, lints, and tests it in the container and natively on Linux,
macOS, and Windows.

| # | Project | Status |
| :-- | :-- | :-- |
| 00 | hello-world | [Implemented](https://github.com/dialectic-playground/java/tree/main/00-hello-world) |
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

### Notes

- The jar's `#!` line is `#!/usr/bin/env -S LC_ALL=C.UTF-8 java -jar` on Linux and macOS, so
  the JVM decodes UTF-8 arguments under the runner's empty environment (`#!/usr/bin/env -S java
  -jar` on Windows).
- On Windows the programs re-read the UTF-16 command line (`GetCommandLineW`,
  `CommandLineToArgvW`) through the FFM API, so non-ASCII arguments arrive intact outside the
  ANSI code page.
- NFR-02
  ([CONV-31](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/CLI-CONVENTIONS.md)):
  at most 2.3 MiB above the JVM baseline (`java -jar empty.jar`, 37.8 MiB); no JVM tuning
  flags.

## See also

- [Languages](index.md)
- [Set up a language repository](../../how-to/set-up-a-language-repository.md)
