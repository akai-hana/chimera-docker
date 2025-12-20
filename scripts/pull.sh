#!/bin/sh

# Detect container runtime
if [ -f ./container-detection.sh ]; then
    . ./container-detection.sh
elif [ -f ./container-detection ]; then
    . ./container-detection
else
    echo "Error: container-detection script not found"
    exit 1
fi

# Pull from git
git pull

# Pull container image
$CONTAINER pull ghcr.io/akai-hana/chimera-akai:latest
