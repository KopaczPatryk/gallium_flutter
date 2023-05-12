import 'package:auto_route/auto_route.dart';
import 'package:gallium_flutter/navigation/app_router.gr.dart';
import 'package:gallium_flutter/navigation/guards/workspace_guard.dart';
import 'package:gallium_flutter/repositories/preferences_repository/preferences_repository.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  final PreferenceManager preferencesRepository;

  AppRouter({
    required this.preferencesRepository,
  });

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: SplashScreenRoute.page,
        ),
        AutoRoute(
          page: WorkspaceSetupRoute.page,
        ),
        AutoRoute(
          page: DashboardRoute.page,
          guards: [
            WorkspaceGuard(
              preferencesRepository: preferencesRepository,
            )
          ],
          children: [
            AutoRoute(
              initial: true,
              path: 'photo-browser',
              page: PhotoBrowserRoute.page,
            ),
            AutoRoute(
              page: PersonBrowserRoute.page,
            ),
            AutoRoute(
              page: RouteC.page,
            )
          ],
        ),
      ];
}
