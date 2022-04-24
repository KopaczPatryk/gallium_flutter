import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_hasher/models/hash.dart';

import 'database_bloc_events.dart';
import 'database_bloc_states.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  final Configuration _cfg;
  late final Box<Hash> hashBox;

  DatabaseBloc(Configuration configuration)
      : _cfg = configuration,
        super(DatabaseInitial()) {
    on<DatabaseInit>(_init);
  }

  FutureOr<void> _init(DatabaseInit event, Emitter<DatabaseState> emit) async {
    emit(DatabaseStarting());

    if (!Platform.isWindows) {
      throw Exception(
          'App should not be ran on other platforms except windows');
    }

    Hive.init(_cfg.dbPath);

    Hive.registerAdapter(HashAdapter());

    hashBox = await Hive.openBox<Hash>('hashBox');

    emit(DatabaseStarted());
  }
}
