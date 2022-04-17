import 'package:auto_route/auto_route.dart';
import 'package:gallium_flutter/pages/dashboard.dart';
import 'package:gallium_flutter/pages/page_a.dart';
import 'package:gallium_flutter/pages/page_b.dart';
import 'package:gallium_flutter/pages/page_c.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      path: '/dashboard',
      page: DashboardScreen,
      children: [
        AutoRoute(
          initial: true,
          path: 'tab1',
          page: PageA,
        ),
        AutoRoute(
          path: 'tab2',
          page: PageB,
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
