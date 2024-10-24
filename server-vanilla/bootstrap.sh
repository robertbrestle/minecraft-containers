#!/bin/bash

# check java major version - only for running locally
# Minecraft 1.20+ requires Java 21+
#JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
#if [[ $JAVA_MAJOR_VERSION -lt 21 ]]; then
#  echo "Java 21 is required for Minecraft 1.20.5 or above."
#  echo "https://minecraft.wiki/w/Tutorials/Setting_up_a_server#Java_version"
#  exit 1
#else
#  echo "Found Java $JAVA_MAJOR_VERSION"
#fi

# fetch latest server jar from minecraft.net
# https://www.minecraft.net/en-us/download/server
if ls server.jar 1> /dev/null 2>&1; then
    echo "Found server jar: $(ls -d $PWD/server.jar)"
else
    echo "No server.jar found."
    echo "Please download from https://minecraft.net/download/server"
    exit 1
fi

# create necessary directories and files to mount properly
mkdir -p world
mkdir -p logs

# create server configuration file if it doesn't exist
# https://minecraft.wiki/w/Server.properties
touch server.properties

# build the container
docker build -t server-vanilla .