# Add a repository

This guide brings a new repository online in the `dialectic-playground` organization, so it
matches every other repository: the same files, CI, settings, protection, branding, and
listings. It is the single checklist that the template repository, `safe-settings`, and the
brand-asset documentation all point to.

**Assumes:** you are an organization owner. Only owners can create repositories.

## 1. Decide the name and description

- **Name:** lowercase, hyphenated, short. Language implementations use the language's common
  abbreviation (`py`, `rs`, `go`).
- **Canonical description:** one sentence. It is used, word for word, as the GitHub _About_
  text, in the profile table, on the [Repositories](../reference/repositories.md) page, and in
  the new repository's README.

## 2. Create it from the template

```sh
gh repo create dialectic-playground/<name> --public \
    --template dialectic-playground/repo-template --clone
```

The organization's security configuration (Dependabot, CodeQL, secret scanning with push
protection, private vulnerability reporting) applies automatically. The template also brings
the container-first files: `Makefile`, `Containerfile`, `.devcontainer/`, and the shared
`tools/dp-run` and `tools/container.mk`. The community health
files (Code of Conduct, contributing guide, security policy, issue forms, pull request
template) are inherited from the `.github` repository.

## 3. Apply settings and protection (do this immediately)

The new repository has no branch protection until `safe-settings` runs. In the `.github`
repository, open a pull request that adds `safe-settings/repos/<name>.yml`:

```yaml
repository:
  name: <name>
  description: <canonical description>
  homepage: https://dialectic-playground.github.io/docs/
  topics: [dialectic-playground, <role-topic>, <more topics>]
```

Merging it runs the **Safe Settings** workflow, which applies the organization defaults
(squash-only merges, auto-merge, branch deletion, wiki and projects off, the `maintainers`
team), the **Protect default branch** ruleset, and the About text. Check the result:

```sh
gh api repos/dialectic-playground/<name>/rulesets --jq '.[].name'   # Protect default branch
```

## 4. Finish the template

In the new repository, open the first pull request:

1. Replace every `TEMPLATE:` marker in `README.md`, `Containerfile`, and `Makefile`. CI fails
   until none remain.
2. **Toolchain image:** in `Containerfile`, replace the base image with the official image for
   the repository's toolchain, pinned by digest (`FROM image:tag@sha256:…`). Add only what
   it lacks, such as `make`, and keep `ENV DP_IN_CONTAINER=1`.
3. **Tasks:** add the repository's targets to `Makefile`, inside the `ifeq ($(DP_DELEGATE),)`
   guard. `make check` must run everything CI checks.
4. **CI:** keep the **Container (podman)**, **Native**, **Shared tooling**, **DCO**, and
   **CI result** jobs in `.github/workflows/ci.yml`. Add the native toolchain setup to the
   Native job, and pin every action to a full commit SHA. The organization requires this.
5. Describe the repository's layout in the README, and add its package ecosystems to
   `.github/dependabot.yml` (the `docker` ecosystem is already there).
6. Check it locally: `make check` (container) and `DP_RUNTIME=local make check` (native).

For a **language implementation repository**, follow
[Set up a language repository](set-up-a-language-repository.md) for this step instead.

## 5. Create its brand assets

In the `.github` repository, follow the
[asset workflow](https://github.com/dialectic-playground/.github/blob/main/assets/README.md#adding-assets-for-a-new-repository):

1. Create `assets/<name>/asset.env`, taking the accent and glyph from the palette registry.
2. Run `tools/scaffold-assets.sh <name>`, then `tools/generate-assets.sh <name>`.
3. Change the registry row to _Active_, and add the set to the preview table.

Then, in the new repository's settings, make two UI-only changes. GitHub offers no API for
either:

- **Settings → General → Social preview:** upload `assets/<name>/dist/social-preview.png`.
- **Settings → Moderation options → Reported content:** accept content reports, so the
  Code of Conduct's private _Report content → repository admins_ channel works.

## 6. List it everywhere

| Where                                                               | Change                                                                                                                      |
| :------------------------------------------------------------------ | :-------------------------------------------------------------------------------------------------------------------------- |
| `.github`: `profile/README.md`                                      | Add or update its row (link, canonical description, _Active_)                                                               |
| `docs`: [`reference/repositories.md`](../reference/repositories.md) | Add or update its row                                                                                                       |
| `docs`: [`reference/languages/`](../reference/languages/index.md)   | Language repositories only: update the table and add `<lang>.md` (from `templates/reference.md`) to the page and the `nav:` |

## 7. Verify

- [ ] The **CI result** check passes on `main`, including the Container, Native, and Shared
      tooling jobs.
- [ ] `gh api repos/dialectic-playground/<name>/community/profile --jq .health_percentage` reports `100`.
- [ ] The **Protect default branch** ruleset is present, and the About text matches the
      canonical description.
- [ ] The repository appears in the profile and on the docs site, with the same description
      and status.
- [ ] The social preview is uploaded, and content reporting is enabled.
