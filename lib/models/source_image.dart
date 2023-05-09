import 'package:flutter/material.dart';
import 'package:gallium_flutter/models/thumbnail_image.dart';
import 'package:path/path.dart' as p;

class SourceImage implements Comparable<ThumbnailImage> {
  final FileImage fileImage;
  String get filename => p.basename(fileImage.file.path);

  const SourceImage({
    required this.fileImage,
  });

  @override
  int compareTo(ThumbnailImage other) => filename == other.filename ? 0 : -1;
}
