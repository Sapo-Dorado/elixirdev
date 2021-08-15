docker network create elixirdev
docker container run -d --name db --net elixirdev --env POSTGRES_PASSWORD=postgres postgres:13.3
docker container run -it --name elixir --net elixirdev -p 4000:4000 --mount type=bind,source="$(pwd)"/,target=/app sapodorado/elixirdev