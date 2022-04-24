import 'package:flutter/material.dart';
import 'package:gallium_flutter/app.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/repositories/files_provider.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:gallium_flutter/repositories/thumbnails_repository.dart';

void main() {
  final cfg = Configuration.prod();
  late final ThumbnailsRepository thumbnailsRepo = ThumbnailsRepository(
    configuration: cfg,
    filesProvider: FilesProvider(configuration: cfg),
  );
  late final PhotosRepository photosRepo = PhotosRepository(
    configuration: cfg,
    filesProvider: FilesProvider(configuration: cfg),
  );

  runApp(
    App(
      configuration: cfg,
      thumbnailsRepo: thumbnailsRepo,
      photosRepo: photosRepo,
    ),
  );
}
