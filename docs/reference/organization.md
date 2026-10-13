# Organization settings

The settings that apply across the `dialectic-playground` organization, and where each one is
defined. When a setting has a source of truth in a file, change it there through a pull
request, never in the GitHub UI.

## Where settings live

| Scope | Source of truth | Applied by |
| :-- | :-- | :-- |
| Repository settings, rulesets, team access, About text | [`.github/safe-settings/`](https://github.com/dialectic-playground/.github/tree/main/safe-settings) | The **Safe Settings** workflow (on change, daily, on demand) |
| Security features | Code security configuration **dialectic-playground standard** | GitHub (enforced; default for new repositories) |
| Organization settings and the Actions policy | Organization settings (GitHub UI / API) | Owners |
| Community health files | [`.github`](https://github.com/dialectic-playground/.github) repository root | GitHub inheritance |
| Repository files (CI, editor and git settings) | [`repo-template`](https://github.com/dialectic-playground/repo-template) | Copied when a repository is created |

## Organization

| Setting | Value |
| :-- | :-- |
| Base permission for members | Read |
| Two-factor authentication | Required |
| Repository creation | Owners only |
| Repository deletion and transfer | Owners only |
| GitHub Pages site creation | Owners only |
| Commit sign-off for web edits | Required |
| Discussions | Organization-wide, backed by the `.github` repository |
| Teams | `maintainers`: admin on every repository; code owner of every repository |
| Plan | GitHub Free. Organization rulesets need GitHub Team, so every repository carries an identical repository-level ruleset instead. |

## GitHub Actions

| Setting | Value |
| :-- | :-- |
| Allowed actions | GitHub-owned, Marketplace verified creators, and these named actions for toolchain setup: `astral-sh/setup-uv`, `haskell-actions/setup`, `julia-actions/setup-julia`, `shivammathur/setup-php`, `ruby/setup-ruby`, `shogo82148/actions-setup-perl`, `msys2/setup-msys2` (each `@*`, still SHA-pinned) |
| Pinning | Every action must be pinned to a full commit SHA (`uses: owner/action@<sha> # vX.Y.Z`) |
| Default `GITHUB_TOKEN` permissions | Read-only; workflows cannot approve pull requests |
| Workflow runs from outside contributors | Require approval for every outside contributor |
| Updates | Dependabot (`github-actions` ecosystem, weekly, grouped) in every repository |

## Security (code security configuration "dialectic-playground standard")

| Feature | State |
| :-- | :-- |
| Dependency graph, Dependabot alerts, Dependabot security updates | Enabled |
| CodeQL code scanning (default setup) | Enabled |
| Secret scanning and push protection | Enabled |
| Private vulnerability reporting | Enabled; see the [security policy](https://github.com/dialectic-playground/.github/blob/main/SECURITY.md) |
| Enforcement | Enforced; repositories cannot disable these features |

## Repository defaults (`safe-settings/settings.yml`)

| Setting | Value |
| :-- | :-- |
| Merge methods | Squash only. The commit title is the pull request title; the body is the commit messages, which keeps DCO sign-offs. |
| After merge | Head branches are deleted automatically |
| Auto-merge, "Update branch" button | Enabled |
| Issues | Enabled, with organization issue forms (blank issues disabled) |
| Wiki, Projects | Disabled (documentation lives on this site) |
| Discussions | Disabled per repository; organization-wide instead |

## Branch protection (ruleset "Protect default branch")

Applied identically to the default branch of every repository, with **no bypass for anyone**,
including organization owners:

| Rule | Effect |
| :-- | :-- |
| Require a pull request | Changes reach `main` only through pull requests. No approval is required; squash is the only merge method. Review threads must be resolved. |
| Require status checks | The **CI result** check, reported by GitHub Actions, must pass |
| Require linear history | No merge commits |
| Block force pushes and deletion | `main` cannot be rewritten or deleted |

## CI conventions (every repository)

| Convention | Detail |
| :-- | :-- |
| Workflow file and name | `.github/workflows/ci.yml`, named **CI**, with every job and step named |
| Jobs | **Container (podman)** and **Native** (both run `make check`), **Shared tooling** (except in `.github`), **DCO**, **CI result** |
| Required check | A final **CI result** job that passes only if every other job succeeded or was skipped |
| DCO | A **DCO** job that fails a pull request if any commit lacks a `Signed-off-by:` line matching its author (bot commits are exempt) |
| Pull request titles | [Conventional Commits](https://www.conventionalcommits.org/); the title becomes the squash commit on `main` |

## Container-first development (every repository)

| Convention | Detail |
| :-- | :-- |
| Where tasks run | In the repository's toolchain container: Podman, then Docker, then the local system (`DP_RUNTIME`) |
| Entry points | `make <goal>` (`make check` = everything CI checks) and `tools/dp-run <command>` |
| Toolchain image | `Containerfile`: an official image pinned by digest, extended only as needed; kept current by Dependabot (`docker`) |
| Shared tooling | `tools/dp-run`, `tools/container.mk`: byte-identical to the canonical copies in `.github` (the **Shared tooling** CI job checks this) |
| CI | A **Container (podman)** job and **Native** jobs run the same `make` targets |

Details: [Container tooling](container-tooling.md).

## Repository files (from `repo-template`)

`LICENSE` (MIT), `.editorconfig`, `.gitattributes` (LF line endings), `.gitignore`,
`.github/CODEOWNERS` (`@dialectic-playground/maintainers`), `.github/dependabot.yml`,
`.github/workflows/ci.yml`, `Makefile`, `Containerfile`, `.devcontainer/devcontainer.json`,
`tools/dp-run`, `tools/container.mk`, and a README skeleton. Each file shares one base across all
repositories, and any repository-specific lines are marked as such.

## See also

- [Add a repository](../how-to/add-a-repository.md): the onboarding checklist that applies all of the above.
- [Repositories](repositories.md): every repository and its status.
