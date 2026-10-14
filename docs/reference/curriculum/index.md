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

The curriculum has two tracks. Projects 11–52 are on `main` and ship in the next minor
release.

### System-level tooling (00–10)

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

### Applications programming (11–52)

Each project adapts one section of Johnsonbaugh and Kalin, *Applications Programming in ANSI C*
(3rd ed., 1996), as a tool under the same conventions.

| # | Project | Tool(s) | User manual | SRS |
| :-- | :-- | :-- | :-- | :-- |
| 11 | Console Output & Environment Verification | `dp-kinder` | [manual][m11] | [SRS][s11] |
| 12 | Interactive Length Unit Conversion | `dp-convert` | [manual][m12] | [SRS][s12] |
| 13 | Stream-Based Progressive Income Tax Calculator | `dp-taxes` | [manual][m13] | [SRS][s13] |
| 14 | Batch File-Based Progressive Income Tax Calculator | `dp-taxes-file` | [manual][m14] | [SRS][s14] |
| 15 | Single-Pass Streaming Statistical Summary | `dp-stats` | [manual][m15] | [SRS][s15] |
| 16 | ASCII Comic Book Bar Graph Generator | `dp-bargraph` | [manual][m16] | [SRS][s16] |
| 17 | Stream Filtering & Monotonicity Validation | `dp-average`, `dp-chk-sort` | [manual][m17] | [SRS][s17] |
| 18 | Prime Number Generation via Trial Division | `dp-primes` | [manual][m18] | [SRS][s18] |
| 19 | Formatted Annual Calendar Generator | `dp-calendar` | [manual][m19] | [SRS][s19] |
| 20 | Modular Procedural Decomposition & Evaluation | `dp-bargraph2`, `dp-grade` | [manual][m20] | [SRS][s20] |
| 21 | Resistor 3-Band Color Code Decoder | `dp-resistor` | [manual][m21] | [SRS][s21] |
| 22 | Roll Them Bones Dice Simulation Game | `dp-dice` | [manual][m22] | [SRS][s22] |
| 23 | Recursion vs. Iteration Comparative Suite | `dp-fact`, `dp-tower`, `dp-walk-r`, `dp-walk-nr` | [manual][m23] | [SRS][s23] |
| 24 | Divide-and-Conquer Tromino Deficiency Tiling | `dp-tromino` | [manual][m24] | [SRS][s24] |
| 25 | Variadic Functions & Dynamic Arity Processing | `dp-max` | [manual][m25] | [SRS][s25] |
| 26 | Car Dealership Daily Sales & Inventory Tracker | `dp-cars1` | [manual][m26] | [SRS][s26] |
| 27 | Greedy Word-Wrapping Text Formatter | `dp-wrap` | [manual][m27] | [SRS][s27] |
| 28 | Modular Car Sales Architecture & Reporting | `dp-cars2` | [manual][m28] | [SRS][s28] |
| 29 | String Length from First Principles | `dp-strlen` | [manual][m29] | [SRS][s29] |
| 30 | Matrix Multiplication Engine | `dp-matmult` | [manual][m30] | [SRS][s30] |
| 31 | Student Directory Lookup via Selection Sort & Binary Search | `dp-phone` | [manual][m31] | [SRS][s31] |
| 32 | Monte Carlo Forest Fire Percolation Simulation | `dp-perc` | [manual][m32] | [SRS][s32] |
| 33 | Two-Pointer In-Place Sequence Reversal | `dp-reverse` | [manual][m33] | [SRS][s33] |
| 34 | Distributed Parallel Sorting & Stream Merging | `dp-sort-host`, `dp-sort-child` | [manual][m34] | [SRS][s34] |
| 35 | Empirical Algorithm Runtime Benchmarking | `dp-sort-bench` | [manual][m35] | [SRS][s35] |
| 36 | Stream Text Pagination Utility | `dp-page` | [manual][m36] | [SRS][s36] |
| 37 | Interactive Accumulator Calculator | `dp-calc` | [manual][m37] | [SRS][s37] |
| 38 | Greedy Interval Activity Scheduling | `dp-sched` | [manual][m38] | [SRS][s38] |
| 39 | Binary File Byte Size Inspector | `dp-size` | [manual][m39] | [SRS][s39] |
| 40 | Direct-Access Hashed Relative File Storage Engine | `dp-relfile` | [manual][m40] | [SRS][s40] |
| 41 | 1-Nearest Neighbor Film Success Classifier | `dp-films` | [manual][m41] | [SRS][s41] |
| 42 | Enterprise Sales Reporting & Relational Data Integration | `dp-sales` | [manual][m42] | [SRS][s42] |
| 43 | Singly Linked List Foundations | `dp-elephnt1`, `dp-elephnt2` | [manual][m43] | [SRS][s43] |
| 44 | Modal Line-Oriented Text Editor | `dp-line-ed` | [manual][m44] | [SRS][s44] |
| 45 | Comparative Queue & Stack ADT Implementations | `dp-queue1`, `dp-queue2`, `dp-stack1`, `dp-stack2` | [manual][m45] | [SRS][s45] |
| 46 | Shunting-Yard Infix to Postfix Conversion | `dp-infix` | [manual][m46] | [SRS][s46] |
| 47 | Graph Breadth-First Search: Adjacency Matrix vs. Adjacency List | `dp-bfs-adj`, `dp-bfs-link` | [manual][m47] | [SRS][s47] |
| 48 | A* Heuristic Graph Search for European Cities | `dp-astar` | [manual][m48] | [SRS][s48] |
| 49 | Formal Program Verification via Assertions & Loop Invariants | `dp-assert-sort` | [manual][m49] | [SRS][s49] |
| 50 | Structured Exception Handling & Fault Recovery | `dp-divide` | [manual][m50] | [SRS][s50] |
| 51 | Recursive Fractal Geometry: The Koch Snowflake | `dp-koch` | [manual][m51] | [SRS][s51] |
| 52 | Object-Oriented Spacecraft Domain Modeling | `dp-ship` | [manual][m52] | [SRS][s52] |

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
| 11 | kinder | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 12 | convert | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 13 | taxes | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 14 | taxes-file | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 15 | stats | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 16 | bargraph | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 17 | stream-filters | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 18 | primes | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 19 | calendar | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 20 | bargraph-grade | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 21 | resistor | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 22 | dice | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 23 | recursion | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 24 | tromino | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 25 | max | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 26 | cars | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 27 | line-wrap | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 28 | cars-modular | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 29 | strlen | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 30 | matmult | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 31 | phone | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 32 | percolation | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 33 | reverse | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 34 | parallel-sort | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 35 | sort-bench | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 36 | page | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 37 | calc | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 38 | sched | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 39 | size | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 40 | relative-file | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 41 | films | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 42 | sales-report | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 43 | linked-list | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 44 | line-editor | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 45 | queue-stack | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 46 | infix | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 47 | bfs | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 48 | astar | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 49 | assert-sort | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 50 | fault-recovery | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 51 | koch | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |
| 52 | spacecraft | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | — | 0 of 16 |

