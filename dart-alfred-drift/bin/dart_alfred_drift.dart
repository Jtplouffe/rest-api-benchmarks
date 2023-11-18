import 'package:alfred/alfred.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:get_it/get_it.dart';
import 'package:postgres/postgres_v3_experimental.dart';

import 'database/database.dart';
import 'endpoints/users.dart';

void main() async {
  GetIt.instance.registerSingleton(
    Database(
      PgDatabase(
        endpoint: PgEndpoint(
          host: "host.docker.internal",
          database: "rest_api_benchmarks",
          username: "root",
          password: "root",
        ),
      ),
    ),
  );

  final alfred = Alfred(logLevel: LogType.error);
  alfred.get("/user", getUsers);

  await alfred.listen(8080);
}
