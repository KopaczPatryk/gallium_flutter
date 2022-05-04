import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:gallium_flutter/models/source_image.dart';
import 'package:gallium_flutter/models/thumbnail.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:gallium_flutter/repositories/thumbnails_repository.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_service_events.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_service_states.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as p;
import 'package:bloc/bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';

class ThumbnailsBloc extends Bloc<dynamic, ThumbnailsState> {
  final Configuration _configuration;

  final ThumbnailsRepository thumbnailsRepository;
  final PhotosRepository photosRepository;

  final List<Thumbnail> calculated = [];

  ThumbnailsBloc({
    required Configuration configuration,
    required this.thumbnailsRepository,
    required this.photosRepository,
  })  : _configuration = configuration,
        super(InitialState()) {
    on<Init>(_onInit);
  }

  Future<void> _onInit(Init event, Emitter<ThumbnailsState> emit) async {
    if (event.wipeCache) thumbnailsRepository.wipe();
    emit(const GeneratingThumbnailsState(allThumbnails: []));

    final photos = await photosRepository.getExistingPhotos();
    final thumbnails = await thumbnailsRepository.getExistingThumbnails();

    for (final photo in photos) {
      late Thumbnail thumbnail;
      try {
        thumbnail = thumbnails
            .firstWhere((thumbnail) => thumbnail.filename == photo.filename);
        calculated.add(thumbnail);
      } on StateError {
        thumbnail = await thumbnailsRepository.createThumbnail(photo);
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
