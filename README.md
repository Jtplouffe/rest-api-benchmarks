# rest-api-benchmarks

This repository contains a basic implementation (described below) of a REST api using different stacks.
The goal is to mesearue the performance difference. They are no crazy optimization tricks being used, just plain old
api code.

## REST api

The api contains a single route, `GET /user`.
This route may take a `include` query param, with possible values being `contacts` and `notes`. The query param can be
an array, meaning that we may include both contacts and notes.

As for the database, 3 table exists. `users`, `user_contacts`, and `user_notes`.

When querying the route, all users are returned.

## Benchmark

For the benchmark, every implementation is allocated the same resource, being 1 cpu and 128M memory. This limit is
applied via docker.

When runnig the benchmarks, the database is running on the same machine as the api being benchmarked.

The benchmarks are run with [plow](https://github.com/six-ddc/plow), during 60 seconds with 10 connections.

The results should be taken with a grain of salt, as this benchmark is pretty heavy on the ORM, but
it still gives a good idea of the performance of the language / ORM.

### Environment

The benchmarks are run one at a time, with the same data.
They are limited to 1 cpu (Ryzen 7 7700X) and 128M memory.

## Implementations

- [nodejs-nestjs-sequelize](./nodejs-nestjs-sequelize/)
- [go-fiber-bun](./go-fiber-bun/)
- [rust-axum-prisma](./rust-axum-prisma/)
- [elixir-phoenix-ecto](./elixir_phoenix_ecto/)
- [dart-alfred-drift](./dart-alfred-drift/)
