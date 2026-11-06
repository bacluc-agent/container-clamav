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
Push a git tag on a `Publish Image`-labeled PR for an immutable, explicitly cut
release tag.
