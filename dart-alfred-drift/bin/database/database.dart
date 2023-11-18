import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';

import 'models/user_contacts.dart';
import 'models/user_notes.dart';
import 'models/users.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Users, UserContacts, UserNotes])
class Database extends _$Database {
  Database(super.e);

  @override
  int get schemaVersion => 1;
}
