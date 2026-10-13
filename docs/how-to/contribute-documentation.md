# Contribute documentation

This guide shows how to add or change a page on this site and get it published.

## Before you start

You need `git` and [uv](https://docs.astral.sh/uv/). uv installs the right Python and the
pinned MkDocs version for you.

```sh
git clone https://github.com/dialectic-playground/docs.git
cd docs
uv sync
```

## 1. Decide which kind of page you are writing

Every page is exactly one of the four Diátaxis types. Two questions decide which:

|  | **Practical steps** (action) | **Theoretical knowledge** (cognition) |
| :-- | :-- | :-- |
| **Serves study** (acquiring a skill) | [Tutorial](../tutorials/index.md) | [Explanation](../explanation/index.md) |
| **Serves work** (applying a skill) | [How-to guide](index.md) | [Reference](../reference/index.md) |

If your draft mixes types, for example a how-to guide that stops to explain design
history, split it. Keep the steps in the guide and link to an explanation page for the
history. [How these docs are organized](../explanation/how-these-docs-are-organized.md) covers
the reasoning behind this.

## 2. Start from the matching template

Copy the template for your page type from `templates/` into the right quadrant directory
under `docs/`:

| Page type | Template | Directory |
| :-- | :-- | :-- |
| Tutorial | `templates/tutorial.md` | `docs/tutorials/` |
| How-to guide | `templates/how-to.md` | `docs/how-to/` |
| Reference | `templates/reference.md` | `docs/reference/` (or a subsection) |
| Explanation | `templates/explanation.md` | `docs/explanation/` |

Name the file in lowercase with hyphens, after its subject. How-to guides are named after
their goal, for example `set-up-a-language-repository.md`.

## 3. Add the page to the navigation

List the page under its quadrant in the `nav:` section of `mkdocs.yml`. Also add it to the
table on the quadrant's `index.md`.

## 4. Preview locally

```sh
uv run mkdocs serve
```

Open <http://127.0.0.1:8000/docs/>. The page reloads as you save.

## 5. Check the build the way CI does

```sh
uv run mkdocs build --strict
```

`--strict` turns warnings into errors: broken links, missing anchors, and pages missing from
the navigation. Pull requests cannot be merged while this fails.

## 6. Open a pull request

Push a branch and open a pull request against `main`. The **CI** workflow builds the site.
After you merge, it deploys to <https://dialectic-playground.github.io/docs/>.

## Linking to the curriculum

Do not copy specifications into this site. Link to the authoritative files in
[`sdlc-curriculum`](https://github.com/dialectic-playground/sdlc-curriculum) instead, for
example a project's `specs/user-manual.md`, so there is a single source of truth.
