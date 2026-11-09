#!/bin/sh
set -eu

if [ "$(id -u)" -eq 0 ]; then
    exec /init "$@"
fi

exec /init-unprivileged "$@"
