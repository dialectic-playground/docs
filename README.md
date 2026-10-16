<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

**Table of Contents** _generated with [DocToc](https://github.com/thlorenz/doctoc)_

- [docs](#docs)
  - [Structure](#structure)
  - [Building locally](#building-locally)
  - [Publishing](#publishing)
  - [Contributing](#contributing)
  - [Notes on the toolchain](#notes-on-the-toolchain)
  - [License](#license)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/dialectic-playground/.github/main/assets/docs/dist/logo-dark.svg">
    <img alt="dialectic playground / docs" src="https://raw.githubusercontent.com/dialectic-playground/.github/main/assets/docs/dist/logo.svg" height="96">
  </picture>
</p>

# docs

Documentation site for Dialectic Playground, organized with Diátaxis: tutorials, how-to
guides, reference, and explanation.

📖 **Documentation:** <https://dialectic-playground.github.io/docs/>

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
CONTRIBUTING.md               ← authoring rules for this site
Makefile, Containerfile       ← container-first entry points and the toolchain image
.devcontainer/                ← dev container using the same image
tools/dp-run, tools/container.mk ← shared container tooling (copies of the .github canonical files)
.github/workflows/ci.yml      ← CI: container and native builds, shared-tooling check, DCO, Pages deployment
.github/dependabot.yml        ← keeps actions and the docs toolchain current
```

Pages marked _Draft_ describe their planned content and audience. They are completed as real
needs appear, which is how Diátaxis suggests documentation should grow. Pages marked _Ready_
are complete.

## Building locally

Container-first: every target runs in the toolchain container built from
[`Containerfile`](Containerfile) (the official `astral-sh/uv` image with Python 3.12), using
Podman, then Docker, then the local system. Override the choice with
`DP_RUNTIME=podman|docker|local`. You need `make` and Podman or Docker. With
`DP_RUNTIME=local`, you need [uv](https://docs.astral.sh/uv/) instead.

```sh
make serve                       # live preview at http://127.0.0.1:8000/docs/
make check                       # the strict build CI runs; warnings are errors
make dp-shell                    # a shell in the toolchain environment
DP_RUNTIME=local make check      # the same, on your system
```

In the container, the virtual environment lives in the mounted cache
(`~/.cache/dialectic-playground`), so it never conflicts with a local `.venv`.

To change dependencies, run `uv add <package>` or `uv lock --upgrade`, and commit
`pyproject.toml` and `uv.lock` together.

## Publishing

The **CI** workflow (`.github/workflows/ci.yml`) builds the site with `--strict` on
every pull request. Every push to `main` is deployed to GitHub Pages.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md), or the published guide
[Contribute documentation](https://dialectic-playground.github.io/docs/how-to/contribute-documentation/).
Organization-wide rules apply as well: squash merges, Conventional Commit pull request titles,
and DCO sign-off (see the
[organization CONTRIBUTING.md](https://github.com/dialectic-playground/.github/blob/main/CONTRIBUTING.md)).

## Notes on the toolchain

- MkDocs is pinned below 2.0, because MkDocs 2.0 removes the plugin and theme systems that
  Material depends on.
- The configuration uses standard MkDocs and Material settings only. That keeps a future move
  to [Zensical](https://zensical.org), the Material team's successor that reads `mkdocs.yml`,
  a small step.

## License

[MIT](LICENSE)
