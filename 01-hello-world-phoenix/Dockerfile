FROM elixir:1.16.2-slim@sha256:23bed0a183f34bda1382282fbef33bde1569e0cf5dd6cbfa77a001a9232987ab

RUN apt-get update && apt-get install --yes postgresql-client inotify-tools git

WORKDIR /app

RUN mix local.hex --force && \
  mix local.rebar --force && \
  mix archive.install --force hex phx_new

COPY src src
RUN cd src && mix deps.get
