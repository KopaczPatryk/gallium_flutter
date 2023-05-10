import 'dart:io';

import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_hasher/models/hash.dart';

class DatabaseProvider {
  final Configuration cfg;

  DatabaseProvider({
    required this.cfg,
  }) {
    if (!Platform.isWindows) {
      throw Exception(
          'App should not be ran on other platforms except windows');
    }

    Hive.init(cfg.dbPath);
    Hive.registerAdapter(HashAdapter());
  }

  Future<Box<Hash>> getHashBox() async {
    final Box<Hash> box = await Hive.openBox<Hash>('hashes');
    return box;
  }
}
