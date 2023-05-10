import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/navigation/app_router.dart';
import 'package:gallium_flutter/repositories/hashes_repository.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:gallium_flutter/repositories/providers/database_provider.dart';
import 'package:gallium_flutter/repositories/providers/files_provider.dart';
import 'package:gallium_flutter/repositories/thumbnails_repository.dart';
import 'package:gallium_flutter/services/hashes/hashes_cubit.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_cubit.dart';
import 'package:gallium_flutter/utils/bloc/path_provider.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  final Configuration configuration;

  const App({
    required this.configuration,
    Key? key,
  }) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _router;

  late final DatabaseProvider _databaseProvider;

  late final ThumbnailsRepository _thumbnailsRepo;
  late final PhotosRepository _photosRepo;
  late final HashesRepository _hashRepo;

  late final HashesCubit _hashesCubit;
  late final ThumbnailsCubit _thumbnailsCubit;

  @override
  void initState() {
    _router = AppRouter();

    _databaseProvider = DatabaseProvider(
      cfg: widget.configuration,
    );

    _photosRepo = PhotosRepository(
      configuration: widget.configuration,
      filesProvider: FilesProvider(
        configuration: widget.configuration,
      ),
    );

    final PathProvider pathProvider = PathProvider(
      configuration: widget.configuration,
    );

    _hashRepo = HashesRepository(
      databaseRepo: _databaseProvider,
      filesProvider: FilesProvider(
        configuration: widget.configuration,
      ),
      pathProvider: pathProvider,
    );

    _thumbnailsRepo = ThumbnailsRepository(
      configuration: widget.configuration,
      filesProvider: FilesProvider(
        configuration: widget.configuration,
      ),
      pathProvider: pathProvider,
    );

    _hashesCubit = HashesCubit(
      configuration: widget.configuration,
      photosRepo: _photosRepo,
      hashRepo: _hashRepo,
    );

    _thumbnailsCubit = ThumbnailsCubit(
      configuration: widget.configuration,
      thumbnailsRepository: _thumbnailsRepo,
      photosRepository: _photosRepo,
    );

    if (widget.configuration.forceRegenThumbnails) {
      _thumbnailsRepo.wipeThumbnails();
    }

    // _thumbnailsCubit.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: MyScrollBehavior(),
      title: 'Gallium flutter',
      routeInformationParser: _router.defaultRouteParser(),
      routerDelegate: _router.delegate(),
      theme: ThemeData.dark(),
      builder: (context, router) => MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: _hashesCubit,
          ),
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
