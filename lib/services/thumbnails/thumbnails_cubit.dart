import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/models/source_image.dart';
import 'package:gallium_flutter/models/thumbnail.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:gallium_flutter/repositories/thumbnails_repository.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_state.dart';

class ThumbnailsCubit extends Cubit<ThumbnailsState> {
  final ThumbnailsRepository _thumbnailsRepository;
  final PhotosRepository _photosRepository;

  final List<Thumbnail> _thumbnails = [];

  ThumbnailsCubit({
    required Configuration configuration,
    required ThumbnailsRepository thumbnailsRepository,
    required PhotosRepository photosRepository,
  })  : _thumbnailsRepository = thumbnailsRepository,
        _photosRepository = photosRepository,
        super(InitialState());

  Future<void> init({
    required bool wipeCache,
  }) async {
    emit(const GeneratingThumbnailsState());

    final photos = await _photosRepository.getExistingPhotos();
    final thumbnails = await _thumbnailsRepository.getExistingThumbnails();

    for (final SourceImage photo in photos) {
      late final Thumbnail thumbnail;
      try {
        thumbnail = thumbnails.firstWhere(
          (thumbnail) => thumbnail.filename == photo.filename,
        );
      } on StateError {
        thumbnail = await _thumbnailsRepository.createThumbnail(
          sourceImage: photo,
        );
      } finally {
        _thumbnails.add(thumbnail);
        await Future.delayed(const Duration(milliseconds: 1), () => null);

        emit(GeneratedThumbnailState(
          allThumbnails: _thumbnails,
          newThumbnail: thumbnail,
        ));
      }
    }
  }
}
