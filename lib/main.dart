// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gallium_flutter/app.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/repositories/files_provider.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:gallium_flutter/repositories/thumbnails_repository.dart';
import 'package:gallium_flutter/services/database/database_bloc.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_service.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_service_events.dart';

import 'dart:async';

// class SimpleBlocObserver extends BlocObserver {
//   @override
//   void onCreate(BlocBase bloc) {
//     super.onCreate(bloc);
//     print('onCreate -- bloc: ${bloc.runtimeType}');
//   }

//   @override
//   void onEvent(Bloc bloc, Object? event) {
//     super.onEvent(bloc, event);
//     print('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
//   }

//   @override
//   void onChange(BlocBase bloc, Change change) {
//     super.onChange(bloc, change);
//     print(
//         'onChange -- bloc: ${bloc.runtimeType}, value: ${change.nextState.toString()}');
//   }

//   // @override
//   // void onTransition(Bloc bloc, Transition transition) {
//   //   super.onTransition(bloc, transition);
//   // print('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
//   // }

//   @override
//   void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
//     print('onError -- bloc: ${bloc.runtimeType}, error: $error');
//     super.onError(bloc, error, stackTrace);
//   }

//   @override
//   void onClose(BlocBase bloc) {
//     super.onClose(bloc);
//     print('onClose -- bloc: ${bloc.runtimeType}');
//   }
// }

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
