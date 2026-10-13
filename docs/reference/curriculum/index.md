# Curriculum

The [`sdlc-curriculum`](https://github.com/dialectic-playground/sdlc-curriculum) repository
holds the authoritative specification for every project. This page indexes it; the linked
documents are the source of truth.

| Current release | Spec version | Pin language repositories to |
| :-- | :-- | :-- |
| [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) | `1.0.0` (printed by every tool's `--version`) | the release tag, never a branch |

Release tags and the spec version are separate: a release can add templates or tooling
without changing specified behavior. See the curriculum's
[versioning policy](https://github.com/dialectic-playground/sdlc-curriculum#versioning).

The links below point to `main`. For the exact text of a release, browse the repository at
its tag.

## Recent releases

None of these releases changes the specification version (`spec_version` stays `1.0.0`).

| Release | Changes |
| :-- | :-- |
| [v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0) | Tooling and CI hardening; no specification, test, or fixture changes. The CI template's **CI result** job checks every job of its run attempt through the Actions API, and CI runs weekly. The language skeleton's `TEMPLATE:` marker check searches only git-tracked files. |
| [v1.4.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.4.0) | Clarifications from the first implementations. CONV-12 (scan order): only option *syntax* errors compete with `--help`/`--version`; operand and option-value errors are detected after the scan (Project 00 FR-07/FR-09 and hidden test 10 updated). New CONV-31: NFR memory limits apply to native builds; managed and interpreted runtimes are measured above their runtime baseline. |
| [v1.3.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.3.0) | Script launchers on every OS. On Windows the black-box runner starts a `#!` script's interpreter directly, resolved on `PATH` (CONV-27). `BASE-MAKEFILE`: `BIN_DIR` may hold `#!` scripts, and the new `LIBDIR` (`$(PREFIX)/lib/dialectic-playground`) holds script payloads. |


## Projects

| # | Project | Tool(s) | User manual | SRS |
| :-- | :-- | :-- | :-- | :-- |
| 00 | Standard Terminal Hello World | `dp-hello` | [manual][m00] | [SRS][s00] |
| 01 | Stream Echo & Formatting | `dp-echo` | [manual][m01] | [SRS][s01] |
| 02 | Concatenate & Number Files | `dp-cat` | [manual][m02] | [SRS][s02] |
| 03 | Stream Slicing Utility | `dp-head`, `dp-tail` | [manual][m03] | [SRS][s03] |
| 04 | Word, Line, and Byte Counter | `dp-wc` | [manual][m04] | [SRS][s04] |
| 05 | Pattern Matching Search Engine | `dp-grep` | [manual][m05] | [SRS][s05] |
| 06 | Recursive File Discovery Suite | `dp-find` | [manual][m06] | [SRS][s06] |
| 07 | Line-by-Line File Comparison | `dp-diff` | [manual][m07] | [SRS][s07] |
| 08 | Environment Execution Wrapper | `dp-env` | [manual][m08] | [SRS][s08] |
| 09 | Local Key-Value Storage Engine (CLI + API) | `dp-kv` | [manual][m09] | [SRS][s09] |
| 10 | System Resource Telemetry Daemonic CLI | `dp-sysmon` | [manual][m10] | [SRS][s10] |

## Implementation status

Which projects each [language repository](../languages/index.md) implements, that is, lists
in `IMPLEMENTED` in its root `Makefile` (✓ links to the project's directory). Every
implementation passes the project's public and hidden black-box suites in its toolchain
container and natively on Linux, macOS, and Windows.

| # | Project | [`c`](../languages/c.md) | [`cs`](../languages/cs.md) | [`cpp`](../languages/cpp.md) | [`go`](../languages/go.md) | [`hs`](../languages/hs.md) | [`java`](../languages/java.md) | [`js`](../languages/js.md) | [`jl`](../languages/jl.md) | [`objc`](../languages/objc.md) | [`pl`](../languages/pl.md) | [`php`](../languages/php.md) | [`py`](../languages/py.md) | [`rb`](../languages/rb.md) | [`rs`](../languages/rs.md) | [`ts`](../languages/ts.md) | [`vb`](../languages/vb.md) | Implemented in |
| :-- | :-- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-- |
| 00 | hello-world | [✓](https://github.com/dialectic-playground/c/tree/main/00-hello-world) | [✓](https://github.com/dialectic-playground/cs/tree/main/00-hello-world) | [✓](https://github.com/dialectic-playground/cpp/tree/main/00-hello-world) | [✓](https://github.com/dialectic-playground/go/tree/main/00-hello-world) | [✓](https://github.com/dialectic-playground/hs/tree/main/00-hello-world) | [✓](https://github.com/dialectic-playground/java/tree/main/00-hello-world) | [✓](https://github.com/dialectic-playground/js/tree/main/00-hello-world) | [✓](https://github.com/dialectic-playground/jl/tree/main/00-hello-world) | [✓](https://github.com/dialectic-playground/objc/tree/main/00-hello-world) | [✓](https://github.com/dialectic-playground/pl/tree/main/00-hello-world) | [✓](https://github.com/dialectic-playground/php/tree/main/00-hello-world) | [✓](https://github.com/dialectic-playground/py/tree/main/00-hello-world) | [✓](https://github.com/dialectic-playground/rb/tree/main/00-hello-world) | [✓](https://github.com/dialectic-playground/rs/tree/main/00-hello-world) | [✓](https://github.com/dialectic-playground/ts/tree/main/00-hello-world) | [✓](https://github.com/dialectic-playground/vb/tree/main/00-hello-world) | 16 of 16 |
| 01 | echo | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 02 | cat | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 03 | head-tail | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 04 | wc | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 05 | grep-lite | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 06 | find-lite | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 07 | diff-lite | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 08 | env-run | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 09 | kv-store | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 10 | sys-monitor | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |

## Shared specifications

| Document | Describes |
| :-- | :-- |
| [CLI conventions][conv] | Option syntax, diagnostics, exit statuses, and output rules shared by every tool (CONV-01 … CONV-31) |
| [BASE-MAKEFILE][make] | The universal build contract: standard targets, `DP_*` hooks, and install locations (`PREFIX`, `BINDIR`, `LIBDIR`) |
| [run-tests.py][runner] | Black-box test format and harness conditions; starts `#!` script tools on Windows through their interpreter |
| [Document templates][tmpl] | HLD, LLD, RTM, Master Test Plan, Documentation Plan |

[conv]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/CLI-CONVENTIONS.md
[make]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/templates/BASE-MAKEFILE
[runner]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/tools/run-tests.py
[tmpl]: https://github.com/dialectic-playground/sdlc-curriculum/tree/main/shared/templates
[m00]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/00-hello-world/specs/user-manual.md
[s00]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/00-hello-world/specs/SRS.md
[m01]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/01-echo/specs/user-manual.md
[s01]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/01-echo/specs/SRS.md
[m02]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/02-cat/specs/user-manual.md
[s02]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/02-cat/specs/SRS.md
[m03]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/03-head-tail/specs/user-manual.md
[s03]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/03-head-tail/specs/SRS.md
[m04]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/04-wc/specs/user-manual.md
[s04]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/04-wc/specs/SRS.md
[m05]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/05-grep-lite/specs/user-manual.md
[s05]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/05-grep-lite/specs/SRS.md
[m06]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/06-find-lite/specs/user-manual.md
[s06]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/06-find-lite/specs/SRS.md
[m07]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/07-diff-lite/specs/user-manual.md
[s07]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/07-diff-lite/specs/SRS.md
[m08]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/08-env-run/specs/user-manual.md
[s08]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/08-env-run/specs/SRS.md
[m09]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/09-kv-store/specs/user-manual.md
[s09]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/09-kv-store/specs/SRS.md
[m10]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/10-sys-monitor/specs/user-manual.md
[s10]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/10-sys-monitor/specs/SRS.md
