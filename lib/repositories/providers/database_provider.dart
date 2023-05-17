import 'dart:io';

import 'package:gallium_flutter/models/entities/hash_entity.dart';
import 'package:gallium_flutter/repositories/preferences_repository/preference_manager.dart';
import 'package:gallium_flutter/utils/bloc/path_provider.dart';
import 'package:gallium_flutter/utils/mixins/preferences_mixin.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseProvider with PreferencesMixin {
  final PathProvider _pathProvider;
  @override
  PreferenceManager preferencesRepository;

  DatabaseProvider({
    required PathProvider pathProvider,
    required this.preferencesRepository,
  }) : _pathProvider = pathProvider {
    if (!Platform.isWindows) {
      throw Exception(
          'App should not be ran on other platforms except windows');
    }
  }

  void init() {
    Hive.init(_pathProvider.getDatabasePath());
    Hive.registerAdapter(HashEntityAdapter());
  }

  Future<Box<HashEntity>> getHashBox() async {
    final Box<HashEntity> box = await Hive.openBox<HashEntity>('hashes');
    return box;
  }
}
