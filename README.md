# ClamAV Container Image

ClamAV container image with database autoupdate.

## Image tags

- Pull requests build the image for validation but do not push it to the registry.
- A push to the default branch publishes the git-derived branch tag, the
  `CLAMAV_VERSION` tag, and `latest`.
- A release-tag push publishes the git-derived release tag. It does not publish
  `CLAMAV_VERSION` or `latest` implicitly.
- Manual workflow dispatches build the selected ref but do not publish the
  mutable `CLAMAV_VERSION` tag or `latest`.

The `CLAMAV_VERSION` value is kept synchronized with the ClamAV version in the
`Containerfile`; Renovate updates both locations together. The version tag is
mutable, while release tags are immutable references to a git ref.
