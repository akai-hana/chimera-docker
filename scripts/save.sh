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

# 1. Commit container to image
$CONTAINER commit chimera-akai chimera-akai:latest

# 2. Tag for cloud registry
$CONTAINER tag chimera-akai:latest ghcr.io/akai-hana/chimera-akai:latest

# 3. Push to cloud
$CONTAINER push ghcr.io/akai-hana/chimera-akai:latest

# Git sync
git add .
git commit -m "automated sync"
git push
