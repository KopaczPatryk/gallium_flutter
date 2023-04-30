import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/navigation/app_router.gr.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:gallium_flutter/repositories/thumbnails_repository.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_cubit.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final Configuration _configuration;
  final AppRouter _router;

  late final ThumbnailsCubit _thumbnailsCubit;

  App({
    required Configuration configuration,
    required ThumbnailsRepository thumbnailsRepo,
    required PhotosRepository photosRepo,
    Key? key,
  })  : _configuration = configuration,
        _thumbnailsCubit = ThumbnailsCubit(
          configuration: configuration,
          thumbnailsRepository: thumbnailsRepo,
          photosRepository: photosRepo,
        ),
        _router = AppRouter(),
        super(key: key) {
    _thumbnailsCubit.init(wipeCache: configuration.forceRegenThumbnails);
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
          BlocProvider.value(value: _thumbnailsCubit),
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
