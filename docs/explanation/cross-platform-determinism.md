# Cross-platform determinism

Every curriculum tool must produce **byte-identical output** on Linux, macOS, and Windows, in
whatever language it is written. One set of expected outputs then verifies every
implementation on every operating system. This page explains why that matters, what it takes,
and where determinism deliberately stops.

## Why insist on identical bytes?

The curriculum compares implementations in different languages against one specification.
That comparison is only meaningful if "correct" has one definition. Approximate checks, such
as "contains the right words" or "ignores whitespace", would hide exactly the details that
differ between platforms and languages: line endings, error messages, ordering, encoding.
Those details are what the projects set out to teach.

Exactness also helps the people who maintain the tests. Each test has precisely one passing
output, so a failure always points at a real difference, never at a fuzzy matcher.

## The sources of variation, and how each is removed

### Line endings

Windows conventionally ends text lines with CR LF, and many languages' "text mode" streams
silently translate LF to CR LF on output. The conventions require every line a tool
_generates_ to end in a single LF on every platform, with standard streams written in binary
mode. Data a tool _copies_ from its input, such as file contents, passes through unchanged:
CR bytes are data, not line endings. Project 01 (`dp-echo`) and project 02 (`dp-cat`) make this
lesson explicit.

### Error messages

Operating systems word the same failure differently ("No such file or directory" against
"The system cannot find the file specified"). Tools therefore never print OS error text.
They map each failure to a fixed reason from a small table. Messages also use the tool's
canonical name, never `argv[0]`, which varies with paths and `.exe` suffixes.

### Paths and ordering

Path separators differ (`/` against `\`), and directory listings come back in a
filesystem-dependent order. Tools join constructed paths with `/`, which Windows accepts, and
traverse directories in byte-wise sorted order. That order is case-sensitive and ignores the
locale, so it is the same everywhere.

### Locale and encoding

Sorting, character classification, and number formatting can follow the user's locale. The
tools ignore locale entirely. They treat text as UTF-8 and use ASCII rules where
classification matters, such as word boundaries in `dp-wc` or case folding in `dp-grep`.

### Algorithms with more than one right answer

Some problems have several valid outputs. The classic case is diff: different algorithms
produce different, equally minimal edit scripts. Where this happens, the SRS defines **one
canonical answer** mathematically. Implementations may use any algorithm, provided they
produce that answer. Project 07 (`dp-diff`) is the clearest example. Project 05 (`dp-grep`)
avoids the problem by defining a portable regular-expression subset on which every
mainstream regex engine agrees.

## The test harness removes the rest

The black-box runner controls everything outside the tool:

- It starts the tool **directly, never through a shell**, so quoting and globbing cannot
  differ between shells.
- Each test runs in a **fresh temporary copy of its fixtures**, with fresh file modification
  times.
- **Standard input is empty** unless the test redirects it, so no terminal is ever attached.
- The **environment is minimal**: `PATH`, plus the variables Windows needs to start
  processes.

Git itself is part of the picture. On Windows, Git can rewrite line endings at checkout, which
would corrupt fixtures that contain CR LF on purpose. Every repository's `.gitattributes`
checks text out with LF and marks test fixtures as byte-exact.

## Where determinism stops

Some behavior cannot be made byte-identical: live system telemetry (`dp-sysmon`), network
services (the `dp-kv` HTTP API), file locking, and signal delivery. For these, the
specifications define the behavior precisely, but verification moves elsewhere:

- **Deterministic modes** make the logic testable. `dp-sysmon` replays recorded snapshots
  instead of polling the OS, and `dp-kv` is exercised through multi-step tests against a
  temporary store.
- **Integration tests** written by implementers cover the rest. The SRS lists what they must
  check.

## The cost

This is not free. The specifications are long, error messages must be reproduced exactly,
and implementations cannot lean on their platform's defaults. That is the point: the work of
making a program behave identically everywhere is the cross-platform lesson.

## Further reading

- [CLI conventions](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/CLI-CONVENTIONS.md):
  the normative rules (CONV-01 … CONV-38).
- [Run the black-box tests](../how-to/run-the-black-box-tests.md): the most common
  determinism failures and their fixes.
- [Specification-driven development](specification-driven-development.md).
