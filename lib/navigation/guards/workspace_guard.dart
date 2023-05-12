import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:gallium_flutter/repositories/preferences_repository/preferences_repository.dart';

/// Required workspace folder to be set
class WorkspaceGuard extends AutoRouteGuard {
  final PreferenceManager _preferencesRepository;

  WorkspaceGuard({
    required PreferenceManager preferencesRepository,
  }) : _preferencesRepository = preferencesRepository;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final String? workspacePath = PreferenceManager.workspacePath.get(
      _preferencesRepository,
    );

    if (workspacePath != null) {
      final exists = Directory(workspacePath).existsSync();
      if (exists) {
        return resolver.next();
      }
    }

    return resolver.next(false);
  }
}
