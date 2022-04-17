// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../pages/dashboard.dart' as _i1;
import '../pages/page_a.dart' as _i2;
import '../pages/page_b.dart' as _i3;
import '../pages/page_c.dart' as _i4;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DashboardScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashboardScreen());
    },
    PageARoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.PageA());
    },
    PageBRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.PageB());
    },
    PageCRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PageC());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: '/dashboard', fullMatch: true),
        _i5.RouteConfig(DashboardScreenRoute.name,
            path: '/dashboard',
            children: [
              _i5.RouteConfig('#redirect',
                  path: '',
                  parent: DashboardScreenRoute.name,
                  redirectTo: 'tab1',
                  fullMatch: true),
              _i5.RouteConfig(PageARoute.name,
                  path: 'tab1', parent: DashboardScreenRoute.name),
              _i5.RouteConfig(PageBRoute.name,
                  path: 'tab2', parent: DashboardScreenRoute.name),
              _i5.RouteConfig(PageCRoute.name,
                  path: 'tab3', parent: DashboardScreenRoute.name)
            ])
      ];
}

/// generated route for
/// [_i1.DashboardScreen]
class DashboardScreenRoute extends _i5.PageRouteInfo<void> {
  const DashboardScreenRoute({List<_i5.PageRouteInfo>? children})
      : super(DashboardScreenRoute.name,
            path: '/dashboard', initialChildren: children);

  static const String name = 'DashboardScreenRoute';
}

/// generated route for
/// [_i2.PageA]
class PageARoute extends _i5.PageRouteInfo<void> {
  const PageARoute() : super(PageARoute.name, path: 'tab1');

  static const String name = 'PageARoute';
}

/// generated route for
/// [_i3.PageB]
class PageBRoute extends _i5.PageRouteInfo<void> {
  const PageBRoute() : super(PageBRoute.name, path: 'tab2');

  static const String name = 'PageBRoute';
}

/// generated route for
/// [_i4.PageC]
class PageCRoute extends _i5.PageRouteInfo<void> {
  const PageCRoute() : super(PageCRoute.name, path: 'tab3');

  static const String name = 'PageCRoute';
}
