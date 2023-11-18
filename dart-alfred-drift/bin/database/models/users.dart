import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';

import '../../types/json.dart';
import '../database.dart';
import 'user_contacts.dart';
import 'user_notes.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get username => text().withLength(max: 32).unique()();

  TextColumn get email => text().withLength(max: 100).unique()();

  TimestampColumn get createdAt => customType(PgTypes.timestampNoTimezone)();

  TimestampColumn get updatedAt => customType(PgTypes.timestampNoTimezone)();

  TimestampColumn get deletedAt => customType(PgTypes.timestampNoTimezone).nullable()();
}

Json userToJson(
  User user, {
  Iterable<UserContact>? contacts,
  Iterable<UserNote>? notes,
}) =>
    {
      "id": user.id,
      "username": user.username,
      "email": user.email,
      "createdAt": user.createdAt.dateTime.toIso8601String(),
      "updatedAt": user.updatedAt.dateTime.toIso8601String(),
      if (user.deletedAt case final deletedAt?) "deletedAt": deletedAt.dateTime.toIso8601String(),
      if (contacts != null)
        "contacts": [
          for (final contact in contacts) userContactToJson(contact),
        ],
      if (notes != null)
        "notes": [
          for (final note in notes) userNoteToJson(note),
        ],
    };
