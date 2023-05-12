import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/repositories/preferences_repository/preferences_repository.dart';
import 'package:gallium_flutter/utils/bloc/path_provider.dart';
import 'package:gallium_flutter/utils/mixins/preferences_mixin.dart';

class FilesProvider with PreferencesMixin {
  final PathProvider _pathProvider;
  @override
  PreferenceManager preferencesRepository;

  FilesProvider({
    required this.preferencesRepository,
    required Configuration configuration,
    required PathProvider pathProvider,
  }) : _pathProvider = pathProvider;

  Future<List<File>> getSourceFiles() async {
    final srcFolder = Directory(workspacePath!);
    await srcFolder.create(
      recursive: true,
    );

    final List<File> files = [];
    await for (final file in srcFolder.list()) {
      if (file is File) {
        files.add(file);
      }
    }

    return files;
  }

  FutureOr<List<File>> getThumbnailFiles() async {
    final thumbnailsPath = _pathProvider.getThumbnailFolderPath();
    final srcFolder = Directory(thumbnailsPath);
    await srcFolder.create();

    final List<File> files = [];
    await for (final file in srcFolder.list()) {
      if (file is File) {
        files.add(file);
      }
    }

    return files;
  }

  Future<Uint8List> readImageBytes({
    required String path,
  }) async {
    var file = FileImage(File(path));
    return file.file.readAsBytes();
  }

  File getFile({
    required String path,
  }) {
    return File('$workspacePath\\$path');
  }
}
