import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallium_flutter/app.dart';
import 'package:gallium_flutter/cfg/configuration.dart';
import 'package:gallium_flutter/navigation/app_router.gr.dart';
import 'package:gallium_flutter/repositories/hashes_repository.dart';
import 'package:gallium_flutter/repositories/photos_repository.dart';
import 'package:gallium_flutter/repositories/preferences_repository/preferences_repository.dart';
import 'package:gallium_flutter/repositories/providers/database_provider.dart';
import 'package:gallium_flutter/repositories/providers/files_provider.dart';
import 'package:gallium_flutter/repositories/thumbnails_repository.dart';
import 'package:gallium_flutter/services/hashes/hashes_cubit.dart';
import 'package:gallium_flutter/services/thumbnails/thumbnails_cubit.dart';
import 'package:gallium_flutter/utils/bloc/path_provider.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final Configuration _configuration;
  late final DatabaseProvider _databaseProvider;

  late final PreferenceManager _preferencesRepository;
  late final ThumbnailsRepository _thumbnailsRepo;
  late final PhotosRepository _photosRepo;
  late final HashesRepository _hashRepo;

  late final HashesCubit _hashesCubit;
  late final ThumbnailsCubit _thumbnailsCubit;

  @override
  void initState() {
    _configuration = context.read<Configuration>();
    _preferencesRepository = context.read<PreferenceManager>();

    final PathProvider pathProvider = PathProvider(
      configuration: _configuration,
      preferencesRepository: _preferencesRepository,
    );

    final filesProvider = FilesProvider(
      configuration: _configuration,
      preferencesRepository: _preferencesRepository,
      pathProvider: pathProvider,
    );
    _photosRepo = PhotosRepository(
      configuration: _configuration,
      filesProvider: filesProvider,
    );
    _databaseProvider = DatabaseProvider(
      pathProvider: pathProvider,
      preferencesRepository: _preferencesRepository,
    );
    _hashRepo = HashesRepository(
      databaseRepo: _databaseProvider,
      filesProvider: FilesProvider(
        configuration: _configuration,
        preferencesRepository: _preferencesRepository,
        pathProvider: pathProvider,
      ),
      pathProvider: pathProvider,
    );

    _thumbnailsRepo = ThumbnailsRepository(
      configuration: _configuration,
      filesProvider: FilesProvider(
        configuration: _configuration,
        preferencesRepository: _preferencesRepository,
        pathProvider: pathProvider,
      ),
      pathProvider: pathProvider,
      preferencesRepository: _preferencesRepository,
    );

    _hashesCubit = HashesCubit(
      configuration: _configuration,
      photosRepo: _photosRepo,
      hashRepo: _hashRepo,
    );

    _thumbnailsCubit = ThumbnailsCubit(
      configuration: _configuration,
      thumbnailsRepository: _thumbnailsRepo,
      photosRepository: _photosRepo,
    );

    context.read<SessionCubit>().initWorkspace(_init);

    super.initState();
  }

  Future<void> _init() async {
    if (_configuration.forceRegenThumbnails) {
      await _thumbnailsRepo.wipeThumbnails();
    }
    _databaseProvider.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionCubit, SessionState>(
      builder: (context, state) {
        if (state is WorkspaceInitialized) {
          return AutoTabsRouter(
            routes: const [
              PhotoBrowserRoute(),
              PersonBrowserRoute(),
              RouteC(),
            ],
            builder: (context, child) => MultiRepositoryProvider(
              providers: [
                RepositoryProvider.value(
                  value: _thumbnailsRepo,
                ),
                RepositoryProvider.value(
                  value: _photosRepo,
                ),
                RepositoryProvider.value(
                  value: _hashRepo,
                ),
              ],
              child: MultiBlocProvider(
                providers: [
                  BlocProvider.value(
                    value: _hashesCubit,
                  ),
                  BlocProvider.value(
                    value: _thumbnailsCubit,
                  ),
                ],
                child: child,
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
