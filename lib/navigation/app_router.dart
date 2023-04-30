import 'package:auto_route/auto_route.dart';
import 'package:gallium_flutter/pages/dashboard_page.dart';
import 'package:gallium_flutter/pages/photo_browser_page.dart';
import 'package:gallium_flutter/pages/person_browser_page.dart';
import 'package:gallium_flutter/pages/page_c.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      path: '/dashboard',
      page: DashboardPage,
      children: [
        AutoRoute(
          initial: true,
          path: 'photo-browser',
          page: PhotoBrowserPage,
        ),
        AutoRoute(
          path: 'people-browser',
          page: PersonBrowserPage,
        ),
        AutoRoute(
          path: 'tab3',
          page: PageC,
        )
      ],
    ),
  ],
)
class $AppRouter {}
