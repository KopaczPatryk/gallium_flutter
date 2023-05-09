import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/models/source_image.dart';
import 'package:gallium_flutter/repositories/providers/files_provider.dart';

class PhotosRepository {
  final FilesProvider _filesProvider;

  const PhotosRepository({
    required Configuration configuration,
    required FilesProvider filesProvider,
  }) : _filesProvider = filesProvider;

  Future<List<SourceImage>> getSourceFiles() async {
    final files = await _filesProvider.getSourceFiles();
    return files
        .map(
          (File file) => SourceImage(
            fileImage: FileImage(file),
          ),
        )
        .toList();
  }
}
