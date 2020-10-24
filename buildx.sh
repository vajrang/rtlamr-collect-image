#!/bin/bash

# from https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/

NEWBUILDX=$(docker buildx create --use)
docker buildx build --push --platform linux/arm64,linux/amd64,linux/arm/v7 --tag vajrang/rtlamr-collect:latest .
docker buildx use default
docker buildx rm $NEWBUILDX
docker buildx prune -f
