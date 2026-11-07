# ClamAV Container Image

ClamAV container image with database autoupdate

The image defaults to UID `30000` and group `0`. It also supports arbitrary
runtime UID:GID values: `/var/lib/clamav` and `/var/log/clamav` are writable by
the runtime user, and temporary files can be created in `/tmp`.
