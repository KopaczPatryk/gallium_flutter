// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:gallium_flutter/app.dart';
import 'package:gallium_flutter/cfg/configuration.dart';

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
  runApp(
    App(
      configuration: Configuration.dev(),
    ),
  );

  // BlocOverrides.runZoned(() {
  //   blocMain();
  // }, blocObserver: SimpleBlocObserver());
}
