// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:gallium_flutter/app.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/repositories/providers/files_provider.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:gallium_flutter/repositories/thumbnails_repository.dart';

// Future<void> blocMain() async {
//   print('----------BLOC----------');

//   /// Create a `CounterBloc` instance.
//   final bloc = ThumbnailsBloc(configuration: Configuration.dev());

//   /// Access the state of the `bloc` via `state`.
//   print(bloc.state);

//   /// Interact with the `bloc` to trigger `state` changes.
//   bloc.add(Init());

//   /// Wait for next iteration of the event-loop
//   /// to ensure event has been processed.
//   await Future<void>.delayed(Duration.zero);

//   /// Access the new `state`.
//   print(bloc.state);

//   /// Close the `bloc` when it is no longer needed.
//   // await bloc.close();
// }

void main() {
  final cfg = Configuration.dev();
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

  // BlocOverrides.runZoned(() {
  //   blocMain();
  // }, blocObserver: SimpleBlocObserver());
}
