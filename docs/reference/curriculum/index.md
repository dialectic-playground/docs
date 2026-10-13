# Curriculum

The [`sdlc-curriculum`](https://github.com/dialectic-playground/sdlc-curriculum) repository
holds the authoritative specification for every project. This page indexes it; the linked
documents are the source of truth.

| Current release | Spec version | Pin language repositories to |
| :-- | :-- | :-- |
| [v1.0.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.0.0) | `1.0.0` (printed by every tool's `--version`) | the release tag, never a branch |

The links below point to `main`. For the exact text of a release, browse the repository at
its tag.

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

## Shared specifications

| Document | Describes |
| :-- | :-- |
| [CLI conventions][conv] | Option syntax, diagnostics, exit statuses, and output rules shared by every tool (CONV-01 … CONV-30) |
| [BASE-MAKEFILE][make] | The universal build contract: standard targets and `DP_*` hooks |
| [run-tests.py][runner] | Black-box test format and harness conditions |
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
