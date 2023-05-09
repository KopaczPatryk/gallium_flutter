import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/models/source_image.dart';
import 'package:gallium_flutter/models/thumbnail_image.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:gallium_flutter/repositories/thumbnails_repository.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_state.dart';

class ThumbnailsCubit extends Cubit<ThumbnailsState> {
  final ThumbnailsRepository _thumbnailsRepository;
  final PhotosRepository _photosRepository;

  final List<ThumbnailImage> _thumbnails = [];

  ThumbnailsCubit({
    required Configuration configuration,
    required ThumbnailsRepository thumbnailsRepository,
    required PhotosRepository photosRepository,
  })  : _thumbnailsRepository = thumbnailsRepository,
        _photosRepository = photosRepository,
        super(InitialState());

  Future<void> init() async {
    emit(const GeneratingThumbnailsState());

    final photos = await _photosRepository.getSourceFiles();
    final thumbnails = await _thumbnailsRepository.getAllThumbnails();

    for (final SourceImage photo in photos) {
      late final ThumbnailImage thumbnail;
      try {
        thumbnail = thumbnails.firstWhere(
          (thumbnail) => thumbnail.filename == photo.filename,
        );
      } on StateError {
        thumbnail = await _thumbnailsRepository.getThumbnail(
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
