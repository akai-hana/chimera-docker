#!/bin/dash
# open the host's x server to docker (ghostty, firefox, etc)
xhost +local:docker
docker compose up -d
docker exec -u akai -it chimera-akai ghostty
