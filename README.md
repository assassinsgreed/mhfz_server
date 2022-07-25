# mhfz_server
## What is this?
A collection of scripts to generate and start a Monster Hunter Frontier Z (MHFZ) Server. This repo contains a few different components:
* Database
* Server

## Notes
* This tool restores a database backup built off of the MH Frontier Z Community Server. It automatically applies Road Shop Items as part of the backup.
    * This includes server updates 1-8, and client updates 1 & 2
* By default, a public server will be hosted on IP address *172.24.10.1*. If you do not want this:
    * Remove the networks configurations in `docker-compose.yml` (lines 10-12, and 37-43)
    * Update `./server/Erupe/config.json` and replace instances of *172.24.10.1* with *127.0.0.1*

# Installation
## Pre-Requisites
You will need [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed, as all components will be hosted inside Docker containers.

## Installation Steps
1. Run `docker compose up db -d` to initialize the database
2. Optionally run `docker compose up pgadmin -d` to create a container with the PGAdmin database interface tool
3. Run `docker compose up server -d` to initialize the server
    * This will take a long time to complete (45+ minutes). Grab a coffee and come back later!

## Acknowledgement
This project would not be possible without the hard work of the MHF community. Some special shoutouts include:
* [u/Wy4m's guide for running the DB & Server in Unix](https://www.reddit.com/r/MHF/comments/uc5vqn/setting_up_a_monster_hunter_frontier_z_server_on/)
* [The Erupe GitHub repository](https://github.com/xl3lackout/Erupe)