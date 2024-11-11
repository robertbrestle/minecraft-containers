# minecraft-containers
Containers for running various Minecraft servers.

Built and tested on Ubuntu 22.04.

---

# server-vanilla

These are instructions for running a Minecraft vanilla server. Please visit the [Minecraft wiki](https://minecraft.wiki/w/Tutorials/Setting_up_a_server) for more information on setting up a server.

## Prerequisites

- Download the latest Minecraft vanilla `server.jar` from [minecraft.net](https://www.minecraft.net/en-us/download/server) into this directory

## Build Image

`docker build -t server-vanilla .`

Linux users can run `bootstrap.sh` to build and create the files necessary for the following compose steps.

## Compose

Make sure you have the following files in the same directory as your `compose.yml`
- `world/`
- `logs/`
- `server.properties`
  - you can run the server locally to have one generated, or you can download the file contents from the [minecraft.wiki](https://minecraft.wiki/w/Server.properties)

You can edit `compose.yml` to add configuration files to your server. If you make changes to these files while the server is running, you will need to restart the container for them to take effect.

---

# server-1.12.2-pack

These are instructions for running The 1.12.2 Pack, a Minecraft 1.12.2 server with over 300 mods.

For more information:

- [Minecraft Wiki: Setting up a server](https://minecraft.wiki/w/Tutorials/Setting_up_a_server)
- [Technic modack](https://www.technicpack.net/modpack/the-1122-pack.1406454)
- [The 1.12.2 Pack official website](https://the-1122-pack.com/)

## Prerequisites

Check for the latest pack version on [The 1.12.2 Pack official website](https://the-1122-pack.com/), and substitute the `ENV PACK` value in the `Dockerfile`.

## Build Image

`docker build -t server-1.12.2-pack .`

Linux users can run `bootstrap.sh` to build and create the files necessary for the following compose steps.

## Compose

Make sure you have the following files in the same directory as your `compose.yml`
- `world/`
- `logs/`
- `server.properties`
  - you can run the server locally to have one generated, or you can download the file contents from the [minecraft.wiki](https://minecraft.wiki/w/Server.properties)
  - please note this is an older version of minecraft, so you may need to reference an [older version of server.properties](https://minecraft.wiki/w/Server.properties?oldid=1141217)

You can edit `compose.yml` to add configuration files to your server. If you make changes to these files while the server is running, you will need to restart the container for them to take effect.

# Startup Scripts

## Systemd
Each container folder comes a systemd service for running compose.

To configure:
1. Modify the `minecraft-server-vanilla.service` for your setup  
2. Copy the service to `/etc/systemd/system/`  
3. Reload the daemon `sudo systemctl daemon-reload`
4. Start the service `sudo systemctl start minecraft-server-vanilla.service`  
   - verify the container runs as expected  
     - Docker: `docker ps -a`
     - Service logs: `journalctl -u minecraft-server-vanilla.service`  
     - Minecraft logs: `tail -f /opt/minecraft-containers/server-vanilla/logs/latest.log`  
5. Enable the service to run at system startup `sudo systemctl enable minecraft-server-vanilla.service`  


&nbsp;
