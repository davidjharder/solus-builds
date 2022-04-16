#!/usr/bin/env sh
if [ -z "$HELIX_RUNTIME" ]; then
    export HELIX_RUNTIME=/var/lib/helix/runtime
fi

exec /usr/bin/hx-bin "$@"
