#!/bin/bash

cd ../environment
# Set your desired project name
PROJECT_NAME="dog-fight"

# Run docker-compose with this project name
docker-compose -p $PROJECT_NAME up
