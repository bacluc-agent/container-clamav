# ClamAV Container Image

ClamAV container image with database autoupdate

The image supports arbitrary UID:GID via `--user`; `/var/lib/clamav` and
`/var/log/clamav` are world-writable in the image layer. Bind mounts need host-side permissions for the chosen UID.
