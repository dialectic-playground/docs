# Specification-driven development

!!! info "Planned explanation: this page is a placeholder"
    **Question this page answers:** why does the curriculum fix every tool's behavior down to
    the byte (including error messages and help text) before anyone writes code, and why are
    implementations kept in separate repositories?

## Planned discussion

- **Specification as the single source of truth:** how the URD → SRS → user manual chain
  works, and why the SRS overrules any implementation, including the maintainers'
  reference models.
- **Black-box versus white-box:** what the byte-exact acceptance tests can and cannot
  prove, and why the HLD, LLD, RTM, and test plan are still required.
- **Polyglot comparison:** how one specification makes implementations in different
  languages directly comparable, which is the "dialectic" in Dialectic Playground.
- **Costs and trade-offs:** rigidity, the effort of writing the specs, and when this approach
  is overkill.

Sources: the curriculum's
[README](https://github.com/dialectic-playground/sdlc-curriculum#philosophy) and
[CLI conventions](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/CLI-CONVENTIONS.md).
Start from `templates/explanation.md`.
