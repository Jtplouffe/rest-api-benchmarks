import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';

import '../../types/json.dart';
import '../database.dart';
import 'users.dart';

class UserContacts extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get userId => integer().references(Users, #id)();

  TextColumn get name => text().withLength(max: 100).unique()();

  TextColumn get email => text().withLength(max: 100).unique()();

  TimestampColumn get createdAt => customType(PgTypes.timestampNoTimezone)();

  TimestampColumn get updatedAt => customType(PgTypes.timestampNoTimezone)();

  TimestampColumn get deletedAt => customType(PgTypes.timestampNoTimezone).nullable()();
}

Json userContactToJson(UserContact contact) => {
      "id": contact.id,
      "userId": contact.userId,
      "name": contact.name,
      "email": contact.email,
      "createdAt": contact.createdAt.dateTime.toIso8601String(),
      "updatedAt": contact.updatedAt.dateTime.toIso8601String(),
      if (contact.deletedAt case final deletedAt?) "deletedAt": deletedAt.dateTime.toIso8601String(),
    };
