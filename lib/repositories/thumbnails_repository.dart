import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:gallium_flutter/models/source_image.dart';
import 'package:gallium_flutter/models/thumbnail.dart';
import 'package:gallium_flutter/repositories/files_provider.dart';
import 'package:gallium_flutter/repositories/thumbnails_repository.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_service_events.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_service_states.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;
import 'package:bloc/bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';

class ThumbnailsRepository {
  final Configuration _configuration;
  final FilesProvider _filesProvider;

  const ThumbnailsRepository({
    required Configuration configuration,
    required FilesProvider filesProvider,
  })  : _configuration = configuration,
        _filesProvider = filesProvider;

  FutureOr<img.Image> _generateThumbnail(Uint8List bytes) async {
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

  Future<File> _saveThumbnail(String filename, img.Image thumbnail) async {
    final path = p.joinAll([
          _configuration.basePath,
          _configuration.thumbnailsFolder,
          filename,
        ]) +
        '.png';

    final result = File(path);
    final bytes = img.encodePng(thumbnail);
    await result.writeAsBytes(bytes);
    return result;
  }

  FutureOr<Thumbnail> createThumbnail(SourceImage sourceImage) async {
    final photoBytes =
        await _filesProvider.readImageBytes(sourceImage.file.path);
    final thumbnail = await _generateThumbnail(photoBytes);
    final thumbnailFile = await _saveThumbnail(sourceImage.filename, thumbnail);

    return Thumbnail(file: thumbnailFile);
  }

  Future<List<Thumbnail>> getExistingThumbnails() async {
    final files = await _filesProvider.getThumbnailFiles();
    return files.map((e) => Thumbnail(file: e)).toList();
  }

  FutureOr<Thumbnail> _generateThumbnail2(SourceImage image) {
    final future = Future(() {
      var file = FileImage(File(image.file.path));
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

      final path = p.joinAll([
            _configuration.basePath,
            _configuration.thumbnailsFolder,
            image.filename,
          ]) +
          '.png';

      final result = File(path);
      result.writeAsBytesSync(img.encodePng(thumbnail));
      return Thumbnail(file: result, imageBytes: bytes);
    });
    return future.then((value) {
      return value;
    });
  }

  void wipe() {
    final thumbnailsPath = p.join(
      _configuration.basePath,
      _configuration.thumbnailsFolder,
    );
    Directory(thumbnailsPath).deleteSync(recursive: true);
  }
}
