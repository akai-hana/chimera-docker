#!/bin/dash

docker commit chimera-akai chimera-akai:latest
# 2. Tag for cloud registry
docker tag chimera-akai:latest akaihanatsundeee/chimera-akai:latest
# 3. Push to cloud
docker push akaihanatsundeee/chimera-akai:latest

# git sync
git add .
git commit -m "automated sync"
git push
