#!/bin/dash
docker commit chimera-akai chimera-akai:latest
# 2. Tag for cloud registry
docker tag chimera-akai:latest akai-hana/chimera-akai:latest

# 3. Push to cloud
docker push akai-hana/chimera-akai:latest

# git sync
git add .
git commit -m "automated sync"
git push
