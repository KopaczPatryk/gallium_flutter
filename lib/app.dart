import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/navigation/app_router.gr.dart';
import 'package:gallium_flutter/services/database/database_bloc.dart';
import 'package:gallium_flutter/services/database/database_bloc_events.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_service.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_service_events.dart';

import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final Configuration _configuration;
  final AppRouter _router;
  late final ThumbnailsBloc _thumbnailsBloc;
  late final DatabaseBloc _databaseBloc;

  App({
    required Configuration configuration,
    Key? key,
  })  : _configuration = configuration,
        _thumbnailsBloc = ThumbnailsBloc(configuration: configuration),
        _databaseBloc = DatabaseBloc(configuration),
        _router = AppRouter(),
        super(key: key) {
    _thumbnailsBloc.add(Init(wipeCache: configuration.forceRegenThumbnails));
    _databaseBloc.add(DatabaseInit());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: MyScrollBehavior(),
      title: 'Gallium flutter',
      routeInformationParser: _router.defaultRouteParser(),
      routerDelegate: _router.delegate(),
      theme: ThemeData.light(),
      builder: (context, router) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _databaseBloc),
          BlocProvider.value(value: _thumbnailsBloc),
        ],
        child: MultiProvider(
          providers: [
            Provider.value(value: _configuration),
          ],
          child: router,
        ),
      ),
    );
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
