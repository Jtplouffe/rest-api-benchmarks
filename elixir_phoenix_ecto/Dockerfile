FROM bitwalker/alpine-elixir-phoenix:latest

WORKDIR /app
COPY mix.exs .
COPY mix.lock .

RUN mix deps.get --only prod

COPY . .

ENV MIX_ENV prod

RUN mix compile

ENV DATABASE_URL="postgres://root:root@host.docker.internal/rest_api_benchmarks?sslmode=disable"
ENV SECRET_KEY_BASE="xdwVdoCNcQ978HiiZMCIJWJRO6JDCI0nnYxVgE2OJTqFTvPhiQTtkyALcDauOgB6"
ENV PORT=8080
CMD mix phx.server
