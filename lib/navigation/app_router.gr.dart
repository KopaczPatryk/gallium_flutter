// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:gallium_flutter/pages/dashboard_page.dart' as _i1;
import 'package:gallium_flutter/pages/page_c.dart' as _i2;
import 'package:gallium_flutter/pages/person_browser_page.dart' as _i3;
import 'package:gallium_flutter/pages/photo_browser_page.dart' as _i4;
import 'package:gallium_flutter/pages/splash_screen_page.dart' as _i5;
import 'package:gallium_flutter/pages/workspace_setup_page.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardPage(),
      );
    },
    RouteC.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PageC(),
      );
    },
    PersonBrowserRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PersonBrowserPage(),
      );
    },
    PhotoBrowserRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PhotoBrowserPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreenPage(),
      );
    },
    WorkspaceSetupRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.WorkspaceSetupPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i7.PageRouteInfo<void> {
  const DashboardRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PageC]
class RouteC extends _i7.PageRouteInfo<void> {
  const RouteC({List<_i7.PageRouteInfo>? children})
      : super(
          RouteC.name,
          initialChildren: children,
        );

  static const String name = 'RouteC';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PersonBrowserPage]
class PersonBrowserRoute extends _i7.PageRouteInfo<void> {
  const PersonBrowserRoute({List<_i7.PageRouteInfo>? children})
      : super(
          PersonBrowserRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonBrowserRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PhotoBrowserPage]
class PhotoBrowserRoute extends _i7.PageRouteInfo<void> {
  const PhotoBrowserRoute({List<_i7.PageRouteInfo>? children})
      : super(
          PhotoBrowserRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhotoBrowserRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashScreenPage]
class SplashScreenRoute extends _i7.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.WorkspaceSetupPage]
class WorkspaceSetupRoute extends _i7.PageRouteInfo<void> {
  const WorkspaceSetupRoute({List<_i7.PageRouteInfo>? children})
      : super(
          WorkspaceSetupRoute.name,
          initialChildren: children,
        );

  static const String name = 'WorkspaceSetupRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
