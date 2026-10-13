# Contributing to the docs

Thank you for improving the Dialectic Playground documentation. The full, step-by-step guide
is published on the site as
[Contribute documentation](https://dialectic-playground.github.io/docs/how-to/contribute-documentation/)
(source: [`docs/how-to/contribute-documentation.md`](docs/how-to/contribute-documentation.md)).

## The rules in brief

1. **One page, one Diátaxis type.** Decide whether the page is a tutorial, how-to guide,
   reference, or explanation, and put it in that section. If a draft mixes types, split it and
   link the parts.

   |  | Action | Cognition |
   | :-- | :-- | :-- |
   | **Study** | Tutorial | Explanation |
   | **Work** | How-to guide | Reference |

2. **Start from a template** in [`templates/`](templates/).
3. **Register the page** in the `nav:` section of `mkdocs.yml` and in its section's `index.md`
   table.
4. **Link, don't copy.** Authoritative specifications live in
   [`sdlc-curriculum`](https://github.com/dialectic-playground/sdlc-curriculum).
5. **Build strictly** before you push: `uv run mkdocs build --strict`.
6. **Open a pull request** against `main`. The **CI** workflow must pass.

## Style

- Use plain, direct language in the second person ("you") for guides and reference, and the
  first person plural ("we") for tutorials.
- Use sentence-case headings, and lowercase, hyphenated file names.
- Put commands in fenced code blocks with a language (`sh`, `text`, …).
