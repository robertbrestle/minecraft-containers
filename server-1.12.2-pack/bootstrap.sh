#!/bin/bash

# check java major version - only for running locally
# Minecraft 1.12.2 requires Java 8
#JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
#if [[ $JAVA_MAJOR_VERSION -ne 8 ]]; then
#  echo "Java 8 is required for Minecraft 1.12.2."
#  echo "https://minecraft.wiki/w/Tutorials/Setting_up_a_server#Java_version"
#  exit 1
#else
#  echo "Found Java $JAVA_MAJOR_VERSION"
#fi

# fetch latest server jar from The 1.12.2 Pack website - only for running locally
# https://the-1122-pack.com/
#if ls server.jar 1> /dev/null 2>&1; then
#    echo "Found server jar: $(ls -d $PWD/server.jar)"
#else
#    echo "No server.jar found."
#    echo "Please download from https://the-1122-pack.com"
#    exit 1
#fi

# create necessary directories and files to mount properly
mkdir -p world
mkdir -p logs

# create server configuration file if it doesn't exist
# https://minecraft.wiki/w/Server.properties
touch server.properties

# build the container
docker build -t server-1.12.2-pack .