# ClamAV Container Image

ClamAV container image with database autoupdate

The image defaults to UID `30000` and group `0`. The entrypoint dispatches to
the upstream root initialization when UID 0 is used and to the upstream
unprivileged initialization for every other UID. Both paths preserve command
arguments and signals.

In the image layer, `/var/lib/clamav` and `/var/log/clamav` are deliberately
`o+rwX`, so an arbitrary in-container UID:GID can update the database and logs.
Temporary files can be created in `/tmp`.

These permissions apply to the image layer only. For bind-mounted database,
log, or temporary-file paths, configure ownership and mode on the host first.
An arbitrary non-root identity cannot repair restrictive mounted paths with
`chown` or other privileged operations. The image cannot make a bind mount
writable when the host-side permissions deny that UID:GID.

Configuration overrides using `CLAMD_CONF_*` and `FRESHCLAM_CONF_*` are applied
only by the root initialization path because the configuration files are
root-owned. Non-root containers must provide configuration before starting the
container or use a writable configuration mount prepared on the host.

The root path creates the ClamAV socket at `/run/clamav/clamd.sock`; the
unprivileged path uses `/tmp/clamd.sock`.
