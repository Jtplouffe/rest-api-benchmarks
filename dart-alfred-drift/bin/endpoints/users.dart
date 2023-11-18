import 'dart:io';

import 'package:alfred/alfred.dart';
import 'package:get_it/get_it.dart';

import '../database/database.dart';
import '../database/models/users.dart';

enum UserInclude {
  contacts("contacts"),
  notes("notes");

  final String value;

  const UserInclude(this.value);

  static List<UserInclude> fromValues(Iterable<String> values) => [
        for (final value in UserInclude.values)
          if (values.contains(value.value)) value,
      ];
}

Future getUsers(HttpRequest request, HttpResponse response) async {
  final includes = switch (request.uri.queryParametersAll) {
    {"include": final include} => UserInclude.fromValues(include),
    _ => const <UserInclude>[],
  };

  final database = GetIt.I<Database>();
  final users = await (database.select(database.users)..where((users) => users.deletedAt.isNull())).get();

  final userIds = users.map((user) => user.id);

  final includedModels = await Future.wait([
    Future.sync(() {
      if (includes.contains(UserInclude.contacts)) {
        return (database.select(database.userContacts)..where((userContacts) => userContacts.userId.isIn(userIds)))
            .get();
      } else {
        return const <UserContact>[];
      }
    }),
    Future.sync(() {
      if (includes.contains(UserInclude.notes)) {
        return (database.select(database.userNotes)..where((userNotes) => userNotes.userId.isIn(userIds))).get();
      } else {
        return const <UserNote>[];
      }
    }),
  ]);
  final contacts = includedModels[0] as List<UserContact>;
  final notes = includedModels[1] as List<UserNote>;

  return [
    for (final user in users)
      userToJson(
        user,
        contacts: contacts.where((contact) => contact.userId == user.id),
        notes: notes.where((note) => note.userId == user.id),
      ),
  ];
}
