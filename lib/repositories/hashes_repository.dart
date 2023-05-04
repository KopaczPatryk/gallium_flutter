import 'package:gallium_flutter/repositories/providers/database_provider.dart';

class HashesRepository {
  // ignore: unused_field
  final DatabaseProvider _databaseRepo;

  const HashesRepository({
    required DatabaseProvider databaseRepo,
  }) : _databaseRepo = databaseRepo;
}
