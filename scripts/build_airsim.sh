#!/bin/bash

cd ../environment/airsim

# Run docker-compose with this project name
DOCKER_BUILDKIT=1 docker-compose build
