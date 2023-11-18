import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';

import '../../types/json.dart';
import '../database.dart';
import 'users.dart';

class UserNotes extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().references(Users, #id)();

  TextColumn get title => text().withLength(max: 100).unique()();

  TextColumn get content => text().unique()();

  TimestampColumn get createdAt => customType(PgTypes.timestampNoTimezone)();

  TimestampColumn get updatedAt => customType(PgTypes.timestampNoTimezone)();

  TimestampColumn get deletedAt => customType(PgTypes.timestampNoTimezone).nullable()();
}

Json userNoteToJson(UserNote note) => {
      "id": note.id,
      "userId": note.userId,
      "title": note.title,
      "content": note.content,
      "createdAt": note.createdAt.dateTime.toIso8601String(),
      "updatedAt": note.updatedAt.dateTime.toIso8601String(),
      if (note.deletedAt case final deletedAt?) "deletedAt": deletedAt.dateTime.toIso8601String(),
    };
