import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/services/database/database_bloc.dart';
import 'package:gallium_flutter/services/database/database_bloc_states.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_hasher/models/hash.dart';

import 'hashes_bloc_events.dart';
import 'hashes_bloc_states.dart';

class HashesBloc extends Bloc<HashesEvent, HashesState> {
  final Configuration _cfg;
  final DatabaseBloc _databaseBloc;
  late final StreamSubscription<dynamic> _databaseBlocSubscription;

  HashesBloc({
    required DatabaseBloc databaseBloc,
    required Configuration configuration,
  })  : _cfg = configuration,
        _databaseBloc = databaseBloc,
        super(HashesInitial()) {
    on<HashesInit>(_init);

    _databaseBlocSubscription = _databaseBloc.stream.listen((event) {
      if (event is DatabaseStarted) {
        add(HashesInit());
      }
    });
  }

  FutureOr<void> _init(HashesInit event, Emitter<HashesState> emit) async {
    emit(HashesStarting());

    

    emit(HashesStarted());
  }

  @override
  Future<void> close() {
    _databaseBlocSubscription.cancel();
    return super.close();
  }
}
