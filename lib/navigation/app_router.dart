import 'package:auto_route/auto_route.dart';
import 'package:gallium_flutter/pages/dashboard.dart';
import 'package:gallium_flutter/pages/photo_browser_page.dart';
import 'package:gallium_flutter/pages/faces_page.dart';
import 'package:gallium_flutter/pages/page_c.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      path: '/dashboard',
      page: DashboardScreen,
      children: [
        AutoRoute(
          initial: true,
          path: 'photo-browser',
          page: PhotoBrowserPage,
        ),
        AutoRoute(
          path: 'tab2',
          page: FacesPage,
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
