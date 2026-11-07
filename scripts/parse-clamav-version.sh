#!/bin/sh
# Print the upstream ClamAV version from the Containerfile FROM line
# (e.g. `FROM clamav/clamav:1.5.4@sha256:...`). Exit 1 if the line is
# missing or has no numeric version tag (accepts x.y and x.y.z).
set -eu
cf=${1:?'usage: parse-clamav-version.sh Containerfile'}
tag=$(sed 's/\r$//' "$cf" | sed -En 's|^[[:space:]]*FROM[[:space:]]+clamav/clamav:([A-Za-z0-9._-]+)(@[^[:space:]]*)?([[:space:]]*#.*)?$|\1|p' | head -n 1)
case "$tag" in
  [0-9]*.[0-9]*) printf '%s\n' "$tag" ;;
  *) echo "ERROR: no numeric clamav/clamav tag found in $cf" >&2; exit 1 ;;
esac
