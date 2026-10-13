# Languages

The sixteen language implementation repositories. Each one implements the
[curriculum](../curriculum/index.md) with the same layout and the same `make` targets, built
and tested in its toolchain container and natively on Linux, macOS, and Windows.

| Language | Repository | Extension | Release line | Build / package tool | Status | Projects implemented |
| :-- | :-- | :-- | :-- | :-- | :-- | :-- |
| [C](c.md) | [`c`](https://github.com/dialectic-playground/c) | `.c` | C17 (GCC 16 in the container) | make | Active | [00](https://github.com/dialectic-playground/c/tree/main/00-hello-world) |
| [C#](cs.md) | [`cs`](https://github.com/dialectic-playground/cs) | `.cs` | .NET 10 (LTS) | dotnet CLI (NuGet) | Active | [00](https://github.com/dialectic-playground/cs/tree/main/00-hello-world) |
| [C++](cpp.md) | [`cpp`](https://github.com/dialectic-playground/cpp) | `.cpp` | C++20 (GCC 16 in the container) | CMake | Active | [00](https://github.com/dialectic-playground/cpp/tree/main/00-hello-world) |
| [Go](go.md) | [`go`](https://github.com/dialectic-playground/go) | `.go` | Go 1.27 | Go modules | Active | [00](https://github.com/dialectic-playground/go/tree/main/00-hello-world) |
| [Haskell](hs.md) | [`hs`](https://github.com/dialectic-playground/hs) | `.hs` | GHC 9.14 | cabal | Active | [00](https://github.com/dialectic-playground/hs/tree/main/00-hello-world) |
| [Java](java.md) | [`java`](https://github.com/dialectic-playground/java) | `.java` | Java 25 (LTS, Eclipse Temurin) | Maven | Active | [00](https://github.com/dialectic-playground/java/tree/main/00-hello-world) |
| [JavaScript](js.md) | [`js`](https://github.com/dialectic-playground/js) | `.js` | Node.js 24 (LTS) | npm | Active | [00](https://github.com/dialectic-playground/js/tree/main/00-hello-world) |
| [Julia](jl.md) | [`jl`](https://github.com/dialectic-playground/jl) | `.jl` | Julia 1.13 | Pkg | Active | [00](https://github.com/dialectic-playground/jl/tree/main/00-hello-world) |
| [Objective-C](objc.md) | [`objc`](https://github.com/dialectic-playground/objc) | `.m` | Objective-C with Foundation (GNUstep Base; Apple Foundation on macOS) | GNU Make + `gnustep-config` | Active | [00](https://github.com/dialectic-playground/objc/tree/main/00-hello-world) |
| [Perl](pl.md) | [`pl`](https://github.com/dialectic-playground/pl) | `.pl` | Perl 5.42 | cpanm (cpanfile) | Active | [00](https://github.com/dialectic-playground/pl/tree/main/00-hello-world) |
| [PHP](php.md) | [`php`](https://github.com/dialectic-playground/php) | `.php` | PHP 8.5 | Composer | Active | [00](https://github.com/dialectic-playground/php/tree/main/00-hello-world) |
| [Python](py.md) | [`py`](https://github.com/dialectic-playground/py) | `.py` | Python 3.14 | uv | Active | [00](https://github.com/dialectic-playground/py/tree/main/00-hello-world) |
| [Ruby](rb.md) | [`rb`](https://github.com/dialectic-playground/rb) | `.rb` | Ruby 4.0 | Bundler | Active | [00](https://github.com/dialectic-playground/rb/tree/main/00-hello-world) |
| [Rust](rs.md) | [`rs`](https://github.com/dialectic-playground/rs) | `.rs` | Rust 1.99 | cargo | Active | [00](https://github.com/dialectic-playground/rs/tree/main/00-hello-world) |
| [TypeScript](ts.md) | [`ts`](https://github.com/dialectic-playground/ts) | `.ts` | Node.js 24 (LTS); TypeScript via tsc as a project dependency | npm + tsc | Active | [00](https://github.com/dialectic-playground/ts/tree/main/00-hello-world) |
| [Visual Basic](vb.md) | [`vb`](https://github.com/dialectic-playground/vb) | `.vb` | VB.NET on .NET 10 (LTS) | dotnet CLI (NuGet) | Active | [00](https://github.com/dialectic-playground/vb/tree/main/00-hello-world) |

## Shared layout

Every language repository follows the curriculum's
[language skeleton](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/templates/language/README.md):
a root `Makefile` (`make check` = repository checks + toolchain verification + every project
listed in `IMPLEMENTED`), a toolchain `Containerfile`, the `sdlc-curriculum` submodule pinned
to a release, and one workspace per curriculum project. A project counts as *implemented* once
it is listed in `IMPLEMENTED`; CI then builds and tests it everywhere. Project 00
(`00-hello-world`, `dp-hello`) is implemented in all sixteen repositories, against curriculum
[v1.5.0](https://github.com/dialectic-playground/sdlc-curriculum/releases/tag/v1.5.0); see the
[implementation status](../curriculum/index.md#implementation-status).

## Language characteristics

| Language | CLI classification | Image category | Access to OS primitives | Entry-point mechanism |
| :-- | :-- | :-- | :-- | :-- |
| [C](c.md) | Included | Native Toolchain | Absolute & Direct (POSIX system calls) | Kernel drops argc and argv pointers directly into main() |
| [C#](cs.md) | Included | First-Class | Runtime wraps system arguments into top-level Main() array | Application Level (deep native reflection tools) |
| [C++](cpp.md) | Included | Native Toolchain | Absolute & Direct (POSIX system calls) | Kernel drops argc and argv pointers directly into main() |
| [Go](go.md) | Included | First-Class | High (wrapped for async goroutine scheduler) | Compiled-in runtime sets up engine and slices args to os.Args |
| [Haskell](hs.md) | Included | First-Class | High (via System.Environment primitives) | Compiles to binary; runtime initializes and wraps options to getArgs |
| [Java](java.md) | Included | First-Class | Medium-High (abstracted via ProcessBuilder) | JVM host maps system args into public static void main() |
| [JavaScript](js.md) | Included | First-Class | High (via V8 Node.js runtime wrappers) | Host binary consumes kernel flags first; residual args go to process.argv |
| [Julia](jl.md) | Included | First-Class | High (explicit process wrappers) | Runtime targets calculations but populates global ARGS vector |
| [Objective-C](objc.md) | Included | Native Toolchain | Absolute & Direct (Strict superset of C) | Compiles directly; maps arguments using standard C main structure |
| [Perl](pl.md) | Included | First-Class | Absolute & Direct (original Unix stream system wrapper) | Interpreter maps argument arrays into structural @ARGV variable |
| [PHP](php.md) | Included | First-Class | High (via php-cli and standard streams) | Engine wraps CLI context and exposes args via argv |
| [Python](py.md) | Included | First-Class | High (via sys/os/subprocess) | Interpreter maps args to high-level sys.argv list |
| [Ruby](rb.md) | Included | First-Class | High (via native process automation libraries) | Interpreter bootstraps file and wraps arguments into ARGV array |
| [Rust](rs.md) | Included | First-Class | Absolute & Direct (POSIX + memory boundaries) | Compiles directly to machine code; args mapped via std::env::args() |
| [TypeScript](ts.md) | Included | First-Class | High (via V8 Node.js runtime wrappers) | Host binary consumes kernel flags first; residual args go to process.argv |
| [Visual Basic](vb.md) | Included | First-Class | Medium-High (.NET platform hooks) | Runtime initializes and maps arguments to Main function |

!!! info "Adding a language"
    Follow [Add a repository](../../how-to/add-a-repository.md) and
    [Set up a language repository](../../how-to/set-up-a-language-repository.md), then add a
    page here (from `templates/reference.md`), a row to the tables above, and an entry in the
    `nav:`.
