import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class ThumbnailImage with EquatableMixin {
  final FileImage fileImage;
  String get filename => p.basename(fileImage.file.path);

  @override
  List<Object?> get props {
    return [
      filename,
    ];
  }

  const ThumbnailImage({
    required this.fileImage,
  });

  factory ThumbnailImage.file(File file) {
    return ThumbnailImage(
      fileImage: FileImage(file),
    );
  }
}
