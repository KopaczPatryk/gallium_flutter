import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:gallium_flutter/models/source_image.dart';
import 'package:gallium_flutter/models/thumbnail.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_service_events.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_service_states.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;
import 'package:bloc/bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';

class ThumbnailsBloc extends Bloc<dynamic, ThumbnailsState> {
  final Configuration _configuration;

  final List<Thumbnail> calculated = [];

  ThumbnailsBloc({
    required Configuration configuration,
  })  : _configuration = configuration,
        super(InitialState()) {
    on<Init>(_onInit);
  }

  void _wipeCache() {
    final thumbnailsPath = p.join(
      _configuration.basePath,
      _configuration.thumbnailsFolder,
    );
    Directory(thumbnailsPath).deleteSync(recursive: true);
  }

  List<SourceImage> _listSourceFiles() {
    final srcFolder = Directory(_configuration.basePath)..createSync();
    final srcFiles = srcFolder.listSync().whereType<File>();

    final sourceImages = srcFiles.map((e) => SourceImage(e)).toList();
    return sourceImages;
  }

  List<Thumbnail> _listThumbnails() {
    final thumbnailsPath = p.join(
      _configuration.basePath,
      _configuration.thumbnailsFolder,
    );

    final srcFolder = Directory(thumbnailsPath)..createSync();
    final srcFiles = srcFolder.listSync().whereType<File>();

    final files = srcFiles.map((e) => Thumbnail(file: e)).toList();
    return files;
  }

  FutureOr<Thumbnail> _generateThumbnail(SourceImage image) {
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

  Future<void> _onInit(Init event, Emitter<ThumbnailsState> emit) async {
    if (event.wipeCache) _wipeCache();
    emit(const GeneratingThumbnailsState(allThumbnails: []));

    final photos = _listSourceFiles();
    final thumbnails = _listThumbnails();

    for (final photo in photos) {
      late Thumbnail thumbnail;
      try {
        thumbnail = thumbnails
            .firstWhere((thumbnail) => thumbnail.filename == photo.filename);
        calculated.add(thumbnail);
      } on StateError {
        thumbnail = await _generateThumbnail(photo);
        calculated.add(thumbnail);
      } finally {
        await Future.delayed(const Duration(milliseconds: 1), () => null);
        emit(GeneratedThumbnailState(
          allThumbnails: calculated,
          newThumbnail: thumbnail,
        ));
      }
    }
  }
}
