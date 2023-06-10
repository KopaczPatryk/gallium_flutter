import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/models/source_image.dart';
import 'package:gallium_flutter/models/thumbnail_image.dart';
import 'package:gallium_flutter/repositories/preferences_repository/preference_manager.dart';
import 'package:gallium_flutter/repositories/providers/files_provider.dart';
import 'package:gallium_flutter/utils/bloc/path_provider.dart';
import 'package:gallium_flutter/utils/mixins/preferences_mixin.dart';
import 'package:image/image.dart' as img;
// import 'package:path/path.dart' as p;

class ThumbnailsRepository with PreferencesMixin {
  final Configuration _configuration;
  final FilesProvider _filesProvider;
  final PathProvider _pathProvider;

  @override
  PreferenceManager preferencesRepository;

  ThumbnailsRepository({
    required Configuration configuration,
    required FilesProvider filesProvider,
    required PathProvider pathProvider,
    required this.preferencesRepository,
  })  : _configuration = configuration,
        _filesProvider = filesProvider,
        _pathProvider = pathProvider;

  Future<img.Image> _generateThumbnail({
    required Uint8List bytes,
  }) async {
    final decodedImage = img.decodeImage(bytes);
    if (decodedImage == null) {
      throw Exception('Unsupported file');
    }
    return img.copyResize(
      decodedImage,
      width: _configuration.thumbnailMaxSize,
      interpolation: img.Interpolation.linear,
    );
  }

  Future<File> _saveThumbnail({
    required String filename,
    required img.Image thumbnail,
  }) async {
    final path = _pathProvider.getThumbnailImagePath(
      filename: filename,
    );

    final result = File(path);
    final bytes = img.encodePng(thumbnail);
    await result.writeAsBytes(bytes);
    return result;
  }

  Future<ThumbnailImage> getThumbnail({
    required SourceImage sourceImage,
  }) async {
    final File file = _filesProvider.getFile(
      path: sourceImage.filename,
    );

    final Uint8List photoBytes = await file.readAsBytes();

    final thumbnail = await _generateThumbnail(
      bytes: photoBytes,
    );

    final thumbnailFile = await _saveThumbnail(
      filename: sourceImage.filename,
      thumbnail: thumbnail,
    );

    return ThumbnailImage(
      fileImage: FileImage(thumbnailFile),
    );
  }

  Future<List<ThumbnailImage>> getAllThumbnails() async {
    final files = await _filesProvider.getThumbnailFiles();
    return files
        .map(
          (File file) => ThumbnailImage.file(
            file,
          ),
        )
        .toList();
  }

  // ignore: unused_element
  Future<ThumbnailImage> _generateThumbnail2({
    required SourceImage image,
  }) {
    return Future(() {
      final bytes = image.fileImage.file.readAsBytesSync();
      final decodedImage = img.decodeImage(bytes);
      if (decodedImage == null) {
        throw Exception('Unsupported file');
      }
      final thumbnail = img.copyResize(
        decodedImage,
        width: _configuration.thumbnailMaxSize,
        interpolation: img.Interpolation.linear,
      );

      final path = _pathProvider.getThumbnailImagePath(
        filename: image.filename,
      );

      final result = File(path);
      result.writeAsBytesSync(
        img.encodePng(thumbnail),
      );

      return ThumbnailImage.file(
        result,
      );
    }).then((ThumbnailImage value) {
      return value;
    });
  }

  Future<void> wipeThumbnails() async {
    final workspace = workspacePath;
    if (workspace == null) {
      return;
    }

    final thumbnailsPath = _pathProvider.getThumbnailFolderPath();

    try {
      final directory = Directory(thumbnailsPath);
      if (await directory.exists()) {
        Directory(thumbnailsPath).delete(
          recursive: true,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Nothing to wipe');
      }
    }
  }
}
