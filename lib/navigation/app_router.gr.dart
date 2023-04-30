// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../pages/dashboard_page.dart' as _i1;
import '../pages/page_c.dart' as _i4;
import '../pages/person_browser_page.dart' as _i3;
import '../pages/photo_browser_page.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardPage(),
      );
    },
    PhotoBrowserRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.PhotoBrowserPage(),
      );
    },
    PersonBrowserRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.PersonBrowserPage(),
      );
    },
    RouteC.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.PageC(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/dashboard',
          fullMatch: true,
        ),
        _i5.RouteConfig(
          DashboardRoute.name,
          path: '/dashboard',
          children: [
            _i5.RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardRoute.name,
              redirectTo: 'photo-browser',
              fullMatch: true,
            ),
            _i5.RouteConfig(
              PhotoBrowserRoute.name,
              path: 'photo-browser',
              parent: DashboardRoute.name,
            ),
            _i5.RouteConfig(
              PersonBrowserRoute.name,
              path: 'people-browser',
              parent: DashboardRoute.name,
            ),
            _i5.RouteConfig(
              RouteC.name,
              path: 'tab3',
              parent: DashboardRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i2.PhotoBrowserPage]
class PhotoBrowserRoute extends _i5.PageRouteInfo<void> {
  const PhotoBrowserRoute()
      : super(
          PhotoBrowserRoute.name,
          path: 'photo-browser',
        );

  static const String name = 'PhotoBrowserRoute';
}

/// generated route for
/// [_i3.PersonBrowserPage]
class PersonBrowserRoute extends _i5.PageRouteInfo<void> {
  const PersonBrowserRoute()
      : super(
          PersonBrowserRoute.name,
          path: 'people-browser',
        );

  static const String name = 'PersonBrowserRoute';
}

/// generated route for
/// [_i4.PageC]
class RouteC extends _i5.PageRouteInfo<void> {
  const RouteC()
      : super(
          RouteC.name,
          path: 'tab3',
        );

  static const String name = 'RouteC';
}
