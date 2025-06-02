# Minecraft Server Project

This is a personal project designed for fun and experimentation with Docker, networking, and cloud deployment. The goal is to run a Minecraft server in a containerized environment, test open ports for internet access, experiment with DNS, and observe server behavior in ECS (Elastic Container Service) environments.

---

## Features

- **Dockerized Minecraft Server**: Easily build and run a Minecraft server using Docker Compose.
- **Multiple Server Modes**: Supports both vanilla/Forge and modded setups via separate Compose files.
- **Customizable Configuration**: Environment variables allow for easy server customization (RAM, difficulty, MOTD, mods, etc).
- **Persistent Data**: Game data is stored in mounted volumes for persistence across container restarts.
- **Network Integration**: Uses an external Docker network for advanced networking scenarios.
- **Cloud Ready**: Designed for easy deployment to cloud services like AWS ECS.

---

## Getting Started

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/)
- (Optional) AWS CLI and ECS setup for cloud deployment

### Quick Start

1. **Clone the repository:**
   ```bash
   git clone <repo-url>
   cd "Minecraft Server"
   ```

2. **Build the Docker images:**
   ```bash
   make build
   ```

3. **Start the server (vanilla/Forge):**
   ```bash
   make up
   ```

4. **Start the modded server:**
   ```bash
   make up-moded
   ```

5. **Stop the server:**
   ```bash
   make down
   # or for modded
   make down-moded
   ```

---

## Directory Structure

```
.
├── Makefile                  # Automation commands for Docker Compose
├── docker-compose.yml        # Main server configuration (vanilla/Forge)
├── docker-compose-mod.yml    # Modded server configuration
├── survival_hardcore/data/   # Persistent data for vanilla/Forge server
├── moded/data/               # Persistent data for modded server
├── mods/                     # Mod files for modded server
├── downloads/                # Downloaded modpacks
└── Readme.md                 # Project documentation
```

---

## Customization

- Edit `docker-compose.yml` or `docker-compose-mod.yml` to change server settings (RAM, difficulty, mods, etc).
- Place your world data or mods in the appropriate folders (`survival_hardcore/data`, `moded/data`, `mods`).

---

## Useful Makefile Commands

- `make build` – Build all Docker images
- `make up` – Start the vanilla/Forge server
- `make up-moded` – Start the modded server
- `make down` – Stop the vanilla/Forge server
- `make down-moded` – Stop the modded server
- `make logs-list SERVICE=minecraft` – Tail logs for the Minecraft service
- `make console SERVICE=minecraft` – Open a bash shell in the Minecraft container

---

## Notes

- The server runs with `ONLINE_MODE=FALSE` by default for easier testing. For public servers, set this to `TRUE`.
- The modded server uses CurseForge API keys and modpack URLs; update these as needed.
- Ensure the external Docker network (`minecraft_network`) exists before starting the server:
  ```bash
  docker network create minecraft_network
  ```

---

## License

This project is for personal use and experimentation.