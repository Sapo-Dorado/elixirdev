# syntax=docker/dockerfile:1
FROM elixir:1.10.3

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install --force hex phx_new 1.5.10  && \
    apt-get update && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs

EXPOSE 4000

WORKDIR /app
CMD bash