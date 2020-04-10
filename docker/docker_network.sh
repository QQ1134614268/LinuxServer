#!/usr/bin/env bash
docker network create -d bridge test-net
docker run -itd --name test1 --network test-net ubuntu /bin/bash

docker run -itd --name test2 --network test-net ubuntu /bin/bash
apt-get update
apt install iputils-ping
docker exec -it test2 sh ping test1
