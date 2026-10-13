# How these docs are organized

This site follows [Diátaxis](https://diataxis.fr), a systematic approach to technical
documentation created by Daniele Procida. This page explains what Diátaxis is, why we use
it, and how it shapes the site.

## Four needs, four kinds of documentation

Diátaxis starts from the observation that people come to documentation with different
needs. Documentation that tries to meet all of them on one page ends up meeting none of them
well. It names two distinctions:

- **Action or cognition:** does the reader need to *do* something, or to *know* something?
- **Acquisition or application:** is the reader *studying* (building a skill) or *working*
  (using a skill they already have)?

Crossing the two gives four kinds of documentation, each with a single purpose:

|  | **Action** (doing) | **Cognition** (knowing) |
| :-- | :-- | :-- |
| **Acquisition** (study) | Tutorials | Explanation |
| **Application** (work) | How-to guides | Reference |

Each kind has its own character:

| Kind | Oriented to | Answers | Analogy |
| :-- | :-- | :-- | :-- |
| [Tutorials](../tutorials/index.md) | Learning | "Can you teach me to…?" | A cooking lesson |
| [How-to guides](../how-to/index.md) | Tasks | "How do I…?" | A recipe |
| [Reference](../reference/index.md) | Information | "What is…?" | An encyclopedia entry |
| [Explanation](../explanation/index.md) | Understanding | "Why…?" | An essay on culinary history |

## Why we use it

Dialectic Playground has several distinct audiences. Newcomers learn the curriculum,
implementers set up language repositories, reviewers check specifications, and contributors
want to know why the design is the way it is. Diátaxis gives each of them a predictable place
to look. It also gives authors a simple test for every page: *which one need does this
serve?*

## How the site applies it

- **Quadrant first.** The four kinds are the top-level navigation tabs. Topics such as the
  curriculum or a language implementation appear *inside* each quadrant, rather than each
  topic getting its own mini-site.
- **One purpose per page.** When a draft serves two needs, we split it and link the parts.
  For example, a how-to guide links to an explanation page instead of stopping to explain.
- **A single source of truth.** Authoritative specifications live in
  [`sdlc-curriculum`](https://github.com/dialectic-playground/sdlc-curriculum). The Reference
  quadrant indexes them and links to them instead of copying them.
- **Templates.** `templates/` in this repository has a starting skeleton for each kind of
  page. See [Contribute documentation](../how-to/contribute-documentation.md).
- **Grow organically.** Diátaxis discourages planning large empty structures. Each quadrant
  starts small and gains pages as real needs appear. Pages marked *Draft* describe the
  content planned for them, so the structure communicates intent.

## Further reading

- [diataxis.fr](https://diataxis.fr): the framework's own documentation, itself organized
  with Diátaxis.
