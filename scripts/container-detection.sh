#!/bin/sh
# Shared script to detect Docker or Podman

# Check which container runtimes are available
HAS_DOCKER=$(command -v docker >/dev/null 2>&1 && echo 1 || echo 0)
HAS_PODMAN=$(command -v podman >/dev/null 2>&1 && echo 1 || echo 0)

# Determine which runtime to use
if [ "$HAS_DOCKER" -eq 1 ] && [ "$HAS_PODMAN" -eq 1 ]; then
    echo "Hey, both Docker and Podman are installed."
    while true; do
        printf "Which one would you like to use? (docker/podman): "
        read -r CONTAINER
        case "$CONTAINER" in
            docker|d) CONTAINER="docker"; break ;;
            podman|p) CONTAINER="podman"; break ;;
            *) echo "Couldn't understand that input. Please try again." ;;
        esac
    done
elif [ "$HAS_DOCKER" -eq 1 ]; then
    CONTAINER="docker"
elif [ "$HAS_PODMAN" -eq 1 ]; then
    CONTAINER="podman"
else
    echo "Error: Neither Docker nor Podman is installed."
    echo "Please install one of them to continue."
    exit 1
fi

echo "Detected $CONTAINER. Proceeding to use..."
export CONTAINER
