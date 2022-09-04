# mhfz_server
## What is this?
A collection of scripts to generate and start a Monster Hunter Frontier Z (MHFZ) Server. This repo contains a few different components:
* Database
* Server

⚠ At the time of writing, a server will be successfully launched in Docker but it cannot be reached. It is recommended to run the server locally instead ⚠

## Notes
* This tool restores a database backup built off of the MH Frontier Z Community Server. It automatically applies Road Shop Items as part of the backup.
    * This includes server updates 1-8, and client updates 1 & 2

# Installation
## Pre-Requisites
You will need [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed, as all components will be hosted inside Docker containers.

## Optional (Recommended) Configuration
1. Update `./docker-compose.yml` and replace the values for `POSTGRES_USER` and `POSTGRES_PASSWORD` with unique values
2. Set these same values in `./server/Erupe/config.json` in the `database` section

By default, a public server will be hosted on Docker's internal IP address. If you do not want this:
    * Remove the networks configurations in `docker-compose.yml` (lines 10-12, and 37-43)
    * Update `./server/Erupe/config.json` and replace instances of *127.0.0.1* with another value

## Installation Steps
1. Run `docker compose up -d` to initialize the database, pgadmin, and server containers
  * Run `docker compose up db -d` and `docker compose up server -d` if you do not want the PGAdmin database interface container
2. Extract your Quests files into `./server/Erupe`. It should have the following content:
  * ./server/Erupe/bin/quests
  * ./server/Erupe/bin/scenarios 
4. Modify your local hosts file (C:\Windows\System32\drivers\etc\hosts) to include the following:

```
127.0.0.1 mhfg.capcom.com.tw
127.0.0.1 mhf-n.capcom.com.tw
127.0.0.1 cog-members.mhf-z.jp
127.0.0.1 www.capcom-onlinegames.jp
127.0.0.1 srv-mhf.capcom-networks.jp
```

5. Run your MHFZ client, optionally with a locale emulator set to JP.

## Acknowledgement
This project would not be possible without the hard work of the MHF community. Some special shoutouts include:
* [u/Wy4m's guide for running the DB & Server in Unix](https://www.reddit.com/r/MHF/comments/uc5vqn/setting_up_a_monster_hunter_frontier_z_server_on/)
* [The Erupe GitHub repository](https://github.com/xl3lackout/Erupe)