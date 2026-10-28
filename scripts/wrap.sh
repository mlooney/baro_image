#!/usr/bin/bash
echo "Args: ${*}"
exec /srv/barotrauma/runtime/DedicatedServer "${*}"
