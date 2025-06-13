# Docker & Docker Compose Cheat Sheet

## Docker Basic Commands

- `docker run [image]`  
  Run a new container from the specified image.

- `docker stop [container]`  
  Stop a running container.

- `docker start [container]`  
  Start a stopped container.

- `docker restart [container]`  
  Restart a running container (stop + start).

- `docker rm [container]`  
  Remove a stopped container.

- `docker ps`  
  List running containers.

- `docker logs [container]`  
  View logs of a container.

---

## Docker Compose Basic Commands

- `docker-compose up`  
  Start all services defined in `docker-compose.yml`. Builds images if needed.

- `docker-compose up -d`  
  Start services in detached (background) mode.

- `docker-compose down`  
  Stop and remove containers, networks, and volumes created by Compose.

- `docker-compose restart [service]`  
  Restart a specific service.

- `docker-compose build`  
  Build or rebuild images without starting containers.

- `docker-compose logs [service]`  
  Show logs for a specific service.

---

## Key Difference: `restart` vs `down + up`

- **`docker-compose restart`**  
  Stops and starts the containers, but **does NOT update** volumes or config changes (like new volume mounts or env vars).

- **`docker-compose down` + `docker-compose up`**  
  Stops and removes containers/networks, then recreates and starts them, applying all config changes including volumes and environment variables.

---

## When to use which?

- Use `restart` for quick restarts without config changes.
- Use `down + up` when you add/change volume mounts, environment variables, or update `docker-compose.yml`.

---

*This cheat sheet is meant as a quick reference to common Docker and Docker Compose commands and their behaviors.*
