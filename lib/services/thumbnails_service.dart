import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:gallium_flutter/pages/photo_browser_page.dart';
import 'package:gallium_flutter/services/thumbnails_service_events.dart';
import 'package:gallium_flutter/services/thumbnails_service_states.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;
import 'package:bloc/bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';

class SourceImage implements Comparable<Thumbnail> {
  final FileSystemEntity file;

  get filename => p.basenameWithoutExtension(file.path);

  const SourceImage(this.file);

  @override
  int compareTo(Thumbnail other) => filename == other.filename ? 0 : -1;
}

class Thumbnail {
  final FileSystemEntity file;

  get filename => p.basenameWithoutExtension(file.path);

  const Thumbnail(this.file);
}

class ThumbnailsBloc extends Bloc<dynamic, ThumbnailsState> {
  final Configuration _configuration;

  final List<Thumbnail> calculated = [];

  ThumbnailsBloc({
    required Configuration configuration,
  })  : _configuration = configuration,
        super(InitialState()) {
    on<Init>(_onInit);
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

    final files = srcFiles.map((e) => Thumbnail(e)).toList();
    return files;
  }

  Thumbnail _generateThumbnail(SourceImage image) {
    var file = FileImage(File(image.file.path));
    final bytes = file.file.readAsBytesSync();
    final decodedImage = img.decodeImage(bytes);
    if (decodedImage == null) {
      throw Exception('Unsupported file');
    }
    final thumbnail = img.copyResize(
      decodedImage,
      width: _configuration.thumbnailMaxSize,
    );

    final path = p.joinAll([
          _configuration.basePath,
          _configuration.thumbnailsFolder,
          image.filename,
        ]) +
        '.png';

    final result = File(path);
    result.writeAsBytesSync(img.encodePng(thumbnail));
    return Thumbnail(result);
  }

  Future<void> _onInit(Init event, Emitter<ThumbnailsState> emit) async {
    emit(const GeneratingThumbnailsState(photoCount: 0, allThumbnails: []));

    final photos = _listSourceFiles();
    final thumbnails = _listThumbnails();

    for (var photo in photos) {
      final thumbnail = thumbnails.firstWhere(
        (thumbnail) => thumbnail.filename == photo.filename,
        orElse: () => _generateThumbnail(photo),
      );
      calculated.add(thumbnail);
      emit(GeneratedThumbnailState(
        photoCount: photos.length,
        allThumbnails: calculated,
        newThumbnail: thumbnail,
      ));
    }

    emit(IdleState(
      allThumbnails: thumbnails,
      photoCount: photos.length,
    ));
  }
}
