import 'dart:async';

import 'package:gallium_flutter/repositories/preferences_repository/preference_manager.dart';
import 'package:rxdart/rxdart.dart';

class SessionRepository {
  final PreferenceManager _preferencesRepository;

  final BehaviorSubject<String?> _sessionStream;
  Stream<String?> get workspacePathStream => _sessionStream;

  SessionRepository({
    required PreferenceManager preferencesRepository,
  })  : _preferencesRepository = preferencesRepository,
        _sessionStream = BehaviorSubject();

  void init() {
    final path = PreferenceManager.workspacePath.get(_preferencesRepository);
    _sessionStream.add(path);
  }

  Future<void> saveWorkspace(String path) async {
    await PreferenceManager.workspacePath.set(
      preferencesRepository: _preferencesRepository,
      value: path,
    );
    _sessionStream.add(path);
  }
}
