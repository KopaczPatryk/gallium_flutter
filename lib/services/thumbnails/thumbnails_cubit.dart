import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/models/thumbnail.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:gallium_flutter/repositories/thumbnails_repository.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_state.dart';

class ThumbnailsCubit extends Cubit<ThumbnailsState> {
  final Configuration _configuration;

  final ThumbnailsRepository thumbnailsRepository;
  final PhotosRepository photosRepository;

  final List<Thumbnail> calculated = [];

  ThumbnailsCubit({
    required Configuration configuration,
    required this.thumbnailsRepository,
    required this.photosRepository,
  })  : _configuration = configuration,
        super(InitialState());

  Future<void> init({
    required bool wipeCache,
  }) async {
    if (wipeCache) thumbnailsRepository.wipe();
    emit(const GeneratingThumbnailsState());

    final photos = await photosRepository.getExistingPhotos();
    final thumbnails = await thumbnailsRepository.getExistingThumbnails();

    for (final photo in photos) {
      late final Thumbnail thumbnail;
      try {
        thumbnail = thumbnails.firstWhere(
          (thumbnail) => thumbnail.filename == photo.filename,
        );
      } on StateError {
        thumbnail = await thumbnailsRepository.createThumbnail(photo);
      } finally {
        calculated.add(thumbnail);
        await Future.delayed(const Duration(milliseconds: 1), () => null);

        emit(GeneratedThumbnailState(
          allThumbnails: calculated,
          newThumbnail: thumbnail,
        ));
      }
    }
  }
}
