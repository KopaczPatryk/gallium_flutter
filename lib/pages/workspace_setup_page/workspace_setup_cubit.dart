import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/repositories/session_repository.dart';

enum WorkspaceSetupState {
  initial,
  valid,
  invalid,
}

class WorkspaceSetupCubit extends Cubit<WorkspaceSetupState> {
  final SessionRepository _sessionRepository;
  String? _path;

  WorkspaceSetupCubit({
    required SessionRepository sessionRepository,
  })  : _sessionRepository = sessionRepository,
        super(WorkspaceSetupState.initial);

  Future<void> pickFolder() async {
    final path = await FilePicker.platform.getDirectoryPath();

    if (path != null && path.isNotEmpty) {
      final exists = Directory(path).existsSync();
      if (exists) {
        _path = path;
        return emit(WorkspaceSetupState.valid);
      }
    }
    return emit(WorkspaceSetupState.invalid);
  }

  Future<void> proceed() async {
    if (state == WorkspaceSetupState.valid) {
      final path = _path;
      if (path == null) {
        throw StateError('Path cannot be null');
      } else {
        await _sessionRepository.saveWorkspace(path);
      }
    }
  }
}
