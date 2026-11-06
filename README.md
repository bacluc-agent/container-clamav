# ClamAV Container Image

ClamAV container image with database autoupdate

## Tags

| Trigger | Published tags |
| --- | --- |
| Merge / push to `main` | `:main`, latest upstream version (e.g. `:1.5.4`), `:latest` |
| Push of a `v*` git tag | the tag name (e.g. `:v1.5.4-1`) |
| Pull request | `:pr-<number>` |

The upstream-version tag is derived from the `FROM clamav/clamav:<version>` line
in the `Containerfile`, which Renovate keeps current. That tag is **mutable**:
it is repointed whenever the image is rebuilt from the same upstream version.
Merging a `Publish Image`-labeled PR automatically creates a read-only
`vX.Y.Z` release tag and publishes the image as `:vX.Y.Z` — the immutable
release reference. The auto-tags follow strict SemVer only (`^v\d+\.\d+\.\d+$`),
so they are **not** derived from the ClamAV upstream version, and the existing
non-conforming tag `v1.4.2-r0` is ignored: the first auto-tag is `v0.0.1`,
with each additional `Publish Image` label bumping the patch version.
