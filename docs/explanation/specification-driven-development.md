# Specification-driven development

Before anyone writes code, every curriculum tool is specified down to the byte: its options,
its output, every error message, its exit statuses, even its help text. Implementations then
live in separate repositories, one per language. This page explains why the project works
this way, and what it costs.

## The specification is the product

Each project ships a chain of documents, each derived from the one before:

1. The **URD** (User Requirements Document) states what users need, in their terms.
2. The **SRS** (Software Requirements Specification) turns each need into precise, testable
   behavior, and traces every requirement back to a user need.
3. The **user manual** describes the tool for its users. Its help text is part of the
   specification.
4. The **black-box tests** turn the SRS into executable examples with exact expected outputs.

When these disagree, the **SRS wins**. That holds even against the maintainers' own reference
models, which exist only to generate and check the expected outputs. With one authority there
is never a debate about which document is right.

## Black-box and white-box together

The byte-exact tests prove that an implementation *behaves* as specified on every platform.
They cannot prove that it is well *engineered*. So every implementation also produces
white-box deliverables: a High-Level Design, a Low-Level Design, a Requirements Traceability
Matrix, and a Master Test Plan. Together they show how the code meets each requirement and
how that was verified. The 20 engineering principles cover what neither kind of test can
see, such as naming, modularity, and error handling.

## Why the implementations are separate

Keeping the specification free of implementations has three effects:

- **Fair comparison.** Every language starts from the same text and is judged by the same
  tests. That makes the implementations directly comparable, which is the "dialectic" in
  Dialectic Playground: the same idea argued out in different languages.
- **No accidental reference solution.** No implementation shapes the specification, and
  learners design from requirements rather than from existing code.
- **Independent pace.** A language repository pins a curriculum release and upgrades when it
  chooses. Specifications evolve through versioned releases, and a MAJOR release signals
  changes that can break conforming implementations.

## Why so much precision?

Vague requirements ("print an error") invite different behavior in each language and on each
operating system, which defeats both comparison and automated grading. Precise requirements
make the expected behavior unambiguous, so every difference a test reveals is a real one. See
[Cross-platform determinism](cross-platform-determinism.md) for how the curriculum removes
platform variation.

## The costs

- **Up-front effort.** Writing an SRS precise enough to produce byte-identical
  implementations takes far longer than writing the tool once.
- **Rigidity.** Implementers cannot improve an error message or reorder output on their own;
  that takes a specification change and a new release.
- **Overkill for exploration.** For throwaway prototypes, this approach is the wrong tool.

For a curriculum whose purpose is comparison, verification, and engineering discipline, these
costs are the point of the exercise rather than overhead.

## Further reading

- The curriculum's [README](https://github.com/dialectic-playground/sdlc-curriculum#philosophy)
  and [contributing guide](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/CONTRIBUTING.md),
  which describes the order in which a specification change touches each document.
- [CLI conventions](https://github.com/dialectic-playground/sdlc-curriculum/blob/main/shared/CLI-CONVENTIONS.md).
