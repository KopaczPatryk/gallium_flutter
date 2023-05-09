import 'package:equatable/equatable.dart';
import 'package:gallium_flutter/models/thumbnail_image.dart';

abstract class ThumbnailsState {
  const ThumbnailsState();
}

class InitialState extends ThumbnailsState {}

class GeneratingThumbnailsState extends ThumbnailsState with EquatableMixin {
  final List<ThumbnailImage> allThumbnails;

  @override
  List<Object> get props => [
        allThumbnails,
      ];

  const GeneratingThumbnailsState({
    this.allThumbnails = const [],
  });
}

class GeneratedThumbnailState extends GeneratingThumbnailsState {
  final ThumbnailImage newThumbnail;

  @override
  List<Object> get props => [
        newThumbnail,
        allThumbnails,
      ];

  const GeneratedThumbnailState({
    required List<ThumbnailImage> allThumbnails,
    required this.newThumbnail,
  }) : super(
          allThumbnails: allThumbnails,
        );

  @override
  String toString() => 'All count: ${allThumbnails.length}';
}
