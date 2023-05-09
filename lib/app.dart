import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/navigation/app_router.gr.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:gallium_flutter/repositories/providers/files_provider.dart';
import 'package:gallium_flutter/repositories/thumbnails_repository.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_cubit.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  final Configuration configuration;
  final AppRouter _router;

  App({
    required this.configuration,
    Key? key,
  })  : _router = AppRouter(),
        super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final ThumbnailsRepository thumbnailsRepo;
  late final PhotosRepository photosRepo;
  late final ThumbnailsCubit _thumbnailsCubit;

  @override
  void initState() {
    thumbnailsRepo = ThumbnailsRepository(
      configuration: widget.configuration,
      filesProvider: FilesProvider(
        configuration: widget.configuration,
      ),
    );
    photosRepo = PhotosRepository(
      configuration: widget.configuration,
      filesProvider: FilesProvider(
        configuration: widget.configuration,
      ),
    );

    if (widget.configuration.forceRegenThumbnails) {
      thumbnailsRepo.wipeThumbnails();
    }

    _thumbnailsCubit = ThumbnailsCubit(
      configuration: widget.configuration,
      thumbnailsRepository: thumbnailsRepo,
      photosRepository: photosRepo,
    )..init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: MyScrollBehavior(),
      title: 'Gallium flutter',
      routeInformationParser: widget._router.defaultRouteParser(),
      routerDelegate: widget._router.delegate(),
      theme: ThemeData.dark(),
      builder: (context, router) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: _thumbnailsCubit,
          ),
        ],
        child: MultiProvider(
          providers: [
            Provider.value(
              value: widget.configuration,
            ),
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
