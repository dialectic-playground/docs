# Cross-platform determinism

!!! info "Planned explanation: this page is a placeholder"
    **Question this page answers:** what does it take for programs in different languages to
    produce byte-identical output on Linux, macOS, and Windows, and why is that worth it?

## Planned discussion

- **Line endings:** why every tool writes LF only, the trap of Windows text-mode streams, and
  why input CR bytes are treated as data.
- **Error messages:** why the curriculum uses a fixed reason table instead of operating-system
  error strings.
- **Paths and ordering:** why tools join paths with `/` and traverse directories in byte-wise
  sorted order.
- **The test harness:** no shell, a minimal environment, fresh fixtures, and empty stdin.
- **Where determinism stops:** live telemetry, networking, locking, and signals, and how
  snapshot replay and integration tests cover them.
- **Git itself:** why `.gitattributes` keeps test fixtures byte-exact on Windows checkouts.
