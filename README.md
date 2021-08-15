# elixirdev
This allows development in phoenix using docker

# How to Use
1. Install Docker on your computer.
2. Download develop.sh, pause.sh, and clean.sh
3. Run develop.sh from the desired development directory. Files from this directory will be accessible in the /app folder of the elixir container.
4. Before running mix phx.server change the hostname in config/dev.exs from localhost to db
5. Run pause.sh and unpause.sh to stop and start the containers, or clean.sh to remove all created networks and containers

# Bash Script Contents
You can also copy these commands to test them out

develop.sh
```
docker network create elixirdev
docker container run -d --name db --net elixirdev --env POSTGRES_PASSWORD=postgres postgres:13.3
docker container run -it --name elixir --net elixirdev -p 4000:4000 --mount type=bind,source="$(pwd)"/,target=/app sapodorado/elixirdev
```

unpause.sh
```
docker container start db elixir
docker exec -it elixir bash
```
pause.sh
```
docker container stop db elixir
```

clean.sh
```
docker container stop db elixir
docker container rm db elixir
docker network rm elixirdev
```
