import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/models/source_image.dart';
import 'package:gallium_flutter/models/thumbnail.dart';
import 'package:gallium_flutter/repositories/providers/files_provider.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;

class ThumbnailsRepository {
  final Configuration _configuration;
  final FilesProvider _filesProvider;

  const ThumbnailsRepository({
    required Configuration configuration,
    required FilesProvider filesProvider,
  })  : _configuration = configuration,
        _filesProvider = filesProvider;

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
    final path = p.joinAll(
          [
            _configuration.basePath,
            _configuration.thumbnailsFolder,
            filename,
          ],
        ) +
        '.png';

    final result = File(path);
    final bytes = img.encodePng(thumbnail);
    await result.writeAsBytes(bytes);
    return result;
  }

  FutureOr<Thumbnail> createThumbnail({
    required SourceImage sourceImage,
  }) async {
    final photoBytes = await _filesProvider.readImageBytes(
      path: sourceImage.file.path,
    );
    final thumbnail = await _generateThumbnail(
      bytes: photoBytes,
    );
    final thumbnailFile = await _saveThumbnail(
      filename: sourceImage.filename,
      thumbnail: thumbnail,
    );

    return Thumbnail(
      file: thumbnailFile,
    );
  }

  Future<List<Thumbnail>> getExistingThumbnails() async {
    final files = await _filesProvider.getThumbnailFiles();
    return files
        .map(
          (File file) => Thumbnail(
            file: file,
          ),
        )
        .toList();
  }

  // ignore: unused_element
  Future<Thumbnail> _generateThumbnail2({
    required SourceImage image,
  }) {
    return Future(() {
      var file = FileImage(
        File(
          image.file.path,
        ),
      );
      final bytes = file.file.readAsBytesSync();
      final decodedImage = img.decodeImage(bytes);
      if (decodedImage == null) {
        throw Exception('Unsupported file');
      }
      final thumbnail = img.copyResize(
        decodedImage,
        width: _configuration.thumbnailMaxSize,
        interpolation: img.Interpolation.linear,
      );

      final path = p.joinAll(
            [
              _configuration.basePath,
              _configuration.thumbnailsFolder,
              image.filename,
            ],
          ) +
          '.png';

      final result = File(path);
      result.writeAsBytesSync(
        img.encodePng(thumbnail),
      );
      return Thumbnail(
        file: result,
        imageBytes: bytes,
      );
    }).then((Thumbnail value) {
      return value;
    });
  }

  Future<void> wipeThumbnails() async {
    final thumbnailsPath = p.join(
      _configuration.basePath,
      _configuration.thumbnailsFolder,
    );

    try {
      await Directory(thumbnailsPath).delete(
        recursive: true,
      );
    } catch (e) {
      if (kDebugMode) {
        print('Nothing to wipe');
      }
    }
  }
}
