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

# Set compose file based on runtime
COMPOSE_FILE="${CONTAINER}-compose.yml"

# Open the host's X server to the container runtime
xhost +local:$CONTAINER

# Start services and attach to container
$CONTAINER compose -f "$COMPOSE_FILE" up -d
$CONTAINER exec -u root -it chimera-akai ghostty
