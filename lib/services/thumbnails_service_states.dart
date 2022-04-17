import 'package:gallium_flutter/services/thumbnails_service.dart';

abstract class ThumbnailsState {
  const ThumbnailsState();
}

class InitialState extends ThumbnailsState {}

class GeneratingThumbnailsState extends ThumbnailsState {
  final int photoCount;
  final List<Thumbnail> allThumbnails;

  const GeneratingThumbnailsState({
    required this.photoCount,
    required this.allThumbnails,
  });
}

class GeneratedThumbnailState extends GeneratingThumbnailsState {
  final Thumbnail newThumbnail;

  const GeneratedThumbnailState({
    required int photoCount,
    required List<Thumbnail> allThumbnails,
    required this.newThumbnail,
  }) : super(
          photoCount: photoCount,
          allThumbnails: allThumbnails,
        );

  @override
  String toString() => 'All count: ${allThumbnails.length}';
}

class IdleState extends GeneratingThumbnailsState {
  IdleState({
    required int photoCount,
    required List<Thumbnail> allThumbnails,
  }) : super(
          photoCount: photoCount,
          allThumbnails: allThumbnails,
        );
}
