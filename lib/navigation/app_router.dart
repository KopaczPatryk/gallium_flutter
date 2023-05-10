import 'package:auto_route/auto_route.dart';
import 'package:gallium_flutter/navigation/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/dashboard',
          page: DashboardRoute.page,
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
