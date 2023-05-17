import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gallium_flutter/models/thumbnail_image.dart';

part 'thumbnails_state.freezed.dart';

@Freezed(equal: true)
class ThumbnailsState with _$ThumbnailsState {
  const factory ThumbnailsState.initial() = _$Initial;
  const factory ThumbnailsState.generating({
    @Default([]) List<ThumbnailImage> allThumbnails,
  }) = _$Generating;
  const factory ThumbnailsState.generated({
    required ThumbnailImage newThumbnail,
    required List<ThumbnailImage> allThumbnails,
  }) = _$Generated;
}
