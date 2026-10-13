# docs

Centralized documentation, comparative guides, and specifications for Dialectic Playground,
published at **<https://dialectic-playground.github.io/docs/>**.

The site is built with [MkDocs](https://www.mkdocs.org/) and
[Material for MkDocs](https://squidfunk.github.io/mkdocs-material/). It is organized with the
[Diátaxis](https://diataxis.fr) framework.

## Structure

Every page is exactly one of the four Diátaxis types, and each type has its own top-level
section (a navigation tab on the site):

```text
docs/                         ← site content (Markdown)
├── index.md                  ← home page: the four quadrants and where to start
├── tutorials/                ← learning-oriented lessons
├── how-to/                   ← task-oriented recipes
├── reference/                ← information-oriented descriptions
│   ├── repositories.md
│   ├── curriculum/           ← index of the sdlc-curriculum specifications (links only)
│   └── languages/            ← language implementation repositories
├── explanation/              ← understanding-oriented discussion
└── assets/                   ← brand assets (copied from .github) and stylesheets
templates/                    ← page skeletons: tutorial, how-to, reference, explanation
overrides/                    ← Material theme extensions
mkdocs.yml                    ← site configuration and navigation
pyproject.toml / uv.lock      ← locked build dependencies
```

Pages marked as placeholders describe their planned content and audience. They are filled
in as real needs appear, which is how Diátaxis suggests documentation should grow.

## Building locally

Requires [uv](https://docs.astral.sh/uv/). It installs Python and the locked dependencies.

```sh
uv sync                          # install the locked toolchain into .venv
uv run mkdocs serve              # live preview at http://127.0.0.1:8000/docs/
uv run mkdocs build --strict     # the same check CI runs; warnings are errors
```

To change dependencies, run `uv add <package>` or `uv lock --upgrade`, and commit
`pyproject.toml` and `uv.lock` together.

## Publishing

The **Docs** workflow (`.github/workflows/deploy.yml`) builds the site with `--strict` on
every pull request. Every push to `main` is deployed to GitHub Pages.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md), or the published guide
[Contribute documentation](https://dialectic-playground.github.io/docs/how-to/contribute-documentation/).

## Notes on the toolchain

- MkDocs is pinned below 2.0, because MkDocs 2.0 removes the plugin and theme systems that
  Material depends on.
- The configuration uses standard MkDocs and Material settings only. That keeps a future move
  to [Zensical](https://zensical.org), the Material team's successor that reads `mkdocs.yml`,
  a small step.

## License

[MIT](LICENSE)