## Shared specifications

| Document | Describes |
| :-- | :-- |
| [CLI conventions][conv] | Option syntax, diagnostics, exit statuses, and output rules shared by every tool, plus the data, number-formatting, prompt, and random-number rules of Projects 11–52 (CONV-01 … CONV-38) |
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
[m11]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/11-kinder/specs/user-manual.md
[s11]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/11-kinder/specs/SRS.md
[m12]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/12-convert/specs/user-manual.md
[s12]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/12-convert/specs/SRS.md
[m13]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/13-taxes/specs/user-manual.md
[s13]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/13-taxes/specs/SRS.md
[m14]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/14-taxes-file/specs/user-manual.md
[s14]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/14-taxes-file/specs/SRS.md
[m15]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/15-stats/specs/user-manual.md
[s15]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/15-stats/specs/SRS.md
[m16]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/16-bargraph/specs/user-manual.md
[s16]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/16-bargraph/specs/SRS.md
[m17]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/17-stream-filters/specs/user-manual.md
[s17]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/17-stream-filters/specs/SRS.md
[m18]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/18-primes/specs/user-manual.md
[s18]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/18-primes/specs/SRS.md
[m19]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/19-calendar/specs/user-manual.md
[s19]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/19-calendar/specs/SRS.md
[m20]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/20-bargraph-grade/specs/user-manual.md
[s20]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/20-bargraph-grade/specs/SRS.md
[m21]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/21-resistor/specs/user-manual.md
[s21]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/21-resistor/specs/SRS.md
[m22]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/22-dice/specs/user-manual.md
[s22]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/22-dice/specs/SRS.md
[m23]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/23-recursion/specs/user-manual.md
[s23]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/23-recursion/specs/SRS.md
[m24]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/24-tromino/specs/user-manual.md
[s24]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/24-tromino/specs/SRS.md
[m25]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/25-max/specs/user-manual.md
[s25]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/25-max/specs/SRS.md
[m26]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/26-cars/specs/user-manual.md
[s26]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/26-cars/specs/SRS.md
[m27]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/27-line-wrap/specs/user-manual.md
[s27]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/27-line-wrap/specs/SRS.md
[m28]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/28-cars-modular/specs/user-manual.md
[s28]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/28-cars-modular/specs/SRS.md
[m29]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/29-strlen/specs/user-manual.md
[s29]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/29-strlen/specs/SRS.md
[m30]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/30-matmult/specs/user-manual.md
[s30]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/30-matmult/specs/SRS.md
[m31]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/31-phone/specs/user-manual.md
[s31]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/31-phone/specs/SRS.md
[m32]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/32-percolation/specs/user-manual.md
[s32]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/32-percolation/specs/SRS.md
[m33]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/33-reverse/specs/user-manual.md
[s33]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/33-reverse/specs/SRS.md
[m34]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/34-parallel-sort/specs/user-manual.md
[s34]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/34-parallel-sort/specs/SRS.md
[m35]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/35-sort-bench/specs/user-manual.md
[s35]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/35-sort-bench/specs/SRS.md
[m36]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/36-page/specs/user-manual.md
[s36]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/36-page/specs/SRS.md
[m37]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/37-calc/specs/user-manual.md
[s37]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/37-calc/specs/SRS.md
[m38]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/38-sched/specs/user-manual.md
[s38]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/38-sched/specs/SRS.md
[m39]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/39-size/specs/user-manual.md
[s39]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/39-size/specs/SRS.md
[m40]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/40-relative-file/specs/user-manual.md
[s40]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/40-relative-file/specs/SRS.md
[m41]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/41-films/specs/user-manual.md
[s41]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/41-films/specs/SRS.md
[m42]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/42-sales-report/specs/user-manual.md
[s42]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/42-sales-report/specs/SRS.md
[m43]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/43-linked-list/specs/user-manual.md
[s43]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/43-linked-list/specs/SRS.md
[m44]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/44-line-editor/specs/user-manual.md
[s44]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/44-line-editor/specs/SRS.md
[m45]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/45-queue-stack/specs/user-manual.md
[s45]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/45-queue-stack/specs/SRS.md
[m46]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/46-infix/specs/user-manual.md
[s46]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/46-infix/specs/SRS.md
[m47]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/47-bfs/specs/user-manual.md
[s47]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/47-bfs/specs/SRS.md
[m48]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/48-astar/specs/user-manual.md
[s48]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/48-astar/specs/SRS.md
[m49]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/49-assert-sort/specs/user-manual.md
[s49]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/49-assert-sort/specs/SRS.md
[m50]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/50-fault-recovery/specs/user-manual.md
[s50]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/50-fault-recovery/specs/SRS.md
[m51]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/51-koch/specs/user-manual.md
[s51]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/51-koch/specs/SRS.md
[m52]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/52-spacecraft/specs/user-manual.md
[s52]: https://github.com/dialectic-playground/sdlc-curriculum/blob/main/projects/52-spacecraft/specs/SRS.md
