import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:path/path.dart' as p;

class FilesProvider {
  final Configuration configuration;

  const FilesProvider({
    required this.configuration,
  });

  FutureOr<List<File>> getSourceFiles() async {
    final srcFolder = Directory(configuration.basePath);
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
    final thumbnailsPath = p.join(
      configuration.basePath,
      configuration.thumbnailsFolder,
    );
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
}
