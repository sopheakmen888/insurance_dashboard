# Insurance Management Information System

Initialize database and schema sample data for insurance management information system in docker containers.

### Developement Environment Variables

Create `.env.dev`

```bash
# leave default for postgres, we will initialize a new db from init.sql
POSTGRES_USER=postgres
POSTGRES_DB=postgres
POSTGRES_PASSWORD=postgres

# default login for pgadmin
PGADMIN_DEFAULT_EMAIL=your_default_email
PGADMIN_DEFAULT_PASSWORD=your_default_password
```

### Docker & Docker Compose Commands

```docker
# Build and start containers with environment variables from .env.dev file in detached mode.
docker compose -f compose.local.yml --env-file .env.dev up -d --build

# Stop and remove all containers, networks, and volumes created by docker-compose.
docker compose -f compose.local.yml down

# List all running Docker containers with basic info (ID, name, ports).
docker ps

# List all Docker volumes on the system.
docker volume ls

# Remove a specific Docker volume by name (be cautious as data will be deleted).
docker volume rm <volume_name>

# Open an interactive bash shell inside a running container.
docker exec -it <container_name or id> bash

# View the logs of a specific container for troubleshooting or monitoring.
docker logs <container_name or id>

```

### docker-local.yml

```yml
services:
  postgres:
    image: postgres:14-alpine
    restart: always
    ports:
      - "5432:5432"
    volumes:
      - postgres-data:/var/lib/postgresql/data
      - ./init.sql:/docker-entrypoint-initdb.d/init.sql
    environment:
      - POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
      - POSTGRES_USER=${POSTGRES_USER}
      - POSTGRES_DB=${POSTGRES_DB}

  pgadmin:
    image: dpage/pgadmin4
    restart: always
    ports:
      - "5050:80"
    environment:
      - PGADMIN_DEFAULT_EMAIL=${PGADMIN_DEFAULT_EMAIL}
      - PGADMIN_DEFAULT_PASSWORD=${PGADMIN_DEFAULT_PASSWORD}
    volumes:
      - pgadmin-data:/var/lib/pgadmin

volumes:
  postgres-data:
  pgadmin-data:
```

## Start docker-compose in local

1. Create `.env.dev`
2. Run `docker compose -f compose.local.yml --env-file .env.dev up -d --build`
3. Run `docker ps`
4. Run `docker logs <container_name or id>`
5. Open any browser and go to http://localhost:5050
6. Login with your default login account which was set up in .env.dev

## environment variables

```bash
# postgres database service
POSTGRES_USER=postgres
POSTGRES_DB=postgres
POSTGRES_PASSWORD=postgres

# pgadmin service
PGADMIN_DEFAULT_EMAIL=admin@demo.com
PGADMIN_DEFAULT_PASSWORD=admin123

# pkmis service
DATABASE_URL=postgresql://postgres:postgres@postgres:5432/pkmis_db
SECRET=your_secret
ADMIN_DEFAULT_USERNAME=admin
ADMIN_DEFAULT_EMAIL=admin@demo.com
ADMIN_DEFAULT_PASSWORD=12345678

```
