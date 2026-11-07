# ClamAV Container Image

ClamAV container image with database autoupdate

The image defaults to UID `30000` and group `0`. In the image layer,
`/var/lib/clamav` and `/var/log/clamav` are deliberately `o+rwX`, so any
in-container UID:GID can update the database and logs; this is the tradeoff
required to support arbitrary runtime identities without a root entrypoint.
Temporary files can be created in `/tmp`.

These permissions apply to the image layer only. For bind-mounted database,
log, or temporary-file paths, configure ownership and mode on the host first:
`/init-unprivileged` runs as an arbitrary non-root identity and cannot repair
mounted paths with `chown` or other privileged operations.
