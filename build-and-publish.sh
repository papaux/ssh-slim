#!/bin/bash

# Build all images
docker build -t papaux/ssh-slim:3.20 --build-arg ALPINE_VERSION=3.20 .
docker build -t papaux/ssh-slim:latest --build-arg ALPINE_VERSION=3.20 .


# Push all images
docker push papaux/ssh-slim:3.20
docker push papaux/ssh-slim:latest

